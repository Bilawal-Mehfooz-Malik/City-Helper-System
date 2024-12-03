import '../../../core/utils/delay.dart';
import '../../../core/utils/in_memory_store.dart';
import '../domain/app_user.dart';
import '../domain/user_repository.dart';

class FakeUserRepository implements UserRepository {
  final bool addDelay;
  FakeUserRepository({this.addDelay = true});

  final _appUser = InMemoryStore<AppUser?>(null);

  @override
  Future<AppUser?> fetchUser() async {
    await delay(addDelay);
    return _appUser.value;
  }

  @override
  Future<void> setUser(AppUser user) async {
    await delay(addDelay);
    _appUser.value = user;
  }

  @override
  Stream<AppUser?> watchUser() => _appUser.stream;

  void dispose() => _appUser.close();
}
