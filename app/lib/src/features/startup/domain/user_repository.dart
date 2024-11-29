import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'app_user.dart';

part 'user_repository.g.dart';

abstract class UserRepository {
  Future<AppUser?> fetchUser();

  Stream<AppUser?> watchUser();

  Future<void> setUser(AppUser user);
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  throw UnimplementedError();
}
