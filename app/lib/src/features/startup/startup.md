
# Feature Requirements: User Onboarding & Location Setup

## 1. Overview

This feature is the first experience for a new user. Its primary goal is to capture the user's geographical location, which is essential for providing relevant, localized content throughout the app. The flow is designed to be simple and responsive, adapting its layout for both mobile and desktop users.

## 2. Functional Requirements

### FR1: Initial Welcome Screen
*   **Description:** When a user opens the app for the first time (without a previously saved location), they are presented with a welcome screen.
*   **Components:** `StartupScreen`, `StartupContent`
*   **Acceptance Criteria:**
    *   The screen must display the app logo, title, and a brief, welcoming description of the app's purpose.
    *   On mobile, a prominent "Get Started" button is displayed.
    *   On desktop/tablet, the location-gathering UI is presented alongside the welcome content, so no explicit "Get Started" button is needed.

### FR2: Location Acquisition Flow
*   **Description:** The user must be able to provide their location either automatically via GPS or manually by picking from a map.
*   **Components:** `GetLocationContent`, `PickLocationScreen`, `UserLocationController`
*   **Acceptance Criteria:**
    *   On mobile, tapping "Get Started" reveals a bottom sheet with location options.
    *   On desktop, these options are always visible in a side panel.
    *   The user is presented with two choices: "Get Current" and "From Map".
    *   A preview area shows the currently selected location on a map, or a placeholder if no location is yet selected.

### FR3: Get Location via GPS ("Get Current")
*   **Description:** The user can get their precise current location using the device's GPS.
*   **Components:** `GeoLocatorRepository`, `UserLocationController`
*   **Acceptance Criteria:**
    *   Tapping the "Get Current" button triggers a request for location permissions from the operating system.
    *   The app must handle various permission states:
        *   **Granted:** The device's location is fetched and displayed on the preview map.
        *   **Denied:** A user-friendly message is shown explaining why the permission is needed.
        *   **Permanently Denied:** A message is shown instructing the user to enable permissions in the device settings, with a button to open the settings.
        *   **Services Disabled:** A message is shown instructing the user to enable location services on their device.
    *   A loading indicator is shown while the location is being fetched.

### FR4: Get Location via Map ("From Map")
*   **Description:** The user can manually select their location by navigating a full-screen map.
*   **Components:** `PickLocationScreen`, `GoogleMapWidget`
*   **Acceptance Criteria:**
    *   Tapping the "From Map" button navigates the user to a full-screen interactive map view.
    *   A central marker/pin indicates the selected location.
    *   The user can pan and zoom the map to position the pin accurately.
    *   A "My Location" button allows the user to re-center the map on their current GPS location.
    *   A confirmation button saves the pin's location and returns to the previous screen.

### FR5: Save Location and Proceed
*   **Description:** Once a location is successfully acquired, the user can save it to proceed into the main application.
*   **Components:** `UserLocationRepository`, `LocalUserLocationSaver`, `go_router` redirection logic
*   **Acceptance Criteria:**
    *   After a location is selected (either via GPS or map), a "Save Location" button becomes active.
    *   Tapping "Save Location" persists the `LatLng` coordinates to the local device storage (Sembast DB).
    *   Upon successful save, the user is automatically redirected to the main app screen (`CategoriesListScreen`).
    *   On subsequent app launches, the startup screen is bypassed, and the user is taken directly to the main app.

## 3. Technical Requirements

*   **State Management:** All UI state, controller logic, and repository interactions are managed via **Riverpod** providers.
*   **Data Persistence:** The user's selected `LatLng` is stored locally using the **Sembast** database. The `UserLocationRepository` abstracts the database logic.
*   **Location Services:** The **Geolocator** package is used to interact with the device's native location services.
*   **Mapping:** The **Google Maps Flutter** package is used to display map widgets.
*   **Error Handling:** A set of custom `AppException` classes (`LocationServicesDisabledException`, `LocationPermissionDeniedException`, etc.) are defined to handle specific error scenarios gracefully.
*   **Testing:** The feature includes unit tests for repositories and controllers, and widget/golden tests for the UI flow.
