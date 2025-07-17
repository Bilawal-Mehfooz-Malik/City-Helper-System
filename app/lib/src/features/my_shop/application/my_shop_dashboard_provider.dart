import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/my_shop/application/shop_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_shop_dashboard_provider.g.dart';

@riverpod
FutureOr<EntityDetail?> myShopDashboard(Ref ref) async {
  final user = await ref.watch(authStateChangesProvider.future);
  if (user == null) return null;

  final shop = await ref.watch(watchUserShopProvider(user.uid).future);
  return shop;
}
