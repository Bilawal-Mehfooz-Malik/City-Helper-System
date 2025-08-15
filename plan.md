# Plan Checklist

- [x] Refactor repetitive logic in `EntityService`.
- [ ] Implement granular error handling in `combinedErrorStatusProvider`.

---

# Plan to Refactor Home Feature Logic and Error Handling

This plan outlines the steps to improve the `home` feature by refactoring duplicated logic and implementing more granular error handling.

## 1. Refactor Repetitive Logic in `EntityService`

**Goal:** Eliminate the duplicated filtering and sorting logic within the `watchPopularEntities` and `watchEntities` providers to adhere to the DRY (Don't Repeat Yourself) principle.

**File to Modify:** `app/lib/src/features/home/application/entity_service.dart`

**Steps:**

1.  Create a private helper method named `_applyFilteringAndSorting`.
2.  This method will accept a `Stream<List<Entity>>` and an `EntityFilter` as arguments.
3.  It will contain the existing `.map()` logic that applies filtering and sorting to the stream of entities.
4.  Update both the `watchPopularEntities` and `watchEntities` providers to call this new helper method, passing the appropriate entity stream and filter.
5.  This will centralize the filtering/sorting logic, making it more maintainable and less error-prone.

## 2. Implement Granular Error Handling

**Goal:** Prevent non-critical data loading errors (e.g., for ads or sub-categories) from causing a screen-wide failure. The main content should still render if possible.

**File to Modify:** `app/lib/src/features/home/presentation/controllers/combined_error_controller.dart`

**Steps:**

1.  Modify the `combinedErrorStatusProvider` to only watch for errors from **critical** data sources, which are the main entity lists.
2.  Remove the `ref.watch` calls for `subCategoriesListStreamProvider` and `adsListFutureProvider`. The widgets responsible for displaying this data (`SubCategoriesList` and `CarouselAdsList`) already handle their own errors gracefully by hiding the section, so a global error is not needed.
3.  Correct the provider's logic to intelligently watch only the relevant entity provider (`watchEntitiesProvider` or `watchPopularEntitiesProvider`) based on the state of the `listTypeControllerProvider`. This makes the error checking more precise and fixes a latent bug where both lists were being watched unnecessarily.
4.  The `HomeScreen` will continue to use this provider, but now it will only show a full-screen error if the main entity list fails to load, resulting in a more resilient UI.
e