# Plan Checklist

- [x] Refactor repetitive logic in `EntityService`.
- [x] Implement granular and persistent error notifications.

---

# Plan to Refactor Home Feature Logic and Error Handling

This plan outlines the steps to improve the `home` feature by refactoring duplicated logic and implementing more granular error handling.

## 1. Refactor Repetitive Logic in `EntityService` (Completed)

**Goal:** Eliminate the duplicated filtering and sorting logic within the `watchPopularEntities` and `watchEntities` providers to adhere to the DRY (Don't Repeat Yourself) principle.

**Outcome:** The duplicated logic was successfully extracted into a private `_applyFilteringAndSorting` helper method, making the code in `app/lib/src/features/home/application/entity_service.dart` cleaner and more maintainable.

## 2. Implement Granular and Persistent Error Notifications

**Goal:** Instead of just hiding failed non-critical sections (like ads or sub-categories), display a persistent, non-intrusive error notification at the bottom of the screen. This bar will inform the user of the issue and provide a retry mechanism, without blocking their interaction with the content that loaded successfully.

### Detailed Checklist

**Step 2.1: Centralized Non-Critical Error Provider**
- [x] Rename `combined_error_controller.dart` to `home_error_controller.dart`.
- [x] In the new file, create `nonCriticalErrorsProvider`.
- [x] Implement it to watch `adsListFutureProvider` and `subCategoriesListStreamProvider`.
- [x] The provider will return a `List<String>` of error messages.

**Step 2.2: Persistent Error Widget**
- [x] Create the new file `persistent_error_bar.dart`.
- [x] Implement the `PersistentErrorBar` widget to accept an error message and an `onRetry` callback.
- [x] Style the widget as a bottom bar with text and a "Retry" button.

**Step 2.3: HomeScreen Integration**
- [x] In `home_screen.dart`, wrap the `Scaffold` body in a `Stack`.
- [x] Watch the `nonCriticalErrorsProvider`.
- [x] Conditionally display the `PersistentErrorBar` at the bottom of the `Stack`.
- [x] Pass the `_onRefresh` method to the `onRetry` callback.

**Step 2.4: Finalize Critical Error Handling**
- [x] In `home_error_controller.dart`, rename `combinedErrorStatusProvider` to `criticalErrorStatusProvider`.
- [x] Update its logic to only watch the single, critical entity provider based on the current `HomeListType`.
- [x] Ensure `HomeScreen` uses this provider to display a full-screen error if the main content fails to load.

---

### Step 2.1: Create a Centralized Non-Critical Error Provider

*   **File to Modify:** `app/lib/src/features/home/presentation/controllers/combined_error_controller.dart` (will be repurposed).
*   **Action:** Create a new provider, `nonCriticalErrorsProvider`, that aggregates errors from non-essential parts of the UI.
*   **Implementation:**
    1.  This provider will `watch` the non-critical data providers (`adsListFutureProvider`, `subCategoriesListStreamProvider`).
    2.  It will check if any of them have an error and will return a list of custom error objects or messages.
    3.  If no errors are present, it will return an empty list.

### Step 2.2: Design a Persistent Error Widget

*   **File to Create:** `app/lib/src/features/home/presentation/widgets/persistent_error_bar.dart`.
*   **Action:** Build a reusable UI component to display the error.
*   **Implementation:**
    1.  The widget will accept a list of error messages and an `onRetry` callback.
    2.  It will be styled as a bar that sits at the bottom of the screen, displaying the first error message and a "Retry" button.
    3.  The "Retry" button will trigger the provided `onRetry` callback.

### Step 2.3: Integrate the Error Bar into the HomeScreen

*   **File to Modify:** `app/lib/src/features/home/presentation/home_screen.dart`.
*   **Action:** Update the `HomeScreen` to display the new error bar when non-critical errors occur.
*   **Implementation:**
    1.  The `HomeScreen` will `watch` the new `nonCriticalErrorsProvider`.
    2.  The `Scaffold`'s body will be wrapped in a `Stack` to allow overlaying widgets.
    3.  If the `nonCriticalErrorsProvider` returns any errors, the `PersistentErrorBar` widget will be displayed at the bottom of the `Stack`.
    4.  The `onRetry` callback for the error bar will be wired to the `_onRefresh` method that already exists in the `HomeScreen`, allowing the user to refresh all screen data.

### Step 2.4: Finalize Critical Error Handling

*   **File to Modify:** `app/lib/src/features/home/presentation/controllers/combined_error_controller.dart`.
*   **Action:** The existing `combinedErrorStatusProvider` will be renamed to `criticalErrorStatusProvider` and will be simplified to *only* handle fatal errors.
*   **Implementation:**
    1.  This provider will only watch the main entity list provider (`watchEntitiesProvider` or `watchPopularEntitiesProvider`).
    2.  If this critical data fails to load, it will return an error, and the `HomeScreen` will use this to display a full-screen error message, as the screen is not usable without its main content.
