# Plan: Implement Server-Side Filtering

This plan outlines the steps to refactor our data-fetching pipeline to apply filters directly within Firestore queries. This leverages our existing pagination system, ensuring that filtering is efficient, scalable, and cost-effective by only downloading the data the user requests.

---

## 1. Update Repository Layer to Build Dynamic Queries

**Goal:** Modify the repository methods to accept an `EntityFilter` object and dynamically construct Firestore queries based on its properties.

### Detailed Checklist

- [x] **1.1: Update `FoodRepository` Methods:**
    - Modify `fetchFoodsList` and `fetchFoodsListSubCategoryId`.
    - These methods will now accept a `FoodFilter` object.
    - Inside each method, build a `Query` object by conditionally adding:
        - `.where('isOpen', isEqualTo: true)` if `filter.isOpen` is true.
        - `.where('genderPref', isEqualTo: ...)` if `filter.genderPref` is not `any`.
        - `.orderBy('rating', ...)` if `filter.ratingSort` is not `none`.
    - The existing pagination logic (`limit`, `startAfterDocument`) will be applied to this dynamic query.

- [x] **1.2: Update `ResidenceRepository` Methods:**
    - Modify `fetchResidencesList` and `fetchResidencesListBySubCategoryId`.
    - These methods will now accept a `ResidenceFilter` object.
    - Build a `Query` object by conditionally adding `.where()` and `.orderBy()` clauses for `isOpen`, `isFurnished`, `genderPref`, `ratingSort`, and `priceSort`.

- [x] **1.3: Update Popular Entity Fetching Methods:**
    - Update `fetchPopularFoods` and `fetchPopularResidences` to also accept the relevant filter and apply it to their queries.

## 2. Update Service Layer to Pass Filters

**Goal:** Thread the `EntityFilter` object from the application layer down to the repository layer.

### Detailed Checklist

- [x] **2.1: Update `EntityService` Methods:**
    - Modify `fetchEntitiesPaginated` and `fetchPopularEntitiesPaginated`.
    - These methods will now require an `EntityFilter` parameter.
    - They will pass this filter object down to the appropriate repository method.

## 3. Update Application Layer (Notifiers)

**Goal:** Read the active filter from the UI state and use it when fetching data.

### Detailed Checklist

- [x] **3.1: Update `EntitiesNotifier`:**
    - In `entities_paginated_provider.dart`, modify the logic that calls `fetchEntitiesPaginated`.
    - It will now read the current filter from `filterControllerProvider` and pass it to the service method.
    - The existing logic that re-fetches data when the filter changes will now correctly trigger a new server-side query.

- [x] **3.2: Update `PopularEntitiesNotifier`:**
    - In `popular_entities_paginated_provider.dart`, apply the same logic as above.
    - The notifier will read the filter and pass it to `fetchPopularEntitiesPaginated`.

## 4. Verification and Indexing

**Goal:** Test the implementation and create the necessary Firestore indexes.

### Detailed Checklist

- [ ] **4.1: Manual Testing:**
    - Run the app and test all filter and sort combinations for both "All Entities" and "Popular Entities".
    - Check the debug console for errors from Firestore about missing indexes.

- [ ] **4.2: Create Composite Indexes:**
    - As errors appear, use the link provided in the Firestore error message to create the required composite indexes in the Firebase Console.
    - **Note:** This is a manual step that must be done in the Firebase project settings. The application will not work correctly without these indexes.

# Plan: Introduce Separate Filter Contexts

**Goal:** Allow independent filtering for the "All Entities" list and the "Popular Entities" list.

---

## 1. Create Separate Filter Providers

**Goal:** Define distinct Riverpod providers for each filter context.

### Detailed Checklist

- [x] **1.1: Rename `filterControllerProvider`:**
    - Rename `app/lib/src/features/home/presentation/controllers/filter_controller.dart` to `app/lib/src/features/home/presentation/controllers/entities_filter_controller.dart`.
    - Rename the class `FilterController` to `EntitiesFilterController`.
    - Rename the provider `filterControllerProvider` to `entitiesFilterControllerProvider`.

- [x] **1.2: Create `popular_entities_filter_controller.dart`:**
    - Create a new file `app/lib/src/features/home/presentation/controllers/popular_entities_filter_controller.dart`.
    - This file will contain a new `PopularEntitiesFilterController` class and `popularEntitiesFilterControllerProvider`, mirroring the structure of `EntitiesFilterController`.

---

## 2. Update Notifiers to Watch Respective Filter Providers

**Goal:** Ensure each notifier reacts only to changes in its dedicated filter provider.

### Detailed Checklist

- [x] **2.1: Update `EntitiesNotifier`:**
    - In `app/lib/src/features/home/application/entities_notifier.dart`, change `ref.watch(filterControllerProvider(...))` to `ref.watch(entitiesFilterControllerProvider(...))`.
    - Change `ref.read(filterControllerProvider(...))` to `ref.read(entitiesFilterControllerProvider(...))`.

- [x] **2.2: Update `PopularEntitiesNotifier`:**
    - In `app/lib/src/features/home/application/popular_entities_notifier.dart`, change `ref.watch(filterControllerProvider(...))` to `ref.watch(popularEntitiesFilterControllerProvider(...))`.
    - Change `ref.read(filterControllerProvider(...))` to `ref.read(popularEntitiesFilterControllerProvider(...))`.

---

## 3. Update UI Components to Use Correct Filter Context

**Goal:** Modify `FilterDialog` and its calling sites to interact with the appropriate filter provider.

### Detailed Checklist

- [x] **3.1: Modify `FilterDialog`:**
    - Update `app/lib/src/features/home/presentation/widgets/filter_dialog.dart`.
    - The `FilterDialog` will need a new parameter, e.g., `FilterContext contextType`, to determine which filter provider it should interact with.
    - Inside `FilterDialog`, use a `switch` statement or `if/else` to read/update either `entitiesFilterControllerProvider` or `popularEntitiesFilterControllerProvider` based on `contextType`.

- [x] **3.2: Update `EntitiesListSection`:**
    - In `app/lib/src/features/home/presentation/entities_list_section.dart`, when calling `_showFilterDialog`, pass the appropriate `FilterContext` (e.g., `FilterContext.allEntities`).

- [x] **3.3: Update `PopularEntitiesListScreen`:**
    - In `app/lib/src/features/home/presentation/popular_entities_list_screen.dart`, when calling `_showFilterDialog`, pass the appropriate `FilterContext` (e.g., `FilterContext.popularEntities`).
    - Also, update the `resetFilters()` call in `_onBack` to use `popularEntitiesFilterControllerProvider`.

---