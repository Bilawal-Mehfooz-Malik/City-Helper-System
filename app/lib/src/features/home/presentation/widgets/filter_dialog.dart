import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/filters/entity_filter.dart';
import 'package:app/src/features/home/domain/filters/food_filter.dart';
import 'package:app/src/features/home/domain/filters/residence_filter.dart';
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
        1 => ResidenceFilter(),
        2 => FoodFilter(),
        _ => EntityFilter(),
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
          controller: controller,
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
    required this.controller,
    required this.localFilter,
    required this.onFilterChanged,
  });

  final FilterController controller;
  final EntityFilter localFilter;
  final void Function(EntityFilter) onFilterChanged;

  EntityFilter updateField({SortOrder? ratingSort, bool? isOpen}) {
    return switch (localFilter) {
      ResidenceFilter f => f.copyWith(
        ratingSort: ratingSort ?? f.ratingSort,
        isOpen: isOpen ?? f.isOpen,
      ),
      FoodFilter f => f.copyWith(
        ratingSort: ratingSort ?? f.ratingSort,
        isOpen: isOpen ?? f.isOpen,
      ),
      _ => localFilter.copyWith(
        ratingSort: ratingSort ?? localFilter.ratingSort,
        isOpen: isOpen ?? localFilter.isOpen,
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final residenceFilter = localFilter is ResidenceFilter
        ? localFilter as ResidenceFilter
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH4,
        if (residenceFilter != null) ...[
          SortDropdown(
            label: context.loc.sortByPrice,
            currentValue: residenceFilter.priceSort,
            onChanged: (value) =>
                onFilterChanged(residenceFilter.copyWith(priceSort: value)),
          ),
          gapH12,
        ],
        SortDropdown(
          label: context.loc.sortByRating,
          currentValue: localFilter.ratingSort,
          onChanged: (value) => onFilterChanged(updateField(ratingSort: value)),
        ),
        gapH8,
        FilterSwitch(
          value: localFilter.isOpen,
          label: context.loc.showOpenOnly,
          onChanged: (value) => onFilterChanged(updateField(isOpen: value)),
        ),
        if (residenceFilter != null)
          FilterSwitch(
            value: residenceFilter.isFurnished,
            label: context.loc.showFurnishedOnly,
            onChanged: (value) =>
                onFilterChanged(residenceFilter.copyWith(isFurnished: value)),
          ),
        gapH12,
        GenderPreferenceChips(
          selected: switch (localFilter) {
            ResidenceFilter f => f.genderPref,
            FoodFilter f => f.genderPref,
            _ => GenderPreference.any,
          },
          onSelected: (gender) {
            final updated = switch (localFilter) {
              ResidenceFilter f => f.copyWith(genderPref: gender),
              FoodFilter f => f.copyWith(genderPref: gender),
              _ => localFilter,
            };
            onFilterChanged(updated);
          },
        ),
        gapH8,
      ],
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
