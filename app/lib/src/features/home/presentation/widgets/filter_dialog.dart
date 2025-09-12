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
  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(
      filterControllerProvider(
        categoryId: widget.categoryId,
        filterContext: widget.filterContext,
      ),
    );
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
          filter: filter,
          controller: controller,
        ),
      ),
      actions: [
        CustomTextButton(
          onPressed: () => controller.resetFilters(),
          text: context.loc.resetButton,
        ),
        PrimaryButton(
          onPressed: () => Navigator.of(context).pop(),
          text: context.loc.applyFiltersButton,
        ),
      ],
    );
  }
}

class FilterDialogContent extends StatelessWidget {
  const FilterDialogContent({
    super.key,
    required this.filter,
    required this.controller,
  });

  final EntityFilter filter;
  final FilterController controller;

  @override
  Widget build(BuildContext context) {
    return filter.when(
      residence: (sortBy, sortOrder, isFurnished, isRoomAvailable, genderPref) =>
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SortSection(
            sortBy: sortBy,
            sortOrder: sortOrder,
            controller: controller,
            supportedSorts: const [SortBy.updatedAt, SortBy.price, SortBy.rating],
          ),
          gapH8,
          FilterSwitch(
            value: isFurnished,
            label: context.loc.showFurnishedOnly,
            onChanged: (value) => controller.setFurnished(value),
          ),
          FilterSwitch(
            value: isRoomAvailable,
            label: context.loc.showAvailableOnly,
            onChanged: (value) => controller.setRoomAvailable(value),
          ),
          gapH12,
          GenderPreferenceChips(
            selected: genderPref,
            onSelected: (gender) => controller.setGender(gender),
          ),
          gapH8,
        ],
      ),
      food: (sortBy, sortOrder, genderPref) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SortSection(
            sortBy: sortBy,
            sortOrder: sortOrder,
            controller: controller,
            supportedSorts: const [SortBy.updatedAt, SortBy.rating],
          ),
          gapH12,
          GenderPreferenceChips(
            selected: genderPref,
            onSelected: (gender) => controller.setGender(gender),
          ),
          gapH8,
        ],
      ),
      basic: (sortBy, sortOrder) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SortSection(
            sortBy: sortBy,
            sortOrder: sortOrder,
            controller: controller,
            supportedSorts: const [SortBy.rating],
          ),
          gapH8,
        ],
      ),
    );
  }
}

class SortSection extends StatelessWidget {
  const SortSection({
    super.key,
    required this.sortBy,
    required this.sortOrder,
    required this.controller,
    required this.supportedSorts,
  });

  final SortBy sortBy;
  final SortOrder sortOrder;
  final FilterController controller;
  final List<SortBy> supportedSorts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.sortByLabel,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () => controller.toggleSortOrder(),
              icon: Icon(
                sortOrder == SortOrder.highToLow
                    ? Icons.arrow_downward
                    : Icons.arrow_upward,
              ),
            ),
          ],
        ),
        gapH8,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: supportedSorts.map((sort) {
            return ChoiceChip(
              label: Text(_localizedSortByText(context, sort)),
              selected: sortBy == sort,
              onSelected: (_) => controller.setSort(sort),
            );
          }).toList(),
        ),
      ],
    );
  }

  String _localizedSortByText(BuildContext context, SortBy sort) {
    return switch (sort) {
      SortBy.price => context.loc.sortByPrice,
      SortBy.rating => context.loc.sortByRating,
      SortBy.updatedAt => context.loc.sortByLatest,
    };
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