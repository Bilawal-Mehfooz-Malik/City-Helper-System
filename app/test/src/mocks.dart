import 'package:app/src/features/startup/data/fake_location_repository.dart';
import 'package:mocktail/mocktail.dart';

class MockUserLocationRepository extends Mock
    implements FakeLocationRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
