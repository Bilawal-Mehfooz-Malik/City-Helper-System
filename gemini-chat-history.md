# Gemini Chat History

This file contains the history of our conversation.

## Codebase Information

The project is a Flutter application designed for city navigation and providing local information services. Here's a summary of its technical stack and architecture:

- **State Management:** Uses `flutter_riverpod` for robust and scalable state management.
- **Navigation:** Implements `go_router` for declarative routing.
- **Backend:** Leverages Firebase for services like Firestore, Firebase Storage, and Firebase Authentication.
- **Architecture:** The codebase is well-structured, following a clean architecture pattern with a clear separation of concerns into `data`, `domain`, `application`, and `presentation` layers.
- **UI:** The user interface is built with Flutter's Material Design widgets and is composed of several reusable components.
- **Code Generation:** The project relies on code generation for tasks such as dependency injection (`riverpod_generator`), serialization (`json_serializable`), and environment variable management (`envied`).

## Previous Changes

- **`app/lib/src/routers/app_router.dart`**:
    - Commented out imports and routes for multiple features to isolate the `home` feature.
- **`app/lib/src/features/home_detail`, `my_shop`, `review` directories**:
    - Commented out the entire content of all non-generated `.dart` files.
- **`app/test/src/features/home_detail` directory**:
    - Commented out test files.
- **`app/lib/src/routers/redirection.dart`**:
    - Commented out authentication and user mode-related logic.
- **`app/lib/src/features/home/presentation/widgets/profile_circular_avator.dart`**:
    - Simplified the widget by removing auth-related logic.

## Recent Changes (Deserialization and Refactoring)

### Bug Fixes & Data Model Improvements:

- **`app/lib/src/features/home/domain/entity.dart`**:
    - Added `@Default` values to numerous fields (`isPopular`, `entityStatus`, `status`, `type`, `isFurnished`, etc.) to make the model more resilient to incomplete Firestore data.

- **`app/lib/src/features/home/domain/opening_hours.dart`**:
    - Converted the class to a `freezed` class.
    - Made the model more robust by adding an `isOpen` boolean flag and making `open` and `close` times nullable.

- **`app/lib/src/features/home/domain/helpers/entity_extensions.dart`**:
    - Updated the `isEntityOpen()` logic to be compatible with the new, more flexible `OpeningHours` model.
    - Adjusted `matchGenderPref` and `checkFurnished` to handle `ListingType.forSale` and nullable fields.

- **`app/lib/src/core/constants/test_sub_categories.dart`**:
    - Replaced the old "Residence" sub-categories with a more comprehensive and professional list (e.g., "Hotels", "Guest Houses", "Vacation Homes", "Private Rooms").
    - Added "Houses for Sale" and "Apartments for Sale" sub-categories for Residence.

- **`app/lib/src/core/constants/test_residences.dart`**:
    - Updated to use the new `Pricing` model and `ListingType`.
    - Adjusted `OpeningHours` usage and added an example for a "for sale" property.

- **`app/lib/src/features/home/application/filtering_logic.dart`**:
    - Updated `_compareByPrice` function to correctly use the `pricing.cost` field from the new `Pricing` model.

- **`app/lib/src/features/home/presentation/widgets/entity_card.dart`**:
    - Updated to display the new `Pricing` model, including the icon and formatted cost/unit/period.
    - Handled display logic for `ListingType.forSale`.

- **`app/lib/src/features/home/presentation/home_skeletons.dart`**:
    - Updated `EntityCardSkeletonContent` to include placeholders for the pricing icon, cost, and unit/period.

### Refactoring & Data Modeling:

- **Pricing Model:**
    - Designed and implemented a new, mature pricing model to replace the simple `double price` field.
    - The new model uses enums for `PricingUnit` and `PricingPeriod` to ensure data consistency and includes `IconData` for richer UI representation.

- **`app/lib/src/core/models/my_data_types.dart`**:
    - Renamed the `Status` enum to `ApprovalStatus` and `EntityStatus` to `OperationalStatus` for better clarity.
    - Consolidated the `firstWhereOrNull` extension, making this file the single source of truth.
    - Added `ListingType` enum (`forRent`, `forSale`) to differentiate transaction types within entities.

- **`app/lib/src/features/home/domain/entity.dart`**:
    - Integrated the new `Pricing` model and `ListingType` enum.
    - Made rental-specific fields (`openingHours`, `isFurnished`, `genderPref`) nullable in the `Residence` factory to accommodate `forSale` properties.
    - **Removed** the `pricing` field from the `Food` entity, reverting `genderPref` to `required` for `Food` entities.

- **`app/lib/src/features/home/domain/helpers/list_extensions.dart`**:
    - **Removed** this file to eliminate duplicate code.

## Git Commit
- Staged all changes and committed them with the message: "feat: Refactor and stabilize Entity deserialization".

## New Files Created

- **`plan.md`**
- **`app/lib/src/features/home/domain/helpers/json_converters.dart`**
- **`app/lib/src/features/home/domain/helpers/entity_extensions.dart`**
- **`app/lib/src/core/models/pricing_types.dart`**
- **`app/lib/src/features/home/domain/pricing.dart`**
