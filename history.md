## Chat History - Refactoring `isOpen` for Residences

This session focused on a significant refactoring of the `isOpen` status, particularly for residences, to improve data modeling, reduce backend costs, and enhance user experience.

### 1. Initial Problem & Design Pivot

- **Problem**: The `isOpen` status was being calculated and stored for all entities, including residences, which was conceptually awkward (e.g., "is a house open?").
- **Cost/Complexity**: Maintaining `isOpen` for residences via Cloud Functions and Cloud Tasks was unnecessary and added cost.
- **User Experience**: Displaying "Open" for residences without office hours was confusing.
- **New Design Goal**: Completely remove `isOpen` from residences, focusing on "availability" (to be implemented later), while keeping `isOpen` for food shops.

### 2. Data Model Refactoring

- **`Entity` & `EntityDetail`**: The `isOpen` field was completely removed from the `Residence` and `ResidenceDetail` classes. It remains on `Food` and `FoodDetail`.
- **`ShopForm`**: The `isOpen` field was removed from the `ShopForm` model, as it's no longer applicable to residences.

### 3. Backend Cloud Function Update

- **Targeted Processing**: The Cloud Function (`app/functions/src/index.ts`) was modified to **only** process the `food_listings` collection for `isOpen` status updates. `residence_listings` are now ignored, reducing Cloud Function execution costs.

### 4. Frontend UI & Filter Adaptation

- **`EntityFilter`**: The `isOpen` field was removed from the `ResidenceFilter`. The `getIsOpen` getter was updated to reflect this, effectively disabling the "Show Open Only" filter for residences.
- **`FilterDialog`**: The "Show Open Only" switch is now conditionally hidden when the filter context is for residences.
- **Display Widgets (`EntityCard`, `MyShopDashboardScreen`, `OpeningHoursWidget`)**: All UI elements that previously displayed the "Open/Closed" indicator were updated. They now check if the entity is a `Food` type before attempting to display `isOpen`, ensuring that residences no longer show this status.

### 5. Repository & Test Updates

- **Fake Repositories**: The `_applyResidenceFilter` method in `fake_residence_repository.dart` was updated to remove the `isOpen` filtering logic.
- **Real Repositories**: The `_buildFilteredQuery` method in `residence_repository.dart` was updated to remove the `isOpen` filtering from Firestore queries.
- **Test Files**: All relevant test files (`fake_food_repository_test.dart`, `fake_residence_repository_test.dart`) were updated to reflect the changes in the `isOpen` property and filter logic.

### 6. Resolution of Compiler Errors

- Throughout the process, various compiler errors (e.g., `undefined_getter`, `undefined_named_parameter`, type mismatches) were encountered due to the removal of `isOpen` from `Residence` and `ResidenceDetail`. These were systematically addressed by updating affected code paths and ensuring proper type handling.

### Current Status

The `isOpen` functionality has been successfully refactored to apply only to `Food` entities. Residences no longer have an `isOpen` status, and the application's frontend and backend reflect this new, more logical design. The groundwork has been laid for implementing a separate "availability" feature for residences in the future.