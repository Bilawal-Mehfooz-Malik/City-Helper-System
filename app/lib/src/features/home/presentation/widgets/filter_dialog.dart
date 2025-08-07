import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/filters/entity_filter.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterDialog extends ConsumerStatefulWidget {
  const FilterDialog({super.key, required this.categoryId});
  final CategoryId categoryId;

  @override
  ConsumerState<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<FilterDialog> {
  late EntityFilter _localFilter;

  @override
  void initState() {
    super.initState();
    _localFilter = ref.read(
      filterControllerProvider(categoryId: widget.categoryId),
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
      filterControllerProvider(categoryId: widget.categoryId).notifier,
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
      residence: (isOpen, ratingSort, isFurnished, priceSort, genderPref) =>
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH4,
          SortDropdown(
            label: context.loc.sortByPrice,
            currentValue: priceSort,
            onChanged: (value) => onFilterChanged(
              (localFilter as ResidenceFilter).copyWith(priceSort: value),
            ),
          ),
          gapH12,
          SortDropdown(
            label: context.loc.sortByRating,
            currentValue: ratingSort,
            onChanged: (value) => onFilterChanged(
              (localFilter as ResidenceFilter).copyWith(ratingSort: value),
            ),
          ),
          gapH8,
          FilterSwitch(
            value: isOpen,
            label: context.loc.showOpenOnly,
            onChanged: (value) => onFilterChanged(
              (localFilter as ResidenceFilter).copyWith(isOpen: value),
            ),
          ),
          FilterSwitch(
            value: isFurnished,
            label: context.loc.showFurnishedOnly,
            onChanged: (value) => onFilterChanged(
              (localFilter as ResidenceFilter).copyWith(isFurnished: value),
            ),
          ),
          gapH12,
          GenderPreferenceChips(
            selected: genderPref,
            onSelected: (gender) => onFilterChanged(
              (localFilter as ResidenceFilter).copyWith(genderPref: gender),
            ),
          ),
          gapH8,
        ],
      ),
      food: (isOpen, ratingSort, genderPref) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH4,
          SortDropdown(
            label: context.loc.sortByRating,
            currentValue: ratingSort,
            onChanged: (value) => onFilterChanged(
              (localFilter as FoodFilter).copyWith(ratingSort: value),
            ),
          ),
          gapH8,
          FilterSwitch(
            value: isOpen,
            label: context.loc.showOpenOnly,
            onChanged: (value) => onFilterChanged(
              (localFilter as FoodFilter).copyWith(isOpen: value),
            ),
          ),
          gapH12,
          GenderPreferenceChips(
            selected: genderPref,
            onSelected: (gender) => onFilterChanged(
              (localFilter as FoodFilter).copyWith(genderPref: gender),
            ),
          ),
          gapH8,
        ],
      ),
      basic: (isOpen, ratingSort) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH4,
          SortDropdown(
            label: context.loc.sortByRating,
            currentValue: ratingSort,
            onChanged: (value) => onFilterChanged(
              (localFilter as BasicFilter).copyWith(ratingSort: value),
            ),
          ),
          gapH8,
          FilterSwitch(
            value: isOpen,
            label: context.loc.showOpenOnly,
            onChanged: (value) => onFilterChanged(
              (localFilter as BasicFilter).copyWith(isOpen: value),
            ),
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
    required this.label,
    required this.currentValue,
    required this.onChanged,
  });

  final String label;
  final SortOrder currentValue;
  final void Function(SortOrder) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<SortOrder>(
      value: currentValue,
      items: [
        DropdownMenuItem(
          value: SortOrder.none,
          child: Text(context.loc.sortOrderNone),
        ),
        DropdownMenuItem(
          value: SortOrder.lowToHigh,
          child: Text(context.loc.sortOrderLowToHigh),
        ),
        DropdownMenuItem(
          value: SortOrder.highToLow,
          child: Text(context.loc.sortOrderHighToLow),
        ),
      ],
      onChanged: (value) => value != null ? onChanged(value) : null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    );
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

  final GenderPreference selected;
  final ValueChanged<GenderPreference> onSelected;

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
              onSelected: (_) => onSelected(gender),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _localizedGenderText(BuildContext context, GenderPreference gender) {
    return switch (gender) {
      GenderPreference.any => context.loc.genderPreferenceAny,
      GenderPreference.maleOnly => context.loc.genderPreferenceMaleOnly,
      GenderPreference.femaleOnly => context.loc.genderPreferenceFemaleOnly,
      GenderPreference.familyFriendly =>
        context.loc.genderPreferenceFamilyFriendly,
    };
  }
}
