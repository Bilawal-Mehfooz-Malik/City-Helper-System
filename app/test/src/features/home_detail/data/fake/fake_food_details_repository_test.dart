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
        final result = await repository.fetchFoodDetails(food.id);
        expect(result, food);
      },
    );

    test('fetchFoodDetails returns null if food not found', () async {
      final result = await repository.fetchFoodDetails('invalid-id');
      expect(result, isNull);
    });
  });
}
