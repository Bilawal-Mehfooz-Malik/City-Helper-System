import 'dart:async';

import 'package:app/src/core/utils/city_country_name_getter.dart';
import 'package:app/src/features/startup/data/user_location_repository.dart';
import 'package:app/src/features/startup/domain/coordinates.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserLocationController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() => null;

  Future<void> saveUserLocation(Coordinates coordinates) async {
    state = AsyncLoading();
    try {
      final location = await getCityAndCountry(coordinates);
      final repo = ref.read(userLocationRepositoryProvider);
      await repo.saveUserLocation(location);
      ref
          .read(appRouterProvider)
          .replaceNamed<void>(AppScaffoldRoutes.explore.name);
      state = AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}

final userLocationControllerProvider =
    AsyncNotifierProvider<UserLocationController, void>(
      UserLocationController.new,
    );
