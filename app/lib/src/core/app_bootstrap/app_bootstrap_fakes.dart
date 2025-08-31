import 'package:app/src/core/app_bootstrap/app_bootstrap.dart';
import 'package:app/src/core/exceptions/async_error_logger.dart';
import 'package:app/src/core/utils/in_memory_storage.dart';
import 'package:app/src/features/auth/application/auth_service.dart';
import 'package:app/src/features/auth/application/fake_auth_service.dart';
import 'package:app/src/features/auth/data/fake/fake_image_upload_repository.dart';
import 'package:app/src/features/auth/data/fake/fake_user_repository.dart';
import 'package:app/src/features/auth/data/image_upload_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
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
import 'package:app/src/features/auth/data/fake/fake_auth_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_food_details_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_residence_details_repository.dart';
import 'package:app/src/features/review/data/fake_reviews_repository.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_geolocator_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/real/geolocator_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:app/src/features/startup/presentation/controllers/google_map_builder.dart';
import 'package:app/src/features/startup/presentation/widgets/fake_map_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension AppBootstrapFakes on AppBootStrap {
  ProviderContainer createFakeProviderContainer({
    List<Override> overrides = const [],
  }) {
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
    final inMemoryStorage = InMemoryImageStorage();
    final reviewsRepository = FakeReviewsRepository(addDelay: false);
    final authRepository = FakeAuthRepository(addDelay: false);

    final imageUploadRepository = FakeImageUploadRepository(inMemoryStorage);
    final userRepository = FakeUserRepository(addDelay: false);
    final authService = FakeAuthService(
      authRepository: authRepository,
      userRepository: userRepository,
      imageUploadRepository: imageUploadRepository,
      defaultLocation: LatLng(33.150691628036256, 73.74845167724608),
    );

    return ProviderContainer(
      overrides: [
        // * [StartupFeatureRepository] is overridden with [FakeStartupFeatureRepository]
        userLocationRepositoryProvider.overrideWith(
          (ref) => userLocationRepository,
        ),
        geoLocatorRepositoryProvider.overrideWithValue(geoLocatorRepository),
        googleMapBuilderProvider.overrideWithValue(
          (latLng) => FakeMapWidget(latLng: latLng),
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
        imageUploadRepositoryProvider.overrideWithValue(imageUploadRepository),
        userRepositoryProvider.overrideWithValue(userRepository),
        inMemoryImageStorageProvider.overrideWithValue(inMemoryStorage),
        authServiceProvider.overrideWithValue(authService),
        ...overrides, // Place test-specific overrides last to ensure precedence
      ],
      observers: [
        // * This observer logs all AsyncError states that are set by the controllers
        AsyncErrorLogger(),
      ],
    );
  }
}
