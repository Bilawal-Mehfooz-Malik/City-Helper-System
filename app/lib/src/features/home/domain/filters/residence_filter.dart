import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/filters/entity_filter.dart';

class ResidenceFilter extends EntityFilter {
  final bool isFurnished;
  final SortOrder priceSort;

  const ResidenceFilter({
    super.isOpen = false,
    super.ratingSort = SortOrder.none,
    super.genderPref = GenderPreference.any,
    this.isFurnished = false,
    this.priceSort = SortOrder.none,
  });

  @override
  ResidenceFilter copyWith({
    bool? isOpen,
    bool? isFurnished,
    SortOrder? priceSort,
    SortOrder? ratingSort,
    GenderPreference? genderPref,
  }) {
    return ResidenceFilter(
      isOpen: isOpen ?? this.isOpen,
      isFurnished: isFurnished ?? this.isFurnished,
      priceSort: priceSort ?? this.priceSort,
      ratingSort: ratingSort ?? this.ratingSort,
      genderPref: genderPref ?? this.genderPref,
    );
  }
}
