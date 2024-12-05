import 'package:app/src/features/startup/domain/user_location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initial_location_provider.g.dart';

@riverpod
Future<bool> userLocationExists(Ref ref) async {
  final userLocation = ref.read(userLocationRepositoryProvider);
  final userLoc = await userLocation.fetchUserLocation();
  return userLoc == null ? false : true;
}
