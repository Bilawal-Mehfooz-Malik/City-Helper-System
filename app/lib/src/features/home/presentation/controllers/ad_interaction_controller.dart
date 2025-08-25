import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ad_interaction_controller.g.dart';

@riverpod
class AdInteractionNotifier extends _$AdInteractionNotifier {
  @override
  FutureOr<void> build() {
    // No-op
  }

  Future<void> recordAdClick(CarouselAdId adId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(adsCarouselRepositoryProvider).recordAdClick(adId),
    );
  }
}
