export interface TimeSlot {
  open: string;  // e.g., "09:00"
  close: string; // e.g., "17:00"
}

export interface DailyHours {
  isDayOff: boolean;
  is24Hours?: boolean;
  slots: TimeSlot[];
}

export interface Place {
  name: string;
  timezone: string;
  entityStatus: "open" | "close" | "defaultStatus";
  openingHours?: {
    [day: string]: DailyHours;
  };
  isOpen?: boolean | null;
  scheduledTaskNames?: {
    [key: string]: string;
  };
}
