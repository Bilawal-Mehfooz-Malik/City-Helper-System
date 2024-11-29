import 'package:app/src/features/startup/data/fake/fake_user_location_repository.dart';
import 'package:app/src/features/startup/data/fake/fake_user_repository.dart';
import 'package:app/src/features/startup/presentation/user_controller.dart';
import 'package:app/src/features/startup/presentation/user_location_controller.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements FakeUserRepository {}

class MockUserLocationRepository extends Mock
    implements FakeUserLocationRepository {}

class MockUserController extends Mock implements UserController {}

class MockUserLocationController extends Mock
    implements UserLocationController {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
