
# Product Requirements Document: City Helper System

## 1. Introduction

The City Helper System is a comprehensive mobile and web platform designed to connect residents and visitors with local services and businesses. Initially focusing on the "Residences" and "Food" sectors, the application serves as a one-stop directory for users to discover, view, and review local establishments. It also provides a dedicated portal for business owners to register and manage their listings.

## 2. Goals and Objectives

*   **Primary Goal:** To create a centralized, user-friendly platform for discovering local services within a city.
*   **For Users:** Provide a reliable and easy-to-use tool to find and evaluate local businesses (e.g., hostels, restaurants).
*   **For Business Owners:** Offer a simple, self-service platform to list their business, manage their information, and reach a wider audience.
*   **Technical Goal:** Build a scalable, cross-platform application with a clean architecture that can be easily extended to include more categories and features in the future.

## 3. Target Audience

*   **Consumers:**
    *   Students, professionals, and tourists looking for accommodation (rooms, hostels, flats).
    *   Residents and visitors looking for dining options (restaurants, cafes, street food).
*   **Business Owners:**
    *   Landlords, hostel managers, and real estate agents.
    *   Restaurant, café, and food stall owners.

## 4. Core Features (Consumer-Facing)

### 4.1. Onboarding & Location Setup
*   **Requirement:** The app must determine the user's location to provide relevant, localized results.
*   **User Story:**
    *   As a new user, upon first launch, I am presented with a welcome screen.
    *   I am prompted to grant location permissions.
    *   I can choose to automatically detect my location using GPS ("Get Current") or manually select it on a map ("From Map").
    *   My chosen location is saved for future sessions.

### 4.2. Authentication & User Profile
*   **Requirement:** Users must be able to create an account to leave reviews and access personalized features.
*   **User Story:**
    *   As a user, I can sign up or log in using my phone number via OTP verification.
    *   After verification, I am prompted to create a profile with my full name and an optional profile picture.
    *   Once logged in, I can view my account details, including my name, phone number, and saved location on a map.
    *   I can edit my profile information at any time.
    *   I can log out of my account.

### 4.3. Browsing & Discovery
*   **Requirement:** Users must be able to easily browse and discover listings.
*   **User Story:**
    *   As a user, I can see a list of top-level service categories (e.g., "Residences", "Food").
    *   After selecting a category, I am taken to a home screen for that category.
    *   This screen displays sub-categories (e.g., "Hostels", "Restaurants") as filterable chips.
    *   I can view a carousel of featured advertisements relevant to the category.
    *   I can see a horizontally scrolling list of "Popular" listings.
    *   I can see a grid of "All" listings.

### 4.4. Search & Filtering
*   **Requirement:** Users must be able to search for specific listings and apply filters to narrow down results.
*   **User Story:**
    *   As a user, I can use a search bar to find listings by name.
    *   I can apply filters to the list of entities. Common filters include:
        *   Show only currently "Open" businesses.
        *   Sort by rating (high-to-low, low-to-high).
    *   For "Residences," I can also filter by:
        *   Price (low-to-high, high-to-low).
        *   Furnished status.
        *   Gender preference (Male Only, Female Only, Family Friendly).
    *   For "Food," I can filter by gender preference.

### 4.5. Listing Details
*   **Requirement:** Users must be able to view comprehensive details for each listing.
*   **User Story:**
    *   As a user, when I tap on a listing, I am taken to a detail screen.
    *   I can see a gallery of images for the business.
    *   I can read a detailed description.
    *   I can see the business's location on a map and get directions.
    *   I can view contact information (phone, email, website, social media) and interact with it (e.g., tap to call).
    *   I can see the daily opening and closing hours.
    *   I can view the overall average rating and a breakdown of ratings by star count.

### 4.6. Reviews & Ratings
*   **Requirement:** Logged-in users must be able to leave reviews and ratings for businesses.
*   **User Story:**
    *   As a logged-in user, I can submit a star rating (1-5) and a text comment for a listing.
    *   If I have already reviewed a place, I can edit my existing review.
    *   On the detail screen, I can see a list of all reviews left by other users.
    *   I can filter and sort the reviews list (e.g., by latest, highest rating).

## 5. Business Owner Features (My Shop Portal)

*   **Requirement:** A logged-in user must be able to switch to an "Admin" mode to manage their business listing.
*   **User Story:**
    *   As a user, I can switch between "User Mode" and "Admin Mode" from my account menu.
    *   In Admin Mode, I see a dashboard for "My Shop".
    *   If I haven't registered a shop, I am prompted to create one.
    *   I can create a new listing through a multi-step form, providing all necessary details (category, name, location, contact info, images, etc.).
    *   If I have an existing shop, I can view its details and edit them using the same form.
    *   I can manually override my shop's status to "Open" or "Closed", independent of the scheduled opening hours.

## 6. Non-Functional Requirements

*   **Performance:** The app should be fast and responsive, with smooth scrolling and quick loading times. Image loading should be optimized.
*   **Scalability:** The backend (Firestore) and architecture should be designed to handle a growing number of users and listings.
*   **Security:** API keys and sensitive credentials must not be hardcoded in the client application. They should be loaded from secure environment variables.
*   **Usability:** The app must be intuitive and easy to navigate for non-technical users on both mobile and desktop/web platforms. The UI should be responsive to different screen sizes.

## 7. Future Considerations (Out of Scope for V1)

*   **Additional Categories:** Expand beyond "Residences" and "Food" to include categories like "Beauty & Salons," "Hospitals," "Shopping," etc.
*   **Booking/Reservations:** Allow users to book rooms or reserve tables directly through the app.
*   **Push Notifications:** Notify users about new reviews, special offers, or messages from businesses.
*   **Direct Messaging:** Implement a chat feature for users to communicate directly with business owners.
*   **Advanced Analytics:** Provide business owners with a dashboard showing views, engagement, and review statistics for their listing.

## 8. Technology Stack

*   **Frontend:** Flutter
*   **State Management:** Flutter Riverpod
*   **Navigation:** go_router
*   **Backend Database:** Cloud Firestore
*   **Authentication:** Firebase Authentication (Phone OTP)
*   **File Storage:** Firebase Storage
*   **Search:** Algolia
*   **Mapping:** Google Maps Platform
