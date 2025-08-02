import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home/data/real/residence_repository.dart';
import 'package:app/src/features/home/data/fake/fake_residence_repository.dart';
import 'package:app/src/core/constants/test_residences.dart';

void main() {
  late ResidenceRepository repository;

  setUp(() {
    repository = FakeResidenceRepository(addDelay: false);
  });

  group('General Residence List', () {
    test('fetchResidencesList returns residences by categoryId', () async {
      final expected = testResidences.toList();

      final result = await repository.fetchResidencesList();
      expect(result, expected);
    });

    test('watchResidencesList emits residences by categoryId', () {
      final expected = testResidences.toList();

      expect(repository.watchResidencesList(), emits(expected));
    });
  });

  group('Popular Residence List', () {
    test(
      'fetchPopularResidencesList returns popular residences by categoryId',
      () async {
        final expected = testResidences
            .where((r) => r.isPopular)
            .toList();

        final result = await repository.fetchPopularResidencesList();
        expect(result, expected);
      },
    );

    test(
      'watchPopularResidencesList emits popular residences by categoryId',
      () {
        final expected = testResidences
            .where((r) => r.isPopular)
            .toList();

        expect(repository.watchPopularResidencesList(), emits(expected));
      },
    );
  });

  group('Subcategory Residence List', () {
    test(
      'fetchResidencesListBySubCategoryId returns matching residences',
      () async {
        final residence = testResidences.first;
        final expected = testResidences
            .where(
              (r) =>
                  r.subCategoryId == residence.subCategoryId,
            )
            .toList();

        final result = await repository.fetchResidencesListBySubCategoryId(
          residence.subCategoryId,
        );
        expect(result, expected);
      },
    );

    test('watchResidencesListBySubCategoryId emits matching residences', () {
      final residence = testResidences.first;
      final expected = testResidences
          .where(
            (r) =>
                r.subCategoryId == residence.subCategoryId,
          )
          .toList();

      expect(
        repository.watchResidencesListBySubCategoryId(residence.subCategoryId),
        emits(expected),
      );
    });
  });

  group('Popular Subcategory Residence List', () {
    test(
      'fetchPopularResidencesListBySubCategoryId returns matching popular residences',
      () async {
        final residence = testResidences.first;
        final expected = testResidences
            .where(
              (r) =>
                  r.subCategoryId == residence.subCategoryId &&
                  r.isPopular,
            )
            .toList();

        final result = await repository
            .fetchPopularResidencesListBySubCategoryId(residence.subCategoryId);
        expect(result, expected);
      },
    );

    test(
      'watchPopularResidencesListBySubCategoryId emits matching popular residences',
      () {
        final residence = testResidences.first;
        final expected = testResidences
            .where(
              (r) =>
                  r.subCategoryId == residence.subCategoryId &&
                  r.isPopular,
            )
            .toList();

        expect(
          repository.watchPopularResidencesListBySubCategoryId(
            residence.subCategoryId,
          ),
          emits(expected),
        );
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
}
