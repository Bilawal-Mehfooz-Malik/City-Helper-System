import 'dart:async';

import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdInteractionNotifier extends AsyncNotifier<void> {
  // --- State ---
  Timer? _impressionTimer;
  final List<CarouselAdId> _impressionBuffer = [];
  static const _bufferTime = Duration(seconds: 25);

  @override
  FutureOr<void> build() {
    // Cancel the timer when the notifier is disposed
    ref.onDispose(() {
      _impressionTimer?.cancel();
      _flushImpressions(); // Flush any remaining impressions
    });
  }

  // --- Public Methods ---

  /// Buffers a single ad impression.
  ///
  /// The impression is added to a queue and sent in a batch after a short delay
  /// to reduce the number of individual function calls.
  void recordAdImpression(CarouselAdId adId) {
    // Avoid duplicate impressions in the same batch
    if (_impressionBuffer.contains(adId)) return;
    _impressionBuffer.add(adId);
    // Start the timer if it's not already running
    _impressionTimer ??= Timer(_bufferTime, _flushImpressions);
  }

  Future<void> recordAdClick(CarouselAdId adId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(adsCarouselRepositoryProvider).recordAdClick(adId),
    );
  }

  // --- Private Methods ---

  /// Sends all buffered ad impressions to the backend in a single batch call.
  Future<void> _flushImpressions() async {
    if (_impressionBuffer.isEmpty) {
      _impressionTimer = null; // Ensure timer is reset if buffer is empty
      return;
    }
    // Create a copy of the buffer to avoid race conditions
    final adIdsToFlush = List<CarouselAdId>.from(_impressionBuffer);
    _impressionBuffer.clear();

    // Use the repository to call the batch function
    await ref
        .read(adsCarouselRepositoryProvider)
        .recordAdImpressions(adIdsToFlush);

    // Reset the timer after flushing
    _impressionTimer = null;
  }
}

final adInteractionNotifierProvider =
    AsyncNotifierProvider.autoDispose<AdInteractionNotifier, void>(
      AdInteractionNotifier.new,
    );
