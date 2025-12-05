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
import 'package:app/src/features/my_shop/data/user_mode_repository.dart';
import 'package:app/src/features/review/data/fake_reviews_repository.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';

import 'package:app/src/features/review/data/reviews_repository.dart';
import 'package:app/src/features/pick_location/data/real/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension AppBootstrapFakes on AppBootStrap {
  Future<ProviderContainer> createLocalProviderContainer() async {
    final categoryRepository = FakeCategoriesRepository();
    final subCategoryRepository = FakeSubCategoriesRepository();
    final adsCarouselRepository = FakeAdsCarouselRepository();
    final residenceRepository = FakeResidenceRepository();
    final foodRepository = FakeFoodRepository();
    final foodDetailsRepository = FakeFoodDetailsRepository();
    final residenceDetailsRepository = FakeResidenceDetailsRepository();
    final reviewsRepository = FakeReviewsRepository();
    final authRepository = FakeAuthRepository();

    final prefs = await SharedPreferences.getInstance();
    final inMemoryStorage = InMemoryImageStorage();
    final userLocationRepository = UserLocationRepository(prefs);
    final userModeReposiory = UserModeRepository(prefs);
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
        userLocationRepositoryProvider.overrideWithValue(
          userLocationRepository,
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
        authServiceProvider.overrideWithValue(authService),
        userModeRepositoryProvider.overrideWithValue(userModeReposiory),
        inMemoryImageStorageProvider.overrideWithValue(inMemoryStorage),
      ],
      observers: [
        // * This observer logs all AsyncError states that are set by the controllers
        AsyncErrorLogger(),
      ],
    );
  }
}
