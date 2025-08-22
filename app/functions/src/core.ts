import { getFirestore } from "firebase-admin/firestore";
import { CloudTasksClient, protos } from "@google-cloud/tasks";
import * as logger from "firebase-functions/logger";
import { toZonedTime, fromZonedTime } from "date-fns-tz";
import { PROJECT_ID, LOCATION, QUEUE_NAME } from "./config";
import { Place } from "./types";

// updateAndReschedule will now take firestore and tasksClient as arguments
export async function updateAndReschedule(
  firestore: ReturnType<typeof getFirestore>,
  tasksClient: CloudTasksClient,
  collectionPath: string,
  placeId: string,
  placeData: Place | undefined
) {
  // 1. Cancel all existing tasks for this place
  if (placeData && placeData.scheduledTaskNames) {
    for (const taskName of Object.values(placeData.scheduledTaskNames)) {
      if (taskName && typeof taskName === "string") {
        logger.info(`Deleting old task: ${taskName}`);
        await tasksClient.deleteTask({ name: taskName }).catch((err) => {
          if (err.code !== 5) {
            logger.error(`Error deleting task ${taskName}:`, err);
          }
        });
      }
    }
  }

  if (!placeData) {
    logger.info(`Document ${placeId} deleted. All tasks cancelled.`);
    return;
  }

  logger.info(`Processing place: ${placeId} (${placeData.name})`);

  // 2. Determine the correct current status and next transition
  const { newStatus, nextTransition } = calculateStatusAndNextTransition(placeData);

  // 3. Update Firestore only if the status has changed
  let newScheduledTaskNames = placeData.scheduledTaskNames || {};
  if (placeData.isOpen !== newStatus) {
    logger.info(`Status for ${placeId} changed to ${newStatus}. Updating document.`);
    newScheduledTaskNames = {};
    await firestore.collection(collectionPath).doc(placeId).update({
      isOpen: newStatus,
      scheduledTaskNames: newScheduledTaskNames,
    });
  } else {
    logger.info(`Status for ${placeId} has not changed.`);
  }

  // 4. Schedule the next task
  if (placeData.entityStatus === "defaultStatus" && nextTransition) {
    const taskPayload = { collectionPath, placeId };
    const scheduleTime = new Date(nextTransition.timestamp * 1000);

    const task = {
      httpRequest: {
        httpMethod: protos.google.cloud.tasks.v2.HttpMethod.POST,
        url: `https://${LOCATION}-${PROJECT_ID}.cloudfunctions.net/setOpenStatus`,
        headers: { "Content-Type": "application/json" },
        body: Buffer.from(JSON.stringify(taskPayload)).toString("base64"),
      },
      scheduleTime: {
        seconds: scheduleTime.getTime() / 1000,
      },
    };

    const parent = tasksClient.queuePath(PROJECT_ID, LOCATION, QUEUE_NAME);
    const [createdTask] = await tasksClient.createTask({ parent, task });
    logger.info(`Scheduled task ${createdTask.name} for ${scheduleTime}`);

    if (createdTask.name) {
      const taskKey = `${nextTransition.status}_${nextTransition.timestamp}`;
      newScheduledTaskNames[taskKey] = createdTask.name;
      await firestore.collection(collectionPath).doc(placeId).update({
        scheduledTaskNames: newScheduledTaskNames,
      });
    }
  } else {
    logger.info(`No new tasks to schedule for ${placeId}.`);
  }
}

function calculateStatusAndNextTransition(placeData: Place) {
  // Handle manual overrides first
  if (placeData.entityStatus === "open") return { newStatus: true, nextTransition: null };
  if (placeData.entityStatus === "close") return { newStatus: false, nextTransition: null };

  // If openingHours is missing (e.g., for a residence), set status to null.
  if (!placeData.openingHours) {
    return { newStatus: null, nextTransition: null };
  }

  const { timezone, openingHours } = placeData;
  const nowInUTC = new Date();
  const now = toZonedTime(nowInUTC, timezone);
  const dayNames = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"];

  let currentStatus: boolean | null = false;
  const transitions: { timestamp: number; status: string }[] = [];

  for (let i = 0; i < 2; i++) {
    const date = new Date(now.getTime() + i * 24 * 60 * 60 * 1000);
    const dayName = dayNames[date.getDay()];
    const dayHours = openingHours[dayName];

    if (!dayHours || dayHours.isDayOff) continue;
    if (dayHours.is24Hours) continue;

    dayHours.slots.forEach((slot) => {
      const [openH, openM] = slot.open.split(":").map(Number);
      const [closeH, closeM] = slot.close.split(":").map(Number);

      const openDate = fromZonedTime(new Date(date.getFullYear(), date.getMonth(), date.getDate(), openH, openM), timezone);
      let closeDate = fromZonedTime(new Date(date.getFullYear(), date.getMonth(), date.getDate(), closeH, closeM), timezone);

      if (closeDate <= openDate) {
        closeDate.setDate(closeDate.getDate() + 1);
      }

      transitions.push({ timestamp: openDate.getTime() / 1000, status: "open" });
      transitions.push({ timestamp: closeDate.getTime() / 1000, status: "close" });
    });
  }

  const nowTimestamp = nowInUTC.getTime() / 1000;
  const pastTransitions = transitions.filter((t) => t.timestamp <= nowTimestamp).sort((a, b) => b.timestamp - a.timestamp);
  if (pastTransitions.length > 0) {
    currentStatus = pastTransitions[0].status === "open";
  }

  const futureTransitions = transitions.filter((t) => t.timestamp > nowTimestamp).sort((a, b) => a.timestamp - b.timestamp);
  const nextTransition = futureTransitions.length > 0 ? futureTransitions[0] : null;

  const todaysHours = openingHours[dayNames[now.getDay()]];
  if (todaysHours && todaysHours.is24Hours) {
    currentStatus = true;
  }

  return { newStatus: currentStatus, nextTransition };
}
