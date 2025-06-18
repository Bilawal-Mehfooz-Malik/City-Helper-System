import 'package:app/src/core/app_bootstrap/app_bootstrap.dart';
import 'package:app/src/core/exceptions/async_error_logger.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/data/fake_categories_repository.dart';
import 'package:app/src/features/home/data/fake/fake_ads_carousel_repository.dart';
import 'package:app/src/features/home/data/fake/fake_food_repository.dart';
import 'package:app/src/features/home/data/fake/fake_residence_repository.dart';
import 'package:app/src/features/home/data/fake/fake_sub_categories_repository.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/data/real/food_repository.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/fake_auth_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_food_details_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_residence_details_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_reviews_repository.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/data/reviews_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_geolocator_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/presentation/controllers/google_map_controller.dart';
import 'package:app/src/features/startup/presentation/startup_content/google_map_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AppBootstrapFakes on AppBootStrap {
  ProviderContainer createFakeProviderContainer() {
    final userLocationRepository = FakeUserLocationRepository();
    final geoLocatorRepository = FakeGeoLocatorRepository();
    final categoryRepository = FakeCategoriesRepository(addDelay: false);
    final subCategoryRepository = FakeSubCategoriesRepository(addDelay: false);
    final adsCarouselRepository = FakeAdsCarouselRepository(addDelay: false);
    final residenceRepository = FakeResidenceRepository(addDelay: false);
    final foodRepository = FakeFoodRepository(addDelay: false);
    final foodDetailsRepository = FakeFoodDetailsRepository(addDelay: false);
    final residenceDetailsRepository = FakeResidenceDetailsRepository(
      addDelay: false,
    );
    final reviewsRepository = FakeReviewsRepository(addDelay: false);
    final authRepository = FakeAuthRepository(addDelay: false);

    return ProviderContainer(
      overrides: [
        // * [StartupFeatureRepository] is overridden with [FakeStartupFeatureRepository]
        userLocationRepositoryProvider.overrideWithValue(
          userLocationRepository,
        ),
        geoLocatorRepositoryProvider.overrideWithValue(geoLocatorRepository),
        googleMapControllerProvider.overrideWithValue(
          (latLng) => FakeGoogleMapWidget(latLng: latLng),
        ),
        categoriesRepositoryProvider.overrideWithValue(categoryRepository),
        subCategoriesRepositoryProvider.overrideWithValue(
          subCategoryRepository,
        ),
        adsCarouselRepositoryProvider.overrideWithValue(adsCarouselRepository),
        residenceRepositoryProvider.overrideWithValue(residenceRepository),
        foodRepositoryProvider.overrideWithValue(foodRepository),
        foodDetailsRepositoryProvider.overrideWithValue(foodDetailsRepository),
        residenceDetailsRepositoryProvider.overrideWithValue(
          residenceDetailsRepository,
        ),
        reviewsRepositoryProvider.overrideWithValue(reviewsRepository),
        authRepositoryProvider.overrideWithValue(authRepository),
      ],
      observers: [
        // * This observer logs all AsyncError states that are set by the controllers
        AsyncErrorLogger(),
      ],
    );
  }
}
