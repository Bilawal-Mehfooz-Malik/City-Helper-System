# Integration Test Plan for the Startup Feature

## Goal

To create robust, functional integration tests for the application's startup flow. These tests will verify the user journey from the initial screen through location setup and navigation to the main application, ensuring all components interact correctly. Crucially, these tests will **avoid explicit screen size manipulation** to prevent known rendering issues in the test environment, focusing solely on the functional flow.

## Core Principles

-   **Functional Focus**: Tests will concentrate on the sequence of user actions and the resulting state changes and navigation, rather than visual layout or responsiveness.
-   **Leverage Existing Fakes**: We will utilize the already implemented `FakeUserLocationRepository` and `FakeGeoLocatorRepository` to control the application's state and simulate various scenarios without external dependencies.
-   **Utilize `Robot` Class**: The existing `Robot` class (`app/test/src/robot.dart`) provides the necessary abstractions for interacting with the UI and pumping the application.
-   **No `setSurfaceSize`**: Explicitly setting `tester.view.physicalSize` will be avoided in these integration tests to prevent blank screen issues. Visual responsiveness will be covered by golden tests.

## Prerequisites

Ensure the following components are correctly implemented and available:

-   `app/lib/src/features/startup/data/fake/fake_user_location_repository.dart`
-   `app/lib/src/features/startup/data/fake/fake_geolocator_repository.dart`
-   `app/test/src/robot.dart` (specifically `pumpMyApp` which accepts `overrides`)
-   `app/test/src/features/startup/startup_robot.dart`

## Step-by-Step Implementation

### Step 1: Create the Integration Test File

-   **Action**: Create a new file: `app/integration_test/startup_flow_test.dart`.

### Step 2: Initial Test Setup

Set up the basic structure for the integration tests, including the `Robot` instantiation and common setup.

-   **Action**: Add the following boilerplate to `startup_flow_test.dart`:

    ```dart
    import 'package:app/src/features/startup/data/fake/fake_geolocator_repository.dart';
    import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
    import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
    import 'package:app/src/features/startup/data/real/user_location_repository.dart';
    import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
    import 'package:flutter/material.dart';
    import 'package:flutter_riverpod/flutter_riverpod.dart';
    import 'package:flutter_test/flutter_test.dart';
    import 'package:geolocator/geolocator.dart';

    import '../test/src/robot.dart';

    void main() {
      setUpAll(() => WidgetController.hitTestWarningShouldBeFatal = true);

      group('Startup Feature Integration Tests', () {
        // Test scenarios will go here
      });
    }
    ```

### Step 3: Implement Happy Path Scenarios

These tests will verify successful user journeys through the startup flow.

-   **Action**: Add the following test cases inside the `group` block in `startup_flow_test.dart`.

    #### Scenario 3.1: First-time user sets current location

    ```dart
    testWidgets('First-time user sets current location', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        final fakeUserLocationRepository = FakeUserLocationRepository();
        final overrides = [
          userLocationRepositoryProvider.overrideWithValue(
            fakeUserLocationRepository,
          ),
        ];

        await r.pumpMyApp(overrides: overrides);
        await tester.pumpAndSettle(); // Ensure initial render

        // User is on StartupScreen, taps Get Started
        await r.startupRobot.tapGetStartedButton();
        await tester.pumpAndSettle(); // Wait for bottom sheet to appear
        r.startupRobot.expectModalBottomSheet();

        // User taps Get Current Location
        await r.startupRobot.tapGetCurrentButton();
        await tester.pumpAndSettle(); // Wait for location fetch and UI update

        // User taps Save Location
        await r.startupRobot.tapSaveButton();
        await tester.pumpAndSettle(); // Wait for navigation to CategoriesListScreen

        // Verify navigation to CategoriesListScreen
        r.categoriesRobot.expectCategoriesScreen();
      });
    });
    ```

    #### Scenario 3.2: First-time user picks location from map

    ```dart
    testWidgets('First-time user picks location from map', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        final fakeUserLocationRepository = FakeUserLocationRepository();
        final overrides = [
          userLocationRepositoryProvider.overrideWithValue(
            fakeUserLocationRepository,
          ),
        ];

        await r.pumpMyApp(overrides: overrides);
        await tester.pumpAndSettle(); // Ensure initial render

        // User is on StartupScreen, taps Get Started
        await r.startupRobot.tapGetStartedButton();
        await tester.pumpAndSettle(); // Wait for bottom sheet to appear
        r.startupRobot.expectModalBottomSheet();

        // User taps From Map
        await r.startupRobot.tapFromMapButton();
        await tester.pumpAndSettle(); // Wait for navigation to PickLocationScreen

        // User taps My Location on map screen
        await r.startupRobot.tapMyLocationButton();
        await tester.pumpAndSettle(); // Wait for location fetch and map update

        // User taps Floating Check button to confirm map location
        await r.startupRobot.tapFloatingCheckButton();
        await tester.pumpAndSettle(); // Wait for pop back to GetLocationContent

        // User taps Save Location
        await r.startupRobot.tapSaveButton();
        await tester.pumpAndSettle(); // Wait for navigation to CategoriesListScreen

        // Verify navigation to CategoriesListScreen
        r.categoriesRobot.expectCategoriesScreen();
      });
    });
    ```

### Step 4: Implement Error Handling Scenarios

These tests will verify how the application handles errors during location setup.

-   **Action**: Add the following test cases inside the `group` block in `startup_flow_test.dart`.

    #### Scenario 4.1: Location services are disabled

    ```dart
    testWidgets('Shows error when location services are disabled', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        final fakeGeoLocatorRepository = FakeGeoLocatorRepository(
          locationServiceEnabled: false,
        );
        final overrides = [
          userLocationRepositoryProvider.overrideWithValue(
            FakeUserLocationRepository(),
          ),
          geoLocatorRepositoryProvider.overrideWithValue(
            fakeGeoLocatorRepository,
          ),
        ];

        final container = await r.pumpMyApp(overrides: overrides);
        await tester.pumpAndSettle(); // Ensure initial render

        // User is on StartupScreen, taps Get Started
        await r.startupRobot.tapGetStartedButton();
        await tester.pumpAndSettle(); // Wait for bottom sheet to appear
        r.startupRobot.expectModalBottomSheet();

        // User taps Get Current Location, which will fail
        await r.startupRobot.tapGetCurrentButton();
        await tester.pumpAndSettle(); // Wait for all async operations to complete

        // Explicitly wait for the controller to be in an error state
        await Future.doWhile(() async {
          await tester.pump(const Duration(milliseconds: 100));
          return !container.read(userLocationControllerProvider).hasError;
        }).timeout(const Duration(seconds: 5), onTimeout: () {
          fail('UserLocationController did not enter error state within timeout.');
        });

        // Verify AlertDialog is shown with the correct message
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Location Services Disabled'), findsOneWidget);
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle(); // Dismiss the dialog
      });
    });
    ```

    #### Scenario 4.2: Location permission is denied

    ```dart
    testWidgets('Shows error when location permission is denied', (tester) async {
      await tester.runAsync(() async {
        final r = Robot(tester);
        final fakeGeoLocatorRepository = FakeGeoLocatorRepository(
          permission: LocationPermission.denied,
        );
        final overrides = [
          userLocationRepositoryProvider.overrideWithValue(
            FakeUserLocationRepository(),
          ),
          geoLocatorRepositoryProvider.overrideWithValue(
            fakeGeoLocatorRepository,
          ),
        ];

        final container = await r.pumpMyApp(overrides: overrides);
        await tester.pumpAndSettle(); // Ensure initial render

        // User is on StartupScreen, taps Get Started
        await r.startupRobot.tapGetStartedButton();
        await tester.pumpAndSettle(); // Wait for bottom sheet to appear
        r.startupRobot.expectModalBottomSheet();

        // User taps Get Current Location, which will fail
        await r.startupRobot.tapGetCurrentButton();
        await tester.pumpAndSettle(); // Wait for all async operations to complete

        // Explicitly wait for the controller to be in an error state
        await Future.doWhile(() async {
          await tester.pump(const Duration(milliseconds: 100));
          return !container.read(userLocationControllerProvider).hasError;
        }).timeout(const Duration(seconds: 5), onTimeout: () {
          fail('UserLocationController did not enter error state within timeout.');
        });

        // Verify AlertDialog is shown with the correct message
        expect(find.byType(AlertDialog), findsOneWidget);
        expect(find.text('Location Permission Denied'), findsOneWidget);
        await tester.tap(find.text('OK'));
        await tester.pumpAndSettle(); // Dismiss the dialog
      });
    });
    ```

### Step 5: Run the Tests

Execute the newly created integration tests.

-   **Action**: Run the tests using the Flutter test command. Since we are avoiding `setSurfaceSize`, the tests should run without the white screen issue.

    ```bash
    flutter test integration_test/startup_flow_test.dart
    ```

### Step 6: Verification

-   **Action**: Observe the test output.
-   **Expected Outcome**: All tests should pass, indicating that the functional flows and error handling for the startup feature are working as expected.

## Checklist

- [x] Create `app/integration_test/startup_flow_test.dart`
- [x] Implement Scenario 3.1: First-time user sets current location
- [x] Implement Scenario 3.2: First-time user picks location from map
- [x] Implement Scenario 4.1: Location services are disabled
- [x] Implement Scenario 4.2: Location permission is denied
- [x] Run `flutter test integration_test/startup_flow_test.dart`
- [x] Verify all tests pass
