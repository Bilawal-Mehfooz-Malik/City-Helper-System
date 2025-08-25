## Chat History - Carousel Ads E2E Testing & Debugging

This session focused on implementing the full end-to-end flow for the Carousel Ads feature, from backend logic to frontend interaction, and involved an extensive debugging process to get it working with live Firebase services.

### 1. Frontend Click and Navigation Logic

-   **Goal**: Implement click tracking and navigation for the ad carousel.
-   **Implementation**:
    -   Initially implemented click handling directly in the `CarouselAdsList` widget.
    -   Refactored the implementation based on user feedback to use a cleaner architecture.
    -   Created a dedicated `AdInteractionNotifier` using Riverpod code generation to handle the business logic of recording an ad click.
    -   The UI (`CarouselAdsList` widget) was updated to call this new notifier and then handle navigation and error display (via a snackbar), correctly separating business logic from UI logic.

### 2. Test Updates

-   **Goal**: Align tests with the latest repository changes and fix failures.
-   **Implementation**:
    -   Updated the `fake_ads_carousel_repository_test.dart` to test the new `fetchCarouselAds` method and remove obsolete tests.
    -   Corrected the test data in `test_carousel_ads.dart` to use dynamic dates and include necessary `subcategoryId` fields, resolving all unit test failures.

### 3. Backend Seeding and Debugging

-   **Goal**: Test the feature with a live backend by populating Firestore with test data and debugging the live `getCarouselAds` Cloud Function.
-   **Implementation & Debugging Steps**:
    -   Created a `seedCarouselAds` HTTP-triggered function to populate the `carousel_ads` collection with 100 random, valid documents.
    -   Fixed a bug in the Cloud Functions where the collection name was inconsistent (`ads` vs. `carousel_ads`).
    -   Fixed a crash in the seeder function by setting Firestore to ignore `undefined` properties.
    -   Diagnosed that the `getCarouselAds` function returned an empty list due to an invalid query (two range filters). Corrected the query to use one range filter and perform the second filter in the function's code.
    -   Diagnosed that the corrected query was still failing due to a missing **Composite Index** in Firestore.
    -   Provided detailed instructions to create the required index.
    -   The final issue remains that the query returns an empty list, even after attempting to create the correct **Collection** index. The debugging is paused here.

---

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

## Chat History - Subcategory List Refinement & Test Stability

This session focused on optimizing the subcategory list data fetching and resolving test failures in fake repositories.

### 1. Subcategory List Data Fetching Optimization

-   **Goal**: Improve efficiency by switching the subcategory list from real-time `Stream` to one-time `Future` fetches, as subcategory data is typically static.
-   **Implementation**:
    -   Modified `app/lib/src/features/home/presentation/sub_categories_list.dart` and `app/lib/src/features/home/presentation/home_screen.dart` to use `subCategoriesListFutureProvider`.
    -   Removed unnecessary `watch` methods (`watchSubCategoriesList`, `watchSubCategory`) and their associated stream providers (`subCategoriesListStreamProvider`, `subCategoryStreamProvider`) from both `app/lib/src/features/home/data/real/sub_categories_repository.dart` and `app/lib/src/features/home/data/fake/fake_sub_categories_repository.dart`.

### 2. Test Stability for Fake Repositories

-   **Goal**: Resolve failing tests in fake repositories by addressing sorting mismatches and ensuring test data isolation.
-   **Implementation**:
    -   **Sorting Mismatch Fix**: For tests in `app/test/src/features/home/data/fake/fake_food_repository_test.dart` and `app/test/src/features/home/data/fake/fake_residence_repository_test.dart` that compared sorted results with unsorted expectations, the `expected` lists were updated to include `updatedAt` sorting.
    -   **Data Isolation for Sorting Tests**: Modified `FakeFoodRepository` and `FakeResidenceRepository` constructors to accept optional initial data. This allowed specific sorting tests to create isolated repository instances with only the necessary test data, preventing interference from global test data.
    -   **`fetchSubCategory` Implementation & Test**: Implemented the `fetchSubCategory` method in `app/lib/src/features/home/data/fake/fake_sub_categories_repository.dart` and added comprehensive test cases for it in `app/test/src/features/home/data/fake/fake_sub_categories_repository_test.dart` to verify correct retrieval and null handling.

## Chat History - Carousel Ads Feature Development

This session focused on implementing and refining the Carousel Ads feature, including backend Cloud Functions and Flutter data layer updates.

### 1. Cloud Functions Backend Logic

-   **Goal**: Implement server-side logic for ad selection, impression tracking, and click tracking.
-   **Implementation**:
    -   Corrected payload access in `getCarouselAds`, `recordAdImpression`, and `recordAdClick` functions (from `data.data` to `data`).
    -   Enhanced `getCarouselAds` to optionally filter ads by `subcategoryId`.
    -   Fixed a `Cannot find name 'adsRef'` error by re-introducing `adsRef` definition in `getCarouselAds`.

### 2. Flutter Data Layer Updates

-   **Goal**: Update Flutter models and repositories to align with backend changes for the Carousel Ads feature.
-   **Implementation**:
    -   Updated the `CarouselAd` model (`app/lib/src/features/home/domain/carousel_ad.dart`) to include a `subcategoryId` field.
    -   Modified `fetchCarouselAds` in both `app/lib/src/features/home/data/real/ads_carousel_repository.dart` and `app/lib/src/features/home/data/fake/fake_ads_carousel_repository.dart` to accept and utilize the optional `subcategoryId` for filtering.
    -   Renamed the `category` field to `categoryId` in the `CarouselAd` model and updated its usage in `fake_ads_carousel_repository.dart`.
    -   Resolved a `non_bool_operand` error in `fake_ads_carousel_repository.dart` by refactoring the `subcategoryId` filter condition.

### 3. Clarifications and Explanations

-   **Goal**: Provide detailed explanations regarding the behavior and design choices of the `getCarouselAds` function.
-   **Explanation**: Clarified why the function fetches up to 30 ads (not always 20) even though only 5 are used, detailing the quota system, round-robin mechanism, and the dynamic nature of the ad pool based on `lastShownAt` timestamps.
