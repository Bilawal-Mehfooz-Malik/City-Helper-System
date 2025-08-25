# Plan: Implement Carousel Ads Feature

This plan outlines the steps to implement a carousel ads feature on the home screen, allowing business owners to promote their shops with image-only ads, managed through a manual approval process.

---

### Master Checklist

- [x] **Phase 1: Data Model & Firestore Setup**
- [x] **Phase 2: Cloud Functions (Backend Logic)**
- [ ] **Phase 3: Business Owner Interface (Ad Creation & Management)**
- [ ] **Phase 4: Admin Interface (Ad Approval)**
- [x] **Phase 5: Flutter App Integration (Frontend)**
- [ ] **Phase 6: Testing & Deployment**

---

### Phase 1: Data Model & Firestore Setup

**Goal:** Define the ad document structure and prepare Firestore and Storage.

- [x] **1.1:** Create a new Firestore collection named `ads`.
- [x] **1.2:** Define the ad document structure for each ad, including:
    - `id` (string): Unique ad identifier.
    - `businessId` (string): ID of the owning business/shop.
    - `category` (string): e.g., "Residence", "Food".
    - `imageUrl` (string): URL to the 16:9 ad banner image.
    - `linkType` (string): "internal_profile" or "external_url".
    - `internalProfileId` (string, conditional): ID of the in-app profile to link to.
    - `externalUrl` (string, conditional): Full URL to an external website.
    - `startDate` (timestamp): When the ad starts showing.
    - `endDate` (timestamp): When the ad stops showing.
    - `createdAt` (timestamp): Ad creation timestamp.
    - `updatedAt` (timestamp): Last update timestamp.
    - `isActive` (boolean): True if ad is active.
    - `priorityScore` (number): 1 (Basic), 2 (Premium), 3 (Featured).
    - `lastShownAt` (timestamp): Last time ad was shown (for rotation).
    - `impressionCount` (number): Number of times ad has been shown.
    - `clickCount` (number): Number of times ad has been clicked.
    - `status` (string): "pending", "approved", "rejected", "paused".
- [ ] **1.3:** Set up Firebase Storage for storing ad banner images.

---

### Phase 2: Cloud Functions (Backend Logic)

**Goal:** Implement server-side logic for ad selection, impression tracking, and click tracking.

- [x] **2.1:** **`getCarouselAds` Cloud Function (HTTPS Callable)**:
    - **Input**: `category` (string).
    - **Logic**:
        - Query Firestore for active (`isActive: true`), approved (`status: "approved"`), and date-valid ads within the given `category`.
        - Implement quota-based selection:
            - Attempt to select 2 "Featured" ads (`priorityScore: 3`).
            - Attempt to select 2 "Premium" ads (`priorityScore: 2`).
            - Attempt to select 1 "Basic" ad (`priorityScore: 1`).
        - Implement fallback: If a higher tier doesn't meet its quota, fill remaining slots from lower tiers.
        - Implement round-robin/rotation within each tier using `lastShownAt` and `impressionCount` to ensure fair distribution.
        - Return a list of 5 selected ad documents (or fewer if not enough available).
- [x] **2.2:** **`recordAdImpression` Cloud Function (HTTPS Callable)**:
    - **Input**: `adId` (string).
    - **Logic**:
        - Increment `impressionCount` for the specified ad document in Firestore.
        - Update `lastShownAt` timestamp for the ad document.
- [x] **2.3:** **`recordAdClick` Cloud Function (HTTPS Callable)**:
    - **Input**: `adId` (string).
    - **Logic**:
        - Increment `clickCount` for the specified ad document in Firestore.

---

### Phase 3: Business Owner Interface (Ad Creation & Management)

**Goal:** Enable business owners to create, submit, and view the status of their ads.

- [ ] **3.1:** Develop an ad creation form within the business owner's dashboard:
    - UI for uploading a 16:9 ad banner image to Firebase Storage.
    - Input fields for selecting `category`.
    - Radio buttons/dropdown for `linkType` ("internal_profile" or "external_url").
    - Conditional input for `internalProfileId` (e.g., a lookup/selection of their own shop) or `externalUrl`.
    - Date pickers for `startDate` and `endDate`.
    - Submission button to create a new ad document in Firestore with `status: "pending"`.
- [ ] **3.2:** Develop an "My Ads" dashboard for business owners:
    - Display a list of all ads submitted by the business owner.
    - Show the current `status` (Pending, Approved, Rejected, Paused) for each ad.
    - Display `impressionCount` and `clickCount` for approved ads.
    - Allow editing of existing ads (editing should reset `status` to "pending" for re-approval).

---

### Phase 4: Admin Interface (Ad Approval)

**Goal:** Provide tools for administrators to review, approve, and manage ads.

- [ ] **4.1:** Develop an "Ad Moderation" section in the admin panel:
    - List all ads with `status: "pending"`.
    - Display ad details (image, link, business info, category, dates).
    - Buttons to change `status` to "approved" or "rejected".
    - Option to add a `rejectionReason` (string) if an ad is rejected.
    - Ability to manually set `priorityScore` (after payment confirmation).
    - Ability to manually toggle `isActive` (pause/resume) for any ad.

---

### Phase 5: Flutter App Integration (Frontend)

**Goal:** Display the ad carousel on the home screen and implement tracking.

- [x] **5.1:** Modify the home screen UI to include a carousel widget above the subcategories.
- [x] **5.2:** Implement logic to call the `getCarouselAds` Cloud Function for the current category.
- [x] **5.3:** Display the fetched ads in the carousel, ensuring the 16:9 aspect ratio is maintained.
- [ ] **5.4:** Implement impression tracking: When an ad becomes visible in the carousel, call the `recordAdImpression` Cloud Function.
- [x] **5.5:** Implement click tracking: When an ad is tapped, call the `recordAdClick` Cloud Function before navigating.
- [x] **5.6:** Implement navigation logic based on `linkType`:
    - If `internal_profile`, navigate to the corresponding in-app profile.
    - If `external_url`, open the URL in a web browser.

---

### Phase 6: Testing & Deployment

**Goal:** Ensure the ad feature is robust, functional, and deployed correctly.

- [ ] **6.1:** Write unit tests for all Cloud Functions (`getCarouselAds`, `recordAdImpression`, `recordAdClick`).
- [ ] **6.2:** Conduct integration tests for the entire ad workflow (creation -> approval -> display -> tracking).
- [ ] **6.3:** Perform end-to-end testing on the Flutter app for ad display and interaction.
- [ ] **6.4:** Deploy all new Cloud Functions.
- [ ] **6.5:** Deploy updated Flutter app versions to relevant platforms.
- [ ] **6.6:** Monitor Cloud Function logs and performance.