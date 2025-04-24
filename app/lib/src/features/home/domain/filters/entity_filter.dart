import 'package:app/src/core/models/my_data_types.dart';

class EntityFilter {
  final bool isOpen;
  final SortOrder ratingSort;

  const EntityFilter({this.isOpen = false, this.ratingSort = SortOrder.none});

  EntityFilter copyWith({bool? isOpen, SortOrder? ratingSort}) {
    return EntityFilter(
      isOpen: isOpen ?? this.isOpen,
      ratingSort: ratingSort ?? this.ratingSort,
    );
  }
}
