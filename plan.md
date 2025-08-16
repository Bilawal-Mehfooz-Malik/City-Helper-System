# Plan: Implement Infinite Scroll for Home Feature

This plan outlines the steps to implement an infinite scroll/pagination feature on the `HomeScreen`, starting with the "Popular Entities" list. The goal is to load an initial set of items and then fetch more as the user scrolls down, improving initial load time and network usage.

---

## 1. Refactor State Management for Pagination

**Goal:** Replace the existing "fetch-all" provider for popular entities with a state-managed provider that can handle paginated data, loading states, and errors for subsequent fetches.

### Detailed Checklist

- [ ] **1.1: Create a Pagination State Notifier:**
    - Create a new file `app/lib/src/features/home/application/popular_entities_paginated_provider.dart`.
    - Inside, define a `StateNotifier` called `PopularEntitiesNotifier`.
    - This notifier will manage the state, including:
        - The list of currently loaded entities (`List<Entity>`).
        - A flag to indicate if all items have been fetched (`bool hasMore`).
        - The current pagination cursor/page number.
        - An error object specifically for pagination (`Object? paginationError`).
        - A flag indicating if the *next* page is being fetched (`bool isLoadingNextPage`).

- [ ] **1.2: Implement Notifier Logic:**
    - Implement the `fetchFirstPage()` method for the initial data load.
    - Implement the `fetchNextPage()` method, which will:
        - Set `isLoadingNextPage` to `true`.
        - Call the `EntityService` to get the next batch of data.
        - On success, append the new entities to the list.
        - On failure, set the `paginationError`.
        - Set `isLoadingNextPage` to `false` when done.

- [ ] **1.3: Create the Riverpod Provider:**
    - Define a `StateNotifierProvider` that creates an instance of `PopularEntitiesNotifier`. This will be the new provider the UI listens to.

## 2. Update Data Layer to Support Pagination

**Goal:** Modify the `EntityService` and its underlying data source to fetch entities in chunks instead of all at once.

### Detailed Checklist

- [ ] **2.1: Analyze Data Fetching:**
    - Investigate `EntityService` to understand how `watchPopularEntities` currently fetches data from the repository (e.g., Firestore).

- [ ] **2.2: Update Repository Method:**
    - Modify the repository method responsible for fetching popular entities to accept pagination parameters (e.g., a `limit` and a `startAfter` document snapshot for Firestore).

- [ ] **2.3: Update Service Method:**
    - Create a new method in `EntityService` that calls the updated repository method with the correct pagination parameters. This method will be used by the new `PopularEntitiesNotifier`.

## 3. Integrate Pagination into the HomeScreen UI

**Goal:** Adapt the `HomeScreen` to use the new paginated provider, listen for scroll events, and display loading/error states correctly at the bottom of the list.

### Detailed Checklist

- [ ] **3.1: Update UI to Use New Provider:**
    - In `home_screen.dart`, switch from watching the old provider to the new `popularEntitiesNotifierProvider`.

- [ ] **3.2: Implement Scroll Listener:**
    - Add a `ScrollController` to the `ListView` that displays the popular entities.
    - Add a listener to the controller to detect when the user has scrolled near the bottom of the list.
    - When the scroll threshold is met, call `ref.read(popularEntitiesNotifierProvider.notifier).fetchNextPage()`.

- [ ] **3.3: Display Loading and Error Widgets:**
    - Modify the `ListView.builder`'s `itemBuilder`.
    - If `state.isLoadingNextPage` is true, show a few `EntityCardSkeleton` widgets (e.g., 3) at the bottom of the list to provide a better loading experience.
    - If `state.paginationError` is not null, show a compact error widget with a "Retry" button as the last item.
    - The "Retry" button should call `fetchNextPage()` again, only attempting to reload the failed page.

## 4. Code Cleanup

**Goal:** Remove obsolete code from the previous implementation to keep the codebase clean and maintainable.

### Detailed Checklist

- [ ] **4.1: Remove Old Provider:**
    - Once the new notifier is fully integrated, find and delete the old `watchPopularEntities` provider.

- [ ] **4.2: Remove Unused Functions:**
    - Identify and remove any other functions, widgets, or providers that were exclusively used by the old implementation and are now redundant.
