import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/filters/entity_filter.dart';

class ResidenceFilter extends EntityFilter {
  final bool isFurnished;
  final SortOrder priceSort;
  final GenderPreference genderPref;

  const ResidenceFilter({
    super.isOpen,
    super.ratingSort,
    this.isFurnished = false,
    this.priceSort = SortOrder.none,
    this.genderPref = GenderPreference.any,
  });

  @override
  ResidenceFilter copyWith({
    bool? isOpen,
    SortOrder? ratingSort,
    bool? isFurnished,
    SortOrder? priceSort,
    GenderPreference? genderPref,
  }) {
    return ResidenceFilter(
      isOpen: isOpen ?? this.isOpen,
      ratingSort: ratingSort ?? this.ratingSort,
      isFurnished: isFurnished ?? this.isFurnished,
      priceSort: priceSort ?? this.priceSort,
      genderPref: genderPref ?? this.genderPref,
    );
  }
}
