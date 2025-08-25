import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/data/fake/fake_residence_repository.dart';
import 'package:app/src/core/constants/test_residences.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';

void main() {
  late ResidenceRepository repository;

  setUp(() {
    repository = FakeResidenceRepository(
      addDelay: false,
      initialResidences: testResidences,
    );
  });

  group('General Residence List', () {
    test('fetchResidencesList returns residences by categoryId', () async {
      final expected = testResidences.where((r) => !r.isPopular).toList()
        ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

      final result = await repository.fetchResidencesList(
        limit: expected.length,
        filter: const ResidenceFilter(),
      );
      expect(result, expected);
    });

    // watchResidencesList is not directly exposed by ResidenceRepository, so no test needed
  });

  group('Popular Residence List', () {
    test(
      'fetchPopularResidencesList returns popular residences by categoryId',
      () async {
        final expected = testResidences.where((r) => r.isPopular).toList()
          ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

        final result = await repository.fetchPopularResidencesList(
          limit: expected.length,
          filter: const ResidenceFilter(),
        );
        expect(result, expected);
      },
    );
  });

  group('Subcategory Residence List', () {
    test(
      'fetchResidencesListBySubCategoryId returns matching residences',
      () async {
        final residence = testResidences.first;
        final expected =
            testResidences
                .where(
                  (r) =>
                      r.subCategoryId == residence.subCategoryId &&
                      !r.isPopular,
                )
                .toList()
              ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

        final result = await repository.fetchResidencesListBySubCategoryId(
          residence.subCategoryId,
          limit: expected.length,
          filter: const ResidenceFilter(),
        );
        expect(result, expected);
      },
    );
  });

  group('Popular Subcategory Residence List', () {
    test(
      'fetchPopularResidencesListBySubCategoryId returns matching popular residences',
      () async {
        final residence = testResidences.first;
        final expected =
            testResidences
                .where(
                  (r) =>
                      r.subCategoryId == residence.subCategoryId && r.isPopular,
                )
                .toList()
              ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

        final result = await repository
            .fetchPopularResidencesListBySubCategoryId(
              residence.subCategoryId,
              limit: expected.length,
              filter: const ResidenceFilter(),
            );
        expect(result, expected);
      },
    );
  });

  group('Single Residence', () {
    test('fetchResidence returns residence by id and categoryId', () async {
      final residence = testResidences.first;
      final result = await repository.fetchResidence(residence.id);
      expect(result, residence);
    });

    test('watchResidence emits residence by id and categoryId', () {
      final residence = testResidences.first;
      expect(repository.watchResidence(residence.id), emits(residence));
    });
  });

  group('Sorting', () {
    test(
      'fetchResidencesList sorts by updatedAt descending by default',
      () async {
        final residence1 = testResidences[0].copyWith(
          id: 'residence1',
          updatedAt: DateTime(2023, 1, 1),
          isPopular: false,
        );
        final residence2 = testResidences[1].copyWith(
          id: 'residence2',
          updatedAt: DateTime(2023, 1, 2),
          isPopular: false,
        );
        final residence3 = testResidences[2].copyWith(
          id: 'residence3',
          updatedAt: DateTime(2023, 1, 3),
          isPopular: false,
        );

        final testRepository = FakeResidenceRepository(
          addDelay: false,
          initialResidences: [residence1, residence2, residence3],
        );

        final result = await testRepository.fetchResidencesList(
          limit: 3,
          filter: const ResidenceFilter(),
        );

        expect(result[0].id, residence3.id);
        expect(result[1].id, residence2.id);
        expect(result[2].id, residence1.id);
      },
    );
  });

  group('setResidence', () {
    test('adds new residence if id does not exist', () async {
      final newResidence = testResidences.first.copyWith(
        id: 'new-residence-id',
      );
      await repository.setResidence(newResidence);
      final result = await repository.fetchResidence(newResidence.id);
      expect(result, newResidence);
    });

    test('updates existing residence if id exists', () async {
      final existingResidence = testResidences.first;
      final updatedResidence = existingResidence.copyWith(name: 'Updated Name');
      await repository.setResidence(updatedResidence);
      final result = await repository.fetchResidence(existingResidence.id);
      expect(result, updatedResidence);
    });
  });
}
