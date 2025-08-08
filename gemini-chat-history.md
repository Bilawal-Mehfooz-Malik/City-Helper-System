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
- **`app/lib/src/features/home_detail/presentation/widgets/profile_circular_avator.dart`**:
    - Simplified the widget by removing auth-related logic.

## Recent Changes (Deserialization and Refactoring)

### Bug Fixes:
- **`app/lib/src/features/home/data/real/food_repository.dart` & `residence_repository.dart`**:
    - Modified the `fromFirestore` converter to inject a `runtimeType` field (`'food'` or `'residence'`) into the data map before calling `Entity.fromJson`. This fixed a `CheckedFromJsonException`.

- **`app/lib/src/features/home/domain/helpers/json_converters.dart`**:
    - Updated the `LatLngJsonConverter` to correctly deserialize the `latLng` field from Firestore's `List` or `GeoPoint` formats into a `LatLng` object, fixing a `TypeError`.

- **`app/lib/src/features/home/domain/entity.dart`**:
    - Added `@Default` values to `avgRating`, `totalReviews`, `price`, and `genderPref` fields to prevent crashes from `null` values in Firestore data.

### Refactoring:
- **`app/lib/src/features/home/domain/entity.dart`**:
    - Deconstructed the large `entity.dart` file into smaller, more focused files within a new `helpers` directory.

- **`app/lib/src/core/models/my_data_types.dart`**:
    - Renamed the `Status` enum to `ApprovalStatus` for better clarity.
    - Consolidated the `firstWhereOrNull` extension, making this file the single source of truth.

- **`app/lib/src/features/home/domain/helpers/list_extensions.dart`**:
    - **Removed** this file to eliminate duplicate code.

## Git Commit
- Staged all changes and committed them with the message: "feat: Refactor and stabilize Entity deserialization".

## New Files Created

- **`plan.md`**
- **`app/lib/src/features/home/domain/helpers/json_converters.dart`**
- **`app/lib/src/features/home/domain/helpers/entity_extensions.dart`**
