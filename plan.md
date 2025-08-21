# Plan: Implement Backend isOpen Status Logic (v2)

This plan outlines the steps to create a robust, server-side system using Cloud Functions and Cloud Tasks to automatically manage an `isOpen` flag on all place documents in Firestore. This version includes timezone support, complex hour handling, and security.

---

### Master Checklist

- [x] **Phase 1: Project Setup & Configuration**
- [ ] **Phase 2: Refine Data Model & Migrate Firestore Data**
- [ ] **Phase 3: Implement Core Backend Logic**
- [ ] **Phase 4: Implement Cloud Function Triggers**
- [ ] **Phase 5: Deployment and System Initialization**
- [ ] **Phase 6: Update Flutter App**

---

### Phase 1: Project Setup & Configuration

**Goal:** Prepare the local project and Google Cloud environment for backend development.

- [x] **1.1:** In the project root, run `firebase init functions` to set up a new functions directory.
- [x] **1.2:** When prompted, choose **TypeScript** as the language and select **Yes** to enable ESLint.
- [x] **1.3:** Add the required Node.js dependency for Cloud Tasks by running `npm install @google-cloud/tasks date-fns-tz` inside the new `functions` directory.
- [x] **1.4:** In the Google Cloud Console, go to "IAM & Admin" and grant the **"Cloud Tasks Enqueuer"** role to the default Cloud Functions service account.

---

### Phase 2: Refine Data Model & Migrate Firestore Data

**Goal:** Update the Firestore document structure to support all real-world scenarios.

- [ ] **2.1:** Manually update your test documents in the `food` and `residence` collections to match the new, more flexible structure defined in the chat.
- [ ] **2.2:** Add the `is24Hours` (Boolean) field.
- [ ] **2.3:** Add the `timezone` (String) field (e.g., "America/New_York").
- [ ] **2.4:** Restructure the `openingHours` field to be a map with string days and an array of time slots.
- [ ] **2.5:** Add the `isOpen` (Boolean) and `scheduledTaskNames` (Map) fields with default values.

---

### Phase 3: Implement Core Backend Logic

**Goal:** Create the central "brain" of the operation in `functions/src/index.ts`.

- [ ] **3.1:** Update TypeScript interfaces to match the new data model.
- [ ] **3.2:** Implement the `updateAndReschedule` helper function.
- [ ] **3.3:** **Handle `is24Hours` flag:** If true, set `isOpen: true` and skip all time-based logic.
- [ ] **3.4:** **Implement Timezone-Aware Logic:** Use `date-fns-tz` to convert the current time to the business's local timezone before checking `openingHours`.
- [ ] **3.5:** **Handle New `openingHours` Structure:** The logic must now iterate through the array of time slots for the current day.
- [ ] **3.6:** **Handle Overnight Spans:** Correctly calculate status for time slots that cross midnight.
- [ ] **3.7:** Implement task cancellation and scheduling using timezone-aware calculations.

---

### Phase 4: Implement Cloud Function Triggers

**Goal:** Create the entry points that will execute our core logic.

- [ ] **4.1:** Create the **`onPlaceWrite`** function for **both** the `residence` and `food` collections.
- [ ] **4.2:** Implement the **`setOpenStatus`** HTTPS trigger, ensuring it can only be called by Cloud Tasks.
- [ ] **4.3:** Implement the **`updateAllPlaces`** HTTPS trigger, ensuring it is secured and can only be run by an authenticated admin user.

---

### Phase 5: Deployment and System Initialization

**Goal:** Deploy the backend code and initialize the live data.

- [ ] **5.1:** Deploy the functions via `firebase deploy --only functions`.
- [ ] **5.2:** Manually trigger the (now secure) `updateAllPlaces` endpoint once to initialize the system.
- [ ] **5.3:** Verify in the Google Cloud Console that tasks are being created correctly.

---

### Phase 6: Update Flutter App

**Goal:** Modify the app to use the new data model and `isOpen` field.

- [ ] **6.1:** Update the `Entity` and `OpeningHours` models in your Flutter app to match the new Firestore structure.
- [ ] **6.2:** Update the UI for editing opening hours to support the new flexible structure (multiple slots, string days).
- [ ] **6.3:** In the repositories, change the "Show Open Only" filter to use `.where('isOpen', '==', true)`.