# Plan for Testing Startup Feature Controllers

This document outlines a plan to address issues and improve test coverage for the controllers within the `startup` feature.

## 1. Identify Controllers and Their Responsibilities

*   **`UserLocationController`**: Manages fetching the current user location using `GeoLocatorRepository` and updating the UI state. It also handles setting a location from the map.
*   **`LocalUserLocationSaver`**: Handles saving the user's selected location to persistent storage via `UserLocationRepository`.
*   **`GoogleMapBuilder`**: A simple provider that returns a widget builder for `GoogleMapWidget`. Its testing needs are minimal, primarily ensuring it provides the correct widget.

## 2. Testing Strategy

The primary focus will be on unit testing each controller in isolation, mocking their dependencies. Where appropriate, light integration tests can be considered to verify interactions between a controller and its direct repository.

### 2.1. Unit Testing Principles

*   **Isolation**: Each controller will be tested independently.
*   **Mocking Dependencies**: Use a mocking framework (e.g., `mockito`) to create mock implementations of dependencies (e.g., `GeoLocatorRepository`, `UserLocationRepository`). This allows testing the controller's logic without relying on actual external services or storage.
*   **State Verification**: Assert that the controller's `state` (Riverpod's `AsyncValue`) changes correctly based on different scenarios (loading, data, error).
*   **Method Invocation Verification**: Verify that the controller correctly calls methods on its dependencies with the expected arguments.

### 2.2. Test File Location

Test files will be located in `app/test/src/features/startup/controllers/`.

## 3. Detailed Test Plan by Controller

### 3.1. `UserLocationController`

**Dependencies to Mock**: `GeoLocatorRepository`

**Test Cases**:

*   **`getCurrentLocation()`**:
    *   **Success**: Verify that `getCurrentLocation` correctly updates the state to `AsyncLoading`, then `AsyncData` with the fetched `LatLng`.
    *   **`LocationServicesDisabledException`**: Verify that the state updates to `AsyncError` with the correct exception when location services are disabled.
    *   **`LocationPermissionDeniedException`**: Verify that the state updates to `AsyncError` with the correct exception when permission is denied.
    *   **`LocationPermissionDeniedForeverException`**: Verify that the state updates to `AsyncError` with the correct exception when permission is denied forever.
    *   **`LocationFetchFailedException`**: Verify that the state updates to `AsyncError` with the correct exception when location fetching fails for other reasons.
*   **`getLocationFromMap(LatLng location)`**:
    *   **Success**: Verify that `getLocationFromMap` correctly updates the state to `AsyncLoading`, then `AsyncData` with the provided `LatLng`.

### 3.2. `LocalUserLocationSaver`

**Dependencies to Mock**: `UserLocationController` (to get the current location), `UserLocationRepository`

**Test Cases**:

*   **`createUser()`**:
    *   **Success**: Verify that `createUser` correctly updates the state to `AsyncLoading`, then `AsyncData(null)` (for void return) and calls `setUserLocation` on `UserLocationRepository` with the correct `LatLng`.
    *   **`LocationUnavailableException`**: Verify that the state updates to `AsyncError` with the correct exception when `UserLocationController`'s value is `null`.
    *   **Repository Error**: Verify that the state updates to `AsyncError` when `setUserLocation` on `UserLocationRepository` throws an exception.

### 3.3. `GoogleMapBuilder`

**Test Cases**:

*   **Basic Functionality**: Verify that the `googleMapBuilderProvider` returns a function that, when called with a `LatLng`, returns an instance of `RealGoogleMapWidget` with the correct `LatLng`.

## 4. Tools and Frameworks

*   **`flutter_test`**: Standard Flutter testing framework.
*   **`mockito`**: For creating mock objects of dependencies.
*   **`riverpod_test`**: For testing Riverpod providers and controllers.

## 5. Execution and Verification

After implementing the tests, they will be run using `flutter test`. Any failures will be debugged and resolved. The goal is to achieve high test coverage for the controller logic.

## 6. Checklist

- [x] Create `app/test/src/features/startup/controllers/user_location_controller_test.dart`
  - [x] Test `getCurrentLocation()` success scenario
  - [x] Test `getCurrentLocation()` with `LocationServicesDisabledException`
  - [x] Test `getCurrentLocation()` with `LocationPermissionDeniedException`
  - [x] Test `getCurrentLocation()` with `LocationPermissionDeniedForeverException`
  - [x] Test `getCurrentLocation()` with `LocationFetchFailedException`
  - [x] Test `getLocationFromMap()` success scenario
- [x] Create `app/test/src/features/startup/controllers/local_user_location_saver_test.dart`
  - [x] Test `createUser()` success scenario
  - [x] Test `createUser()` with `LocationUnavailableException`
  - [x] Test `createUser()` with `UserLocationRepository` error
- [x] Create `app/test/src/features/startup/controllers/google_map_builder_test.dart`
  - [x] Test `googleMapBuilderProvider` returns `RealGoogleMapWidget`
- [x] Run all new tests using `flutter test`
- [x] Verify all tests pass
- [x] Review test coverage and add additional tests if necessary