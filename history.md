## Chat History - Implementing `isRoomAvailable` Feature

This session focused on implementing the `isRoomAvailable` feature for residences, providing a more relevant availability status than `isOpen`.

### 1. Data Model Updates

- **`Entity` & `EntityDetail`**: Added `isRoomAvailable` (boolean, default `true`) to `Residence` and `ResidenceDetail` models.
- **`ShopForm`**: Added `isRoomAvailable` to the `ShopForm` model, including mapping from `ResidenceDetail` and setting a default value.

### 2. Test Data Update

- **`test_residences.dart`**: Updated test residences to include `isRoomAvailable` with mixed `true` and `false` values for testing.

### 3. UI (Form) Implementation

- **`residence_specific_section.dart`**: Added `isRoomAvailable` and its `onChanged` callback to the widget's constructor.
- **`step_4_screen.dart`**: Updated to pass `isRoomAvailable` and its callback to `ResidenceSpecificSection`.
- **`filter_dialog.dart`**: Updated the `residence` filter section to include a `FilterSwitch` for `isRoomAvailable` and to use the new `showAvailableOnly` localization key.

### 4. UI (Display) Implementation

- **`entity_indicator.dart`**: Added `AvailableIndicator` (green) and `UnavailableIndicator` (red) widgets.
- **`app_en.arb`**: Added `available` and `unavailable` localization keys.
- **`entity_card.dart`**: Modified to display `AvailableIndicator` or `UnavailableIndicator` for `Residence` entities based on `isRoomAvailable`.
- **`home_detail_top_right_section.dart`**: Added `AvailableInfo` widget (similar to `FurnishedInfo`) to display `isRoomAvailable` on the detail page.

### 5. Filtering & Repository Updates

- **`entity_filter.dart`**: Added `isRoomAvailable` to `ResidenceFilter`.
- **`filter_controller.dart`**: Updated to handle `isRoomAvailable` in `updateFilter` and `resetFilters` methods.
- **`fake_residence_repository.dart`**: Updated `_applyResidenceFilter` to filter by `isRoomAvailable`.
- **`real_residence_repository.dart`**: Updated `_buildFilteredQuery` to filter by `isRoomAvailable`.

### 6. Backend Refactoring & Migration Function

- **Cloud Function Refactoring**: Broke down `index.ts` into `config.ts`, `types.ts`, and `core.ts` for better organization.
- **Data Migration Function**: Implemented `migrateResidenceData` (HTTP-triggered) to:
    - Add `isRoomAvailable` to existing `residence_listings` documents.
    - Remove `isOpen` and `scheduledTaskNames` from `residence_listings`.
    - This function was initially in `migrate.ts` but later moved into `index.ts` for deployment troubleshooting, and then removed after use.

### 7. Resolution of Compiler Errors

- Throughout the process, various compiler errors were encountered and systematically addressed due to the introduction of new fields and refactoring.

### Current Status

The `isRoomAvailable` feature is fully implemented for residences, providing a relevant availability status. The Cloud Functions have been refactored, and a data migration function was provided and used to update existing Firestore data.
