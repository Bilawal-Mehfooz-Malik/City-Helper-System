# Startup Feature Architecture Overview

This document outlines the architecture and key components of the `startup` feature.

## 1. Directory Structure

The feature follows a clean, layer-based architecture, separating concerns into three main directories:

-   **/data**: Contains the data sources and repositories. The `UserLocationRepository` is responsible for persisting and retrieving the user's location.
-   **/domain**: (Currently empty) Would typically hold the business logic and entities for this feature.
-   **/presentation**: Contains the UI (widgets, screens) and the state management logic (controllers) that connects the UI to the data layer.

## 2. Data Layer & Persistence

-   **`UserLocationRepository`**: This is the core of the data layer. It uses the `shared_preferences` package to store the user's selected `LatLng` as a JSON string.
-   **State Management**: The feature uses `flutter_riverpod` for state management. The `userLocationRepositoryProvider` and `fetchUserLocationProvider` expose the repository and its data to the rest of the application, ensuring a decoupled and testable architecture.

## 3. Presentation Layer & UI

The UI is split into two main screens and is designed to be highly responsive.

### `StartupScreen.dart`

-   **Purpose**: This is the initial entry point for a new user. Its primary goal is to prompt the user to set their location.
-   **Responsive Layout**: The screen demonstrates excellent responsive design principles:
    -   On **mobile** devices, it displays a simple layout with a "Get Started" button. Tapping this button reveals a persistent bottom sheet (`GetLocationContent`) for location actions.
    -   On **tablet and desktop** screens, it uses a `ResponsiveTwoColumnLayout` to show the startup content and the location-setting widgets side-by-side, providing a more efficient use of space.
-   **UI Logic**: It manages the visibility of the bottom sheet, ensuring it only appears on smaller screens and is automatically closed when the screen size increases.

### `PickLocationScreen.dart`

-   **Purpose**: This screen allows the user to visually select their location by panning and zooming on a map.
-   **Implementation**: It is a stateful widget that integrates `google_maps_flutter`.
-   **Key Features**:
    -   It displays a marker in the center of the map, and the user's selected location is determined by the camera's target position.
    -   It provides two main actions via Floating Action Buttons: one to fetch the user's current GPS location and another to confirm and save the selected location.
    -   It communicates with the `UserLocationController` to fetch the current location and save the picked location.

## Summary

The startup feature is well-structured, following best practices for a Flutter application. It effectively uses Riverpod for state management, implements a robust and responsive UI that adapts to various screen sizes, and cleanly separates data persistence from the presentation logic. The code is clear, modular, and testable.
