import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_user_repository.dart';
import 'package:app/src/features/startup/domain/app_user.dart';
import 'package:app/src/features/startup/presentation/user_location_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements FakeUserRepository {}

class MockUserLocationRepository extends Mock
    implements FakeUserLocationRepository {}

class MockUserLocationController extends Mock
    implements UserLocationController {}

class MockAppRouter extends Mock implements GoRouter {}

class FakeAppUser extends Fake implements AppUser {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
