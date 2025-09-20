# Release Notes - FindOut Internal Testing Build v1.0.0

## Introduction

This is the first internal testing build of the "FindOut" application (City Helper System). This version includes the end-to-end implementation of all core features as outlined in the Product Requirements Document, along with significant recent enhancements and bug fixes. The purpose of this release is to gather feedback on functionality, user experience, and overall stability.

---

## What's New & Major Enhancements

This build includes several major features and improvements implemented recently:

-   **Advanced Review System**: The review section is now fully dynamic. Users can sort reviews by latest, oldest, highest, or lowest rating. The "All Reviews" screen supports infinite scrolling with server-side pagination and filtering by star rating.
-   **Menu Images for Food Listings**: Food businesses can now upload and display a dedicated menu gallery (up to 10 images) in addition to their main photo gallery.
-   **Enhanced Photo Viewer**: The fullscreen photo viewer has been completely overhauled. It now supports both asset and network images, features conditional navigation arrows on large screens, and uses a more robust routing solution (`go_router`) to prevent navigation bugs.
-   **End-to-End Security Hardening**:
    -   **Cloud Functions**: All Cloud Functions are now protected by Firebase App Check to prevent unauthorized access.
    -   **Firestore Rules**: Database security rules have been completely rewritten to be more restrictive. Users can now only create, read, update, or delete their own data (profiles, reviews, shop listings), preventing unauthorized data manipulation.
-   **Dynamic "Open/Closed" Status**: The open/closed status for businesses is now more intelligent, correctly reflecting manual overrides and calculated opening hours.

---

## Bug Fixes

-   **Profile Editing**: Fixed a bug that prevented users from editing their name in the profile screen.
-   **Listing Sort**: Resolved an issue where food listings with zero reviews would incorrectly disappear when sorting by rating.
-   **Navigation**:
    -   Fixed a bug where the "See All" button for popular items would break the navigation stack. It now correctly pushes the new screen.
    -   Corrected the back button behavior in the fullscreen photo viewer to ensure it returns to the previous screen.
-   **Data & Display**:
    -   Addressed issues with duplicate reviews appearing in test data.
    -   Fixed layout and data rendering bugs in the "All Reviews" screen.

---

## Core Features Ready for Testing

### 1. Onboarding & Authentication
-   **Startup & Location**: First-time users should see the startup screen and be prompted to set their location via GPS or from a map.
-   **Phone Authentication**: Users can sign up and log in using their phone number with OTP verification.
-   **User Profile**: After login, users can create and edit their profile, including name and profile picture. The user's location is displayed on a map in their account screen.

### 2. Browsing & Discovery
-   **Category Selection**: Users can select between "Residences" and "Food" categories.
-   **Home Screen**: For each category, the home screen should display:
    -   A list of filterable sub-category chips.
    -   A horizontally scrolling list of "Popular" listings.
    -   A grid of "All" listings with infinite scroll.
-   **Search**: Users can search for listings by name within a category.

### 3. Filtering
-   **General Filters**: Sorting by rating and "Open" status should work for all listings.
-   **Residence Filters**: Test filtering by price, furnished status, and gender preference.
-   **Food Filters**: Test filtering by gender preference.

### 4. Listing Details
-   **Detail Screen**: Tapping any listing should open a detailed view.
-   **Content to Verify**:
    -   Image Gallery (with fullscreen viewer).
    -   Menu Image Gallery (for Food listings).
    -   Description, location on map, and contact information.
    -   Opening hours and dynamic open/closed status.
    -   Average rating and a preview of the latest reviews.

### 5. Reviews & Ratings
-   **Submit/Update Review**: Logged-in users with a complete profile can leave a star rating (1-5) and a text comment. If a review already exists, they can update it.
-   **All Reviews Screen**:
    -   Accessible from the detail page.
    -   Displays all reviews with infinite scroll.
    -   Test sorting by "Latest", "Oldest", "Highest Rating", and "Lowest Rating".
    -   Test filtering by star rating (1-5 stars, and "All").

### 6. Business Owner Portal ("My Shop")
-   **Mode Switching**: Users can switch between "User Mode" and "Admin Mode" from the account menu.
-   **Shop Creation & Editing**: A multi-step form allows business owners to create a new listing or edit an existing one. All fields across the 5 steps should be testable.
-   **Dashboard**: The "My Shop" dashboard should correctly display the user's registered business or prompt them to create one.
-   **Status Toggles**: Business owners can manually override their shop's operational status ("Open"/"Closed") and availability ("Available"/"Unavailable" for residences).

---

## Known Issues & Limitations

-   **Advertisements**: The carousel for advertisements is not yet enabled in the UI, pending further development.
-   **Out of Scope for V1**: Push notifications, direct messaging, booking/reservations, and advanced analytics for business owners are not included in this build.
-   **Data**: This build is connected to a development database. All data is for testing purposes only and may be wiped at any time.

---

## How to Provide Feedback

Please report any bugs, crashes, or UI/UX feedback to **[Your Designated Feedback Channel, e.g., #findout-testing on Slack]**. When reporting a bug, please include steps to reproduce it and a screenshot if possible.
