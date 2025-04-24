import 'package:app/src/features/home/domain/filters/entity_filter.dart';
import 'package:app/src/core/models/my_data_types.dart';

class FoodFilter extends EntityFilter {
  final GenderPreference genderPref;
  const FoodFilter({
    super.isOpen,
    super.ratingSort,
    this.genderPref = GenderPreference.any,
  });

  @override
  EntityFilter copyWith({
    bool? isOpen,
    SortOrder? ratingSort,
    GenderPreference? genderPref,
  }) {
    return FoodFilter(
      isOpen: isOpen ?? this.isOpen,
      ratingSort: ratingSort ?? this.ratingSort,
      genderPref: genderPref ?? this.genderPref,
    );
  }
}
