# City Helper System - Data Models

## 4. Data Model

### 4.1. AppUser
- `uid` (String): Unique user ID.
- `phoneNumber` (String): User's phone number.
- `name` (String): User's display name.
- `profileImageUrl` (String?): URL to user's profile image.
- `lastLocation` (LatLng?): Last known geographical location of the user.

### 4.2. Entity (Food & Residence)

#### Common Fields for Food and Residence Entities:
- `id` (String): Unique entity ID.
- `categoryId` (int): Category ID (e.g., 1 for Residence, 2 for Food).
- `subCategoryId` (int): Subcategory ID.
- `coverImageUrl` (String): URL to the cover image.
- `name` (String): Shop name.
- `cityName` (String): City where the shop is located.
- `sectorName` (String): Sector/area within the city.
- `latLng` (LatLng): Geographical coordinates.
- `avgRating` (double): Average rating.
- `totalReviews` (int): Total number of reviews.
- `isPopular` (bool): Flag for popular listings.
- `openingHours` (Map<DayOfWeek, OpeningHours>): Daily opening hours.
- `approvalStatus` (ApprovalStatus: `pending`, `approved`, `blocked`): Status of the shop's approval.
- `genderPref` (GenderPreference): Gender preference for the shop.
- `updatedAt` (DateTime): Last update timestamp.
- `ownerId` (String): ID of the user who owns the shop (stored in Firestore document, not directly in `Entity` object).
- `description` (String)
- `galleryImageUrls` (List<String>)
- `streetAddress` (String)
- `phoneNumber` (String)
- `messagingNumber` (String)
- `websiteUrl` (String?)
- `instagramUrl` (String?)
- `facebookUrl` (String?)
- `email` (String?)

#### Residence Specific Fields:
- `pricing` (Pricing): Cost, unit, and period.
- `isFurnished` (bool): Whether the residence is furnished.
- `listingType` (ListingType: `forRent`, `forSale`): Type of listing.
- `isRoomAvailable` (bool): Whether a room is available.

#### Food Specific Fields:
- `operationalStatus` (OperationalStatus: `open`, `close`, `defaultStatus`): Current operational status.

### 4.3. CarouselAd
- `id` (String): Unique ad ID.
- `businessId` (String): ID of the owning business/shop.
- `categoryId` (int): Category of the ad.
- `subcategoryId` (int?): Optional subcategory.
- `imageUrl` (String): URL to the ad banner image.
- `linkType` (AdLinkType: `internalProfile`, `externalUrl`): Type of link.
- `internalProfileId` (String?): ID of the in-app profile to link to.
- `externalUrl` (String?): External URL to link to.
- `startDate` (DateTime): Ad start date.
- `endDate` (DateTime): Ad end date.
- `createdAt` (DateTime): Ad creation timestamp.
- `updatedAt` (DateTime): Last update timestamp.
- `isActive` (bool): Whether the ad is active.
- `priorityScore` (int): Priority of the ad (1: Basic, 2: Premium, 3: Featured).
- `lastShownAt` (DateTime?): Timestamp of last impression.
- `impressionCount` (int): Number of impressions.
- `clickCount` (int): Number of clicks.
- `status` (AdApprovalStatus: `pending`, `approved`, `rejected`, `paused`): Ad approval status.

### 4.4. Category
- `id` (int)
- `name` (String)
- `description` (String)
- `iconName` (String)
- `sortOrder` (int)

### 4.5. SubCategory
- `id` (int)
- `name` (String)
- `categoryId` (int)
- `sortOrder` (int)

### 4.6. Review
- `userId` (String)
- `entityId` (String)
- `rating` (double)
- `comment` (String)
- `updatedAt` (DateTime)

### 4.7. OpeningHours
- `isDayOff` (bool)
- `is24Hours` (bool)
- `slots` (List<TimeSlot>?)

### 4.8. TimeSlot
- `open` (String)
- `close` (String)

### 4.9. Pricing
- `cost` (double)
- `unit` (PricingUnit: `person`, `room`, `unit`)
- `period` (PricingPeriod: `oneTime`, `day`, `week`, `month`, `year`)