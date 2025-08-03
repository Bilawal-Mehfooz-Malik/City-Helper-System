# Testing the Startup Feature with a Fake Router

- [x] Create `fake_app_router.dart` for the startup flow.
- [x] Modify `app_flow_test.dart` to use the fake router and isolate the startup test.
- [ ] Run tests to verify the startup flow.

This plan outlines the steps to test the startup feature in isolation. We will create a dedicated fake router that uses pre-existing fakes and modify the integration test to focus only on the initial startup sequence.

## Step-by-step Procedure

### 1. Create `fake_app_router.dart`

We will create a router that mirrors the real application's startup and redirection logic but is configured for a test environment.

-   **Action:** Create a new file named `fake_app_router.dart` in the `app/integration_test` directory.
-   **Content:**
    1.  The file will define a `fakeAppRouterProvider`.
    2.  This provider will construct a `GoRouter` instance.
    3.  The router will use the existing fake provider for user location (`fakeUserLocationProvider`) to drive its redirection logic.
    4.  It will only include the routes essential for the startup flow: `/get-started`, `/`, and the associated sub-routes like `pick-your-location`.

### 2. Modify `app_flow_test.dart`

We will update the main integration test file to use our new fake router and comment out all irrelevant test code.

-   **Action:** Edit `app/integration_test/app_flow_test.dart`.
-   **Modifications:**
    1.  **Comment out all test assertions and actions that occur after the startup flow is complete.** This includes any calls to `r.categoriesRobot` or `r.homeRobot`.
    2.  In each `testWidgets` block, obtain the `GoRouter` instance from the `fakeAppRouterProvider`.
    3.  Replace the existing `r.pumpAppWith...Screen()` calls with `r.pumpMyAppFakeWith...Screen(const SizedBox.shrink(), router, overrides: [ ... ])`.
    4.  In the `overrides` list, set the `fakeUserLocationProvider` to return `null` to ensure the test always begins at the startup screen.

### 3. Run Tests

After refactoring, run the integration test to confirm that the startup flow works as expected with the new fake setup.

- **Action:** Execute the test from your IDE or using the command line.
  ```sh
  flutter test integration_test/app_flow_test.dart
  ```
