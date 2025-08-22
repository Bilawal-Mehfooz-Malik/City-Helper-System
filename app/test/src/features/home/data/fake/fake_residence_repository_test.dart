import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/data/fake/fake_residence_repository.dart';
import 'package:app/src/core/constants/test_residences.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';

void main() {
  late ResidenceRepository repository;

  setUp(() {
    repository = FakeResidenceRepository(addDelay: false);
  });

  group('General Residence List', () {
    test('fetchResidencesList returns residences by categoryId', () async {
      final expected = testResidences.where((r) => !r.isPopular).toList();

      final result = await repository.fetchResidencesList(
        limit: expected.length,
        filter: const ResidenceFilter(),
      );
      expect(result, expected);
    });

    test('fetchResidencesList filters by isOpen', () async {
      final expected = testResidences
          .where((r) => r.isOpen && !r.isPopular)
          .toList();

      final result = await repository.fetchResidencesList(
        limit: expected.length,
        filter: const ResidenceFilter(isOpen: true),
      );
      expect(result, expected);
    });

    // watchResidencesList is not directly exposed by ResidenceRepository, so no test needed
  });

  group('Popular Residence List', () {
    test(
      'fetchPopularResidencesList returns popular residences by categoryId',
      () async {
        final expected = testResidences.where((r) => r.isPopular).toList();

        final result = await repository.fetchPopularResidencesList(
          limit: expected.length,
          filter: const ResidenceFilter(),
        );
        expect(result, expected);
      },
    );

    test('fetchPopularResidencesList filters by isOpen', () async {
      final expected = testResidences
          .where((r) => r.isPopular && r.isOpen)
          .toList();

      final result = await repository.fetchPopularResidencesList(
        limit: expected.length,
        filter: const ResidenceFilter(isOpen: true),
      );
      expect(result, expected);
    });
  });

  group('Subcategory Residence List', () {
    test(
      'fetchResidencesListBySubCategoryId returns matching residences',
      () async {
        final residence = testResidences.first;
        final expected = testResidences
            .where(
              (r) => r.subCategoryId == residence.subCategoryId && !r.isPopular,
            )
            .toList();

        final result = await repository.fetchResidencesListBySubCategoryId(
          residence.subCategoryId,
          limit: expected.length,
          filter: const ResidenceFilter(),
        );
        expect(result, expected);
      },
    );

    test('fetchResidencesListBySubCategoryId filters by isOpen', () async {
      final residence = testResidences.first;
      final expected = testResidences
          .where(
            (r) =>
                r.subCategoryId == residence.subCategoryId &&
                r.isOpen &&
                !r.isPopular,
          )
          .toList();

      final result = await repository.fetchResidencesListBySubCategoryId(
        residence.subCategoryId,
        limit: expected.length,
        filter: const ResidenceFilter(isOpen: true),
      );
      expect(result, expected);
    });
  });

  group('Popular Subcategory Residence List', () {
    test(
      'fetchPopularResidencesListBySubCategoryId returns matching popular residences',
      () async {
        final residence = testResidences.first;
        final expected = testResidences
            .where(
              (r) => r.subCategoryId == residence.subCategoryId && r.isPopular,
            )
            .toList();

        final result = await repository
            .fetchPopularResidencesListBySubCategoryId(
              residence.subCategoryId,
              limit: expected.length,
              filter: const ResidenceFilter(),
            );
        expect(result, expected);
      },
    );

    test(
      'fetchPopularResidencesListBySubCategoryId filters by isOpen',
      () async {
        final residence = testResidences.first;
        final expected = testResidences
            .where(
              (r) =>
                  r.subCategoryId == residence.subCategoryId &&
                  r.isPopular &&
                  r.isOpen,
            )
            .toList();

        final result = await repository
            .fetchPopularResidencesListBySubCategoryId(
              residence.subCategoryId,
              limit: expected.length,
              filter: const ResidenceFilter(isOpen: true),
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
