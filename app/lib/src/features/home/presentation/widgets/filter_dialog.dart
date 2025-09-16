import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:app/src/features/home/presentation/controllers/filter_context.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterDialog extends ConsumerStatefulWidget {
  const FilterDialog({
    super.key,
    required this.categoryId,
    required this.filterContext,
  });
  final CategoryId categoryId;
  final FilterContext filterContext;

  @override
  ConsumerState<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<FilterDialog> {
  late EntityFilter _localFilter;

  @override
  void initState() {
    super.initState();
    _localFilter = ref.read(
      filterControllerProvider(
        categoryId: widget.categoryId,
        filterContext: widget.filterContext,
      ),
    );
  }

  void setDraftFilter(EntityFilter newFilter) {
    setState(() => _localFilter = newFilter);
  }

  void resetDraftFilter() {
    setState(() {
      _localFilter = switch (widget.categoryId) {
        1 => const EntityFilter.residence(),
        2 => const EntityFilter.food(),
        _ => const EntityFilter.basic(),
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(
      filterControllerProvider(
        categoryId: widget.categoryId,
        filterContext: widget.filterContext,
      ).notifier,
    );

    return AlertDialog(
      title: Text(context.loc.filtersTitle),
      content: SingleChildScrollView(
        child: FilterDialogContent(
          localFilter: _localFilter,
          onFilterChanged: setDraftFilter,
        ),
      ),
      actions: [
        CustomTextButton(
          onPressed: resetDraftFilter,
          text: context.loc.resetButton,
        ),
        PrimaryButton(
          onPressed: () {
            controller.applyFilter(_localFilter);
            Navigator.of(context).pop();
          },
          text: context.loc.applyFiltersButton,
        ),
      ],
    );
  }
}

class FilterDialogContent extends StatelessWidget {
  const FilterDialogContent({
    super.key,
    required this.localFilter,
    required this.onFilterChanged,
  });

  final EntityFilter localFilter;
  final void Function(EntityFilter) onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return localFilter.when(
      residence: (sortBy, sortOrder, isFurnished, isRoomAvailable, genderPref) =>
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SortDropdown(
            currentSortBy: sortBy,
            currentSortOrder: sortOrder,
            onChanged: (newSortBy, newSortOrder) {
              onFilterChanged((localFilter as ResidenceFilter)
                  .copyWith(sortBy: newSortBy, sortOrder: newSortOrder));
            },
            supportedSorts: const [SortBy.updatedAt, SortBy.price, SortBy.rating],
          ),
          gapH16,
          FilterSwitch(
            value: isFurnished,
            label: context.loc.showFurnishedOnly,
            onChanged: (value) => onFilterChanged(
                (localFilter as ResidenceFilter).copyWith(isFurnished: value)),
          ),
          FilterSwitch(
            value: isRoomAvailable,
            label: context.loc.showAvailableOnly,
            onChanged: (value) => onFilterChanged((localFilter as ResidenceFilter)
                .copyWith(isRoomAvailable: value)),
          ),
          gapH12,
          GenderPreferenceChips(
            selected: genderPref,
            onSelected: (gender) => onFilterChanged(
                (localFilter as ResidenceFilter).copyWith(genderPref: gender)),
          ),
          gapH8,
        ],
      ),
      food: (sortBy, sortOrder, genderPref) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SortDropdown(
            currentSortBy: sortBy,
            currentSortOrder: sortOrder,
            onChanged: (newSortBy, newSortOrder) {
              onFilterChanged((localFilter as FoodFilter)
                  .copyWith(sortBy: newSortBy, sortOrder: newSortOrder));
            },
            supportedSorts: const [SortBy.updatedAt, SortBy.rating],
          ),
          gapH12,
          GenderPreferenceChips(
            selected: genderPref,
            onSelected: (gender) => onFilterChanged(
                (localFilter as FoodFilter).copyWith(genderPref: gender)),
          ),
          gapH8,
        ],
      ),
      basic: (sortBy, sortOrder) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SortDropdown(
            currentSortBy: sortBy,
            currentSortOrder: sortOrder,
            onChanged: (newSortBy, newSortOrder) {
              onFilterChanged((localFilter as BasicFilter)
                  .copyWith(sortBy: newSortBy, sortOrder: newSortOrder));
            },
            supportedSorts: const [SortBy.rating],
          ),
          gapH8,
        ],
      ),
    );
  }
}

class SortDropdown extends StatelessWidget {
  const SortDropdown({
    super.key,
    required this.currentSortBy,
    required this.currentSortOrder,
    required this.onChanged,
    required this.supportedSorts,
  });

  final SortBy currentSortBy;
  final SortOrder currentSortOrder;
  final void Function(SortBy, SortOrder) onChanged;
  final List<SortBy> supportedSorts;

  String _valueToString(SortBy sortBy, SortOrder sortOrder) {
    return '${sortBy.name}_${sortOrder.name}';
  }

  @override
  Widget build(BuildContext context) {
    final items = supportedSorts.expand((sortBy) {
      if (sortBy == SortBy.updatedAt) {
        return [DropdownMenuItem(
          value: _valueToString(sortBy, SortOrder.highToLow),
          child: Text(context.loc.sortByLatest),
        )];
      }
      return [
        DropdownMenuItem(
          value: _valueToString(sortBy, SortOrder.highToLow),
          child: Text(_localizedSortByText(context, sortBy, SortOrder.highToLow)),
        ),
        DropdownMenuItem(
          value: _valueToString(sortBy, SortOrder.lowToHigh),
          child: Text(_localizedSortByText(context, sortBy, SortOrder.lowToHigh)),
        ),
      ];
    }).toList();

    return DropdownButtonFormField<String>(
      value: _valueToString(currentSortBy, currentSortOrder),
      items: items,
      onChanged: (value) {
        if (value == null) return;
        final parts = value.split('_');
        final newSortBy = SortBy.values.firstWhere((e) => e.name == parts[0]);
        final newSortOrder = SortOrder.values.firstWhere((e) => e.name == parts[1]);
        onChanged(newSortBy, newSortOrder);
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: context.loc.sortByLabel,
      ),
    );
  }

  String _localizedSortByText(BuildContext context, SortBy sort, SortOrder order) {
    final type = sort == SortBy.price ? context.loc.sortByPrice : context.loc.sortByRating;
    final direction = order == SortOrder.highToLow
        ? context.loc.sortOrderHighToLow
        : context.loc.sortOrderLowToHigh;
    return '$type: $direction';
  }
}

class FilterSwitch extends StatelessWidget {
  const FilterSwitch({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
  });

  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: value,
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      onChanged: onChanged,
    );
  }
}

class GenderPreferenceChips extends StatelessWidget {
  const GenderPreferenceChips({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final GenderPreference? selected;
  final ValueChanged<GenderPreference?> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.genderPreferenceLabel,
          style: context.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        gapH8,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: GenderPreference.values.map((gender) {
            return ChoiceChip(
              label: Text(_localizedGenderText(context, gender)),
              selected: selected == gender,
              onSelected: (_) {
                if (selected == gender) {
                  onSelected(null);
                } else {
                  onSelected(gender);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  String _localizedGenderText(BuildContext context, GenderPreference gender) {
    return switch (gender) {
      GenderPreference.maleOnly => context.loc.genderPreferenceMaleOnly,
      GenderPreference.femaleOnly => context.loc.genderPreferenceFemaleOnly,
      GenderPreference.familyFriendly =>
        context.loc.genderPreferenceFamilyFriendly,
    };
  }
}