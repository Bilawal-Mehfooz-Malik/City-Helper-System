# One-Month App Launch Plan

This document outlines a high-level plan to refactor existing features, implement essential services (security, crashlytics), and prepare the City Helper System app for launch within one month.

## Guiding Principles:
- **Prioritization:** Focus on core functionality and critical non-functional requirements first.
- **Incremental Development:** Refactor and re-enable features one by one, testing thoroughly after each.
- **Automation:** Leverage existing build/test automation where possible.
- **Buffer Time:** Allocate dedicated time for unexpected issues and final polish.

---

## Week 1: Foundation & Core Feature Refactoring (Home)

**Goal:** Stabilize the core `home` feature with `freezed` classes and ensure basic app functionality.

### Tasks:
- **Day 1-2: Environment Setup & Verification**
    - Ensure `build_runner` is correctly configured and running.
    - Verify `flutter pub get` and `flutter run` work without errors after previous commenting.
    - Review existing project conventions and coding standards.
- **Day 3-5: Home Feature Refactoring (Phase 1)**
    - Select the most critical components/models within the `home` feature.
    - Convert relevant models/classes to `freezed` classes (e.g., `Entity`, `SubCategory`).
    - Re-enable and adapt code in `home` feature to use the new `freezed` classes.
    - Run existing unit/widget tests for the `home` feature.
    - Manual testing of the `home` screen.
- **Day 6-7: Home Feature Refactoring (Phase 2) & Initial Security Review**
    - Continue converting remaining `home` feature models/classes to `freezed`.
    - Address any compilation errors or runtime issues.
    - Begin reviewing Firebase Security Rules (Firestore, Storage) to ensure data is protected.
    - Identify any hardcoded sensitive information (though `envied` is used, double-check).

---

## Week 2: Feature Re-enablement & Crashlytics Integration

**Goal:** Re-enable `home_detail` and `my_shop` features, and integrate crashlytics.

### Tasks:
- **Day 8-10: Home Detail Feature Refactoring & Re-enablement**
    - Convert `home_detail` related models/classes to `freezed` (e.g., `EntityDetail`, `Review`).
    - Uncomment and adapt `home_detail` code to use `freezed` classes.
    - Re-enable `home_detail` routes in `app_router.dart`.
    - Thoroughly test `home_detail` functionality (viewing details, reviews, contact options).
- **Day 11-12: My Shop Feature Refactoring & Re-enablement**
    - Convert `my_shop` related models/classes to `freezed` (e.g., `ShopForm`).
    - Uncomment and adapt `my_shop` code to use `freezed` classes.
    - Re-enable `my_shop` routes in `app_router.dart`.
    - Test `my_shop` dashboard and form functionality.
- **Day 13-14: Crashlytics Integration**
    - Integrate Firebase Crashlytics (follow official Firebase Flutter setup guide).
    - Implement basic crash reporting (e.g., force a test crash).
    - Verify crash reports appear in Firebase Console.
    - Set up non-fatal error logging.

---

## Week 3: Remaining Features, iOS Testing & Performance

**Goal:** Re-enable `review` and `auth` features, conduct dedicated iOS testing, and begin performance tuning.

### Tasks:
- **Day 15-17: Review Feature Refactoring & Re-enablement**
    - Convert `review` related models/classes to `freezed`.
    - Uncomment and adapt `review` code.
    - Re-enable `review` routes in `app_router.dart`.
    - Test review submission, display, and filtering.
- **Day 18-19: Authentication Feature Re-enablement & Profile**
    - Uncomment and adapt `auth` and `profile` related code.
    - Re-enable `auth` and `profile` routes in `app_router.dart`.
    - Test user login, registration, and profile management.
- **Day 20-21: iOS Specific Testing & Bug Fixing**
    - Set up iOS development environment (Xcode, CocoaPods).
    - Run the app on various iOS simulators and physical devices.
    - Address any iOS-specific UI/UX issues or bugs.
    - Ensure all Firebase services work correctly on iOS.
    - Review `Info.plist` and `Podfile` for necessary permissions/configurations.

---

## Week 4: Polish, Optimization & Launch Preparation

**Goal:** Finalize app quality, prepare for store submission, and launch.

### Tasks:
- **Day 22-23: Performance Optimization & Code Cleanup**
    - Profile app performance (Flutter DevTools) to identify bottlenecks.
    - Optimize image loading (e.g., `cached_network_image` usage, image sizes).
    - Review and remove any unused code, assets, or dependencies.
    - Ensure all `TODO`s and `FIXME`s are addressed or documented.
- **Day 24-25: Final Security Audit & Privacy Compliance**
    - Double-check Firebase Security Rules.
    - Ensure API keys are securely handled (e.g., `envied` for build-time, not runtime).
    - Draft/finalize Privacy Policy and Terms of Service documents.
    - Ensure app complies with platform guidelines (App Store Review Guidelines, Google Play Policies).
- **Day 26-27: Pre-Launch Testing & Asset Preparation**
    - Comprehensive end-to-end testing on both Android and iOS.
    - Test on different network conditions (Wi-Fi, mobile data).
    - Prepare high-resolution app icons, splash screens, and promotional screenshots.
    - Write compelling app descriptions and keywords for store listings.
- **Day 28-30: Build & Release**
    - Generate release builds for Android (APK/AAB) and iOS (IPA).
    - Upload builds to Google Play Console and App Store Connect.
    - Submit for review.
    - Monitor crash reports and user feedback post-launch.

---

## Important Considerations:
- **Communication:** Regularly communicate progress and blockers.
- **Scope Creep:** Strictly adhere to the defined scope. New features should be deferred to post-launch.
- **Testing:** Do not skip testing steps. Automated tests are your safety net.
- **Breaks:** Ensure adequate rest to maintain productivity.

This plan provides a roadmap. Be prepared to adapt based on challenges encountered. Good luck!
