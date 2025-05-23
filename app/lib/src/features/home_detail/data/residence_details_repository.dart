import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'residence_details_repository.g.dart';

class ResidenceDetailsRepository {
  static String get foodsDetailsKey => 'food_details';

  Stream<ResidenceDetail?> watchResidenceDetails(
    CategoryId categoryId,
    EntityId id,
  ) {
    throw UnimplementedError();
  }

  Future<ResidenceDetail?> fetchResidenceDetails(
    CategoryId categoryId,
    EntityId id,
  ) {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
ResidenceDetailsRepository residenceDetailsRepository(Ref ref) {
  return ResidenceDetailsRepository();
}
