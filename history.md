## Chat History - Home Feature Enhancements & Bug Fixes (Continued)

This session focused on refining sorting logic, adding an `updatedAt` field to entities, and updating related fake repositories and tests.

### 1. Bug Fix: `updatedAt` Filtering in `ResidenceRepository`

-   **Goal**: Ensure `updatedAt` is used as a default sort only when no other sorting options are selected.
-   **Implementation**: Corrected the logic in `app/lib/src/features/home/data/real/residence_repository.dart` to prevent unintended multiple `orderBy` clauses in Firestore queries when `ratingSort` is active but `priceSort` is not.

### 2. Feature: Add `updatedAt` Field to Entities

-   **Goal**: Introduce a timestamp for tracking entity updates.
-   **Implementation**:
    -   Added a `required DateTime updatedAt` field to both `Residence` and `Food` entities in `app/lib/src/features/home/domain/entity.dart`.
    -   Updated `app/lib/src/core/constants/test_residences.dart` and `app/lib/src/core/constants/test_food_list.dart` to include `updatedAt` values for all test entities.
    -   Modified `app/lib/src/features/home/data/fake/fake_food_repository.dart` and `app/lib/src/features/home/data/fake/fake_residence_repository.dart` to correctly sort by `updatedAt` when no other sorting criteria are applied.

### 3. Test Updates

-   **Goal**: Ensure test coverage for new `updatedAt` sorting and remove outdated `isOpen` tests.
-   **Implementation**:
    -   Uncommented `app/test/src/features/home/data/fake/fake_food_repository_test.dart` and `app/test/src/features/home/data/fake/fake_residence_repository_test.dart`.
    -   Added new test cases to both fake repository test files to verify the `updatedAt` sorting logic.
    -   Removed outdated test cases related to `isOpen` filtering from both `fake_food_repository_test.dart` and `fake_residence_repository_test.dart`, as `isOpen` is no longer a direct field for filtering in the repositories.