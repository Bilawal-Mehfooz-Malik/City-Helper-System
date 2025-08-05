
# Feature Documentation: Categories List

## 1. Overview

The "Categories List" feature serves as the primary navigation hub of the City Helper System after the initial location setup. Its core responsibility is to fetch and display the top-level service categories (e.g., "Residences," "Food") to the user.

The feature is designed to be fully responsive, offering an optimized user experience for both small-screen (mobile) and large-screen (tablet, desktop) devices.

## 2. Architecture & File Breakdown

The feature follows a clean, layered architecture powered by Riverpod for state management and dependency injection.

### A. Domain Layer

This layer defines the core business objects and rules.

-   **`domain/category.dart`**:
    -   Defines the `Category` data model, which represents a single service category.
    -   Includes `fromJson` and `toJson` methods for seamless (de)serialization with Cloud Firestore.
    -   Contains a helper method `getCategoryIcon(String iconName)` that converts a string identifier from the database (e.g., "food") into a concrete `IconData` (e.g., `Icons.fastfood`) for rendering in the UI.
-   **`domain/categories_exception.dart`**:
    -   Defines custom `AppException` classes specific to this feature, such as `NoCategoryFoundException`.

### B. Data Layer

This layer handles the abstraction of data sources.

-   **`data/categories_repository.dart`**:
    -   The single source of truth for category data. It communicates directly with the `categories` collection in Cloud Firestore.
    -   Uses a `withConverter` to work directly with `Category` objects, ensuring type safety and abstracting away the raw Firestore data structure.
    -   Provides methods for both one-time data fetches (`fetchCategoriesList`) and real-time updates (`watchCategoriesList`).
    -   Exposes its functionality through a set of Riverpod providers (`categoriesRepositoryProvider`, `categoriesListFutureProvider`, `categoriesListStreamProvider`) for easy consumption by the presentation layer.
-   **`data/fake_categories_repository.dart`**:
    -   A mock implementation of the repository used for testing. It uses an in-memory list of `testCategories` and simulates network delay, enabling fast and reliable tests without a live backend.

### C. Presentation Layer

This layer is responsible for the UI and handling user interactions.

-   **`presentation/categories_list_screen.dart`**:
    -   The main widget for this feature.
    -   It uses `isSmallScreen()` to determine the device's form factor and renders either `SmallScreenContent` or `LargeScreenContent`.
    -   It watches `categoriesListStreamProvider` and uses an `AsyncValueWidget` to handle loading, error, and data states gracefully, showing a `CategorySkeletonList` while loading.
-   **`presentation/widgets/categories_list_view.dart`**:
    -   Renders the vertical list of categories.
    -   Contains the critical `_onTap` logic that differentiates behavior based on screen size.
-   **`presentation/widgets/category_card.dart`**:
    -   A versatile widget that can display a category as either a large, detailed `Card` (for small screens) or a compact `ListTile` (for the side panel on large screens).
    -   On large screens, it watches the `selectedCategoryIdControllerProvider` to highlight itself when it is the currently selected item.
-   **`presentation/controllers/selected_category_controller.dart`**:
    -   A `NotifierProvider` that holds the state of the currently selected `CategoryId`. This is the key to the master-detail view on large screens. When a category is tapped in the list, this provider's state is updated.
-   **`presentation/widgets/categories_start_content.dart`**:
    -   The UI for the "master" (left) pane in the large-screen layout. It displays the header and the `CategoriesListView`.
-   **`presentation/widgets/categories_end_content.dart`**:
    -   The UI for the "detail" (right) pane in the large-screen layout.
    -   It watches `selectedCategoryIdControllerProvider`. If no category is selected, it shows a prompt. When a category ID is set, it renders the `HomeScreen` for that specific category.

## 3. User Flow & Responsive Logic

The user flow is tailored to the device's screen size.

### Small Screen Flow (Mobile)

1.  The `CategoriesListScreen` renders `SmallScreenContent`.
2.  A full-screen `ListView` of `CategoryCard` widgets is displayed.
3.  The user taps on a category card.
4.  The `_onTap` method in `CategoriesListView` is triggered.
5.  `go_router` is called to navigate the user to a new, separate `HomeScreen`, passing the selected `categoryId` as a path parameter (e.g., `/home/1`).

### Large Screen Flow (Tablet/Desktop)

1.  The `CategoriesListScreen` renders `LargeScreenContent`.
2.  A `DraggableTwoColumnLayout` is displayed.
    -   The **left pane** (`CategoriesStartContent`) shows a `ListView` of categories rendered as compact `ListTile`s.
    -   The **right pane** (`CategoriesEndContent`) initially shows a "Select a category" message because the `selectedCategoryIdControllerProvider` state is `null`.
3.  The user taps on a category `ListTile` in the left pane.
4.  The `_onTap` method in `CategoriesListView` is triggered.
5.  It updates the state of `selectedCategoryIdControllerProvider` with the tapped category's ID.
6.  The `CategoriesEndContent` widget, which is listening to this provider, automatically rebuilds and displays the `HomeScreen` for the selected category within the right pane. Navigation to a new page does not occur.
