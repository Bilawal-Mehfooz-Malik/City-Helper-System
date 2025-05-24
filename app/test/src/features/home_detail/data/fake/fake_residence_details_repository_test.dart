import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home_detail/data/fake/test_residence_details.dart';
import 'package:app/src/features/home_detail/data/fake/fake_residence_details_repository.dart';

void main() {
  late FakeResidenceDetailsRepository repository;

  setUp(() {
    repository = FakeResidenceDetailsRepository(addDelay: false);
  });

  group('Residence Detail Repository', () {
    test(
      'fetchResidenceDetails returns correct residence by id and categoryId',
      () async {
        final residence = testResidenceDetails.first;
        final result = await repository.fetchResidenceDetails(
          residence.categoryId,
          residence.id,
        );
        expect(result, residence);
      },
    );

    test('fetchResidenceDetails returns null if residence not found', () async {
      final result = await repository.fetchResidenceDetails(999, 'invalid-id');
      expect(result, isNull);
    });

    test(
      'watchResidenceDetails emits correct residence by id and categoryId',
      () {
        final residence = testResidenceDetails.first;
        expect(
          repository.watchResidenceDetails(residence.categoryId, residence.id),
          emits(residence),
        );
      },
    );

    test('watchResidenceDetails emits null if residence not found', () {
      expect(repository.watchResidenceDetails(999, 'invalid-id'), emits(null));
    });
  });
}
