import 'package:app/app_bootstrap.dart';
import 'package:app/src/core/exceptions/async_error_logger.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/data/fake_categories_repository.dart';
import 'package:app/src/features/startup/data/real/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AppBootstrapFakes on AppBootStrap {
  Future<ProviderContainer> createLocalProviderContainer() async {
    final categoryRepository = FakeCategoriesRepository();
    final userLocationRepository = await UserLocationRepository.makeDefault();

    return ProviderContainer(
      overrides: [
        userLocationRepositoryProvider.overrideWithValue(
          userLocationRepository,
        ),
        categoriesRepositoryProvider.overrideWithValue(categoryRepository),
      ],
      observers: [
        // * This observer logs all AsyncError states that are set by the controllers
        AsyncErrorLogger(),
      ],
    );
  }
}
