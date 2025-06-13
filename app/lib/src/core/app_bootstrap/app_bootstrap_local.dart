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
import 'package:app/src/features/home_detail/data/fake/fake_food_details_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_residence_details_repository.dart';
import 'package:app/src/features/home_detail/data/fake/fake_reviews_repository.dart';
import 'package:app/src/features/home_detail/data/food_details_repository.dart';
import 'package:app/src/features/home_detail/data/residence_details_repository.dart';
import 'package:app/src/features/home_detail/data/reviews_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

    final userLocationRepository = await UserLocationRepository.makeDefault();

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
      ],
      observers: [
        // * This observer logs all AsyncError states that are set by the controllers
        AsyncErrorLogger(),
      ],
    );
  }
}
