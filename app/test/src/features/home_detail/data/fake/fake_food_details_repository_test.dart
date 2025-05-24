import 'package:app/src/features/home_detail/data/fake/test_food_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/src/features/home_detail/data/fake/fake_food_details_repository.dart';

void main() {
  late FakeFoodDetailsRepository repository;

  setUp(() {
    repository = FakeFoodDetailsRepository(addDelay: false);
  });

  group('Food Detail Repository', () {
    test(
      'fetchFoodDetails returns correct food by id and categoryId',
      () async {
        final food = testFoodDetails.first;
        final result = await repository.fetchFoodDetails(
          food.categoryId,
          food.id,
        );
        expect(result, food);
      },
    );

    test('fetchFoodDetails returns null if food not found', () async {
      final result = await repository.fetchFoodDetails(1, 'invalid-id');
      expect(result, isNull);
    });

    test('watchFoodDetails emits correct food by id and categoryId', () {
      final food = testFoodDetails.first;
      expect(
        repository.watchFoodDetails(food.categoryId, food.id),
        emits(food),
      );
    });

    test('watchFoodDetails emits null if food not found', () {
      expect(repository.watchFoodDetails(1, 'invalid-id'), emits(null));
    });
  });
}
