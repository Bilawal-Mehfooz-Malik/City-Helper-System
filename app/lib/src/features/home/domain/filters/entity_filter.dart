import 'package:app/src/core/models/my_data_types.dart';

class EntityFilter {
  final bool isOpen;
  final SortOrder ratingSort;
  final GenderPreference genderPref;

  const EntityFilter({
    this.isOpen = false,
    this.ratingSort = SortOrder.none,
    this.genderPref = GenderPreference.any,
  });

  EntityFilter copyWith({
    bool? isOpen,
    bool? isFurnished,
    SortOrder? priceSort,
    SortOrder? ratingSort,
    GenderPreference? genderPref,
  }) {
    return EntityFilter(
      isOpen: isOpen ?? this.isOpen,
      ratingSort: ratingSort ?? this.ratingSort,
      genderPref: genderPref ?? this.genderPref,
    );
  }
}
