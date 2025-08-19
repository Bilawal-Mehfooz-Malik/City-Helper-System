# Plan: Implement Infinite Scroll for All Entities List

This plan outlines the steps to implement an infinite scroll/pagination feature for the "All Entities" list on the `HomeScreen`. This will align its behavior with the already-paginated "Popular Entities" list, improving performance and user experience.

---

## 1. Create Paginated State Management for All Entities

**Goal:** Create a new state notifier to manage paginated data for the main entities list, handling state, filtering, and pagination errors.

### Detailed Checklist

- [x] **1.1: Create Pagination State and Notifier:**
    - Create `app/lib/src/features/home/application/entities_paginated_provider.dart`.
    - Define `EntitiesPaginatedState` (this can be the same as `PopularEntitiesPaginatedState` from `popular_entities_paginated_provider.dart`, so we can reuse it).
    - Define `EntitiesNotifier`, a `Notifier` that will:
        - Manage the list of entities, `hasMore`, `paginationError`, and `isLoadingNextPage`.
        - Watch the `filterControllerProvider` and `subcategoryControllerProvider` to react to changes.
        - When filters or the subcategory change, it will reset the list and fetch the first page with the new criteria.

- [x] **1.2: Implement Notifier Logic:**
    - Implement `fetchFirstPage()` to load initial data based on current filters.
    - Implement `fetchNextPage()` to load subsequent pages.
    - The notifier will be responsible for applying filtering and sorting from `filtering_logic.dart` to the fetched list of entities.

## 2. Update Data and Service Layers for Pagination

**Goal:** Add pagination support to the data-fetching methods for all entities.

### Detailed Checklist

- [x] **2.1: Update Repository Methods:**
    - In `FoodRepository` and `ResidenceRepository`, update the existing `fetchFoodsList`, `fetchFoodsListSubCategoryId`, `fetchResidencesList`, and `fetchResidencesListBySubCategoryId` methods to accept pagination parameters (`limit` and `lastEntityId`).

- [x] **2.2: Update `EntityService`:**
    - Create a new method `fetchEntitiesPaginated` in `EntityService`.
    - This method will take `categoryId`, `subcategoryId`, `limit`, and `lastEntityId` as arguments.
    - It will call the appropriate updated repository method to fetch a chunk of *unfiltered* data.

## 3. Integrate Pagination into the UI

**Goal:** Refactor `EntitiesListSection` and `HomeScreen` to use the new paginated provider and implement infinite scrolling.

### Detailed Checklist

- [x] **3.1: Refactor `EntitiesListSection`:**
    - Convert `EntitiesListSection` into a `ConsumerWidget` that is prepared for stateful logic if needed, but the `ScrollController` will be managed by its parent.
    - Update it to use the new `entitiesNotifierProvider`.
    - The `EntitiesGridLayout` inside will be updated to:
        - Display the list from the notifier's state.
        - Conditionally render loading skeletons at the end of the grid when `isLoadingNextPage` is true.
        - Display a pagination error message if `paginationError` is set.

- [x] **3.2: Implement Scroll Listener in `HomeScreen`:**
    - In `home_screen.dart`, add a `ScrollController` to the main `CustomScrollView`.
    - Convert `HomeScreen` to a `ConsumerStatefulWidget` to manage the `ScrollController`.
    - Add a listener to the controller that calls `ref.read(entitiesNotifierProvider.notifier).fetchNextPage()` when the user scrolls to the bottom.

## 4. Code Cleanup

**Goal:** Remove the old, non-paginated providers and associated logic to finalize the refactoring.

### Detailed Checklist

- [x] **4.1: Remove Old Provider:**
    - Delete the `watchEntities` provider from `entity_service.dart`.

- [x] **4.2: Update Dependent Code:**
    - Update `home_error_controller.dart` to no longer use `watchEntitiesProvider`. The critical error handling will need to be adapted to watch the new paginated provider's error state.

- [x] **4.3: Remove Unused Functions:**
    - Remove any other helper functions or variables that were only used by the old `watchEntities` provider.
