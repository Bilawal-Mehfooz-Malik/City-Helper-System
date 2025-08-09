# Plan: Making the "Home" Feature Production-Ready

This plan outlines the steps to enhance the "Home" feature for production readiness, focusing on core functionality, user experience, robustness, testing, and maintainability.

## Phase 1: Core Functionality & Data Integrity

### 1. Granular Error Handling and User Feedback
*   **Goal:** Provide more specific and actionable error messages to the user.
*   **Actions:**
    *   Enhance `app/lib/src/features/home/presentation/controllers/combined_error_controller.dart` or individual sections to display more specific error messages (e.g., "Failed to load ads," "Network error") where appropriate.
    *   Implement retry mechanisms for individual data fetches within sections, allowing users to re-attempt loading specific parts of the screen.

### 2. Implement Pagination/Infinite Scrolling for Entity Lists
*   **Goal:** Efficiently handle large datasets and improve performance for `EntitiesListSection` and `PopularEntitiesSection`.
*   **Actions:**
    *   Modify `app/lib/src/features/home/data/real/food_repository.dart` and `app/lib/src/features/home/data/real/residence_repository.dart` to support fetching data in chunks using Firestore's `limit()` and `startAfterDocument()`.
    *   Update `app/lib/src/features/home/application/entity_service.dart` and the relevant Riverpod providers (`watchEntitiesProvider`, `WatchPopularEntitiesProvider`) to integrate pagination logic.
    *   Adjust the UI in `app/lib/src/features/home/presentation/entities_list_section.dart` and `app/lib/src/features/home/presentation/popular_entities_list_screen.dart` to trigger loading of more data as the user scrolls.

### 3. Strengthen Firestore Security Rules
*   **Goal:** Ensure data security and prevent unauthorized access/modification.
*   **Actions:**
    *   **Crucially, verify and update `firestore.rules`** to strictly enforce that only approved entities are readable by regular users.
    *   Ensure that only authorized roles (e.g., administrators) can modify the `status` field of entities.
    *   (Note: This is a server-side change, but vital for client-side security and data integrity.)

## Phase 2: Enhanced User Experience & Robustness

### 4. Offline Support Strategy
*   **Goal:** Ensure a graceful user experience when offline.
*   **Actions:**
    *   Verify if Firestore persistence is enabled. If not, consider enabling it.
    *   Implement UI feedback to indicate when data is being served from cache or when the app is offline.

## Phase 3: Testing & Maintainability

### 5. Comprehensive Testing
*   **Goal:** Ensure the reliability and stability of the "home" feature.
*   **Actions:**
    *   Develop comprehensive unit tests for `app/lib/src/features/home/data/real/food_repository.dart`, `app/lib/src/features/home/data/real/residence_repository.dart`, `app/lib/src/features/home/application/entity_service.dart`, and `app/lib/src/features/home/application/filtering_logic.dart`.
    *   Develop widget tests for key UI components like `app/lib/src/features/home/presentation/home_screen.dart`, `app/lib/src/features/home/presentation/widgets/entity_card.dart`, `app/lib/src/features/home/presentation/widgets/filter_dialog.dart`, and the various list sections.
    *   Develop integration tests to verify the end-to-end data flow and UI interactions.

### 6. Code Documentation & Consistency
*   **Goal:** Improve long-term maintainability.
*   **Actions:**
    *   Add detailed comments to complex logic, especially in `app/lib/src/features/home/application/entity_service.dart` and `app/lib/src/features/home/application/filtering_logic.dart`.
    *   Review and ensure consistent use of constants/enums for all Firestore collection names and other magic strings.
