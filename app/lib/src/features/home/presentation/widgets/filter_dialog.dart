import 'package:app/src/core/common_widgets/custom_text_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/presentation/controllers/filter_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterDialog extends ConsumerWidget {
  const FilterDialog({super.key, required this.categoryId});

  final CategoryId categoryId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(
      filterControllerProvider(category: categoryId).notifier,
    );
    final filter = ref.watch(filterControllerProvider(category: categoryId));

    final isResidence = controller.isResidence;
    final residenceFilter = controller.asResidence;

    return AlertDialog(
      title: Text(context.loc.filtersTitle),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Price Sort (Only for Residence)
            if (isResidence && residenceFilter != null)
              DropdownButtonFormField<SortOrder>(
                value: residenceFilter.priceSort,
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
                onChanged:
                    (value) => controller.updateFilter(priceSort: value!),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: context.loc.sortByPrice,
                ),
              ),
            gapH12,

            // Rating Sort (Shared)
            DropdownButtonFormField<SortOrder>(
              value: filter.ratingSort,
              items: [
                DropdownMenuItem(
                  value: SortOrder.none,
                  child: Text(context.loc.sortOrderNone),
                ),
                DropdownMenuItem(
                  value: SortOrder.highToLow,
                  child: Text(context.loc.highestRatedFirst),
                ),
                DropdownMenuItem(
                  value: SortOrder.lowToHigh,
                  child: Text(context.loc.lowestRatedFirst),
                ),
              ],
              onChanged: (value) => controller.updateFilter(ratingSort: value!),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: context.loc.sortByRating,
              ),
            ),
            gapH8,

            // isOpen Switch (Shared)
            SwitchListTile(
              value: filter.isOpen,
              contentPadding: EdgeInsets.zero,
              title: Text(context.loc.showOpenOnly),
              onChanged: (value) => controller.updateFilter(isOpen: value),
            ),

            // isFurnished Switch (Only for Residence)
            if (isResidence && residenceFilter != null)
              SwitchListTile(
                value: residenceFilter.isFurnished,
                contentPadding: EdgeInsets.zero,
                title: Text(context.loc.showFurnishedOnly),
                onChanged:
                    (value) => controller.updateFilter(isFurnished: value),
              ),
            gapH12,

            // Gender Preference (Shared)
            Column(
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
                  children:
                      GenderPreference.values.map((gender) {
                        String localizedText;
                        switch (gender) {
                          case GenderPreference.any:
                            localizedText = context.loc.genderPreferenceAny;
                            break;
                          case GenderPreference.maleOnly:
                            localizedText =
                                context.loc.genderPreferenceMaleOnly;
                            break;
                          case GenderPreference.femaleOnly:
                            localizedText =
                                context.loc.genderPreferenceFemaleOnly;
                            break;
                          case GenderPreference.familyFriendly:
                            localizedText =
                                context.loc.genderPreferenceFamilyFriendly;
                            break;
                        }
                        return ChoiceChip(
                          label: Text(localizedText),
                          selected: filter.genderPref == gender,
                          onSelected:
                              (_) =>
                                  controller.updateFilter(genderPref: gender),
                        );
                      }).toList(),
                ),
              ],
            ),
            gapH8,
          ],
        ),
      ),
      actions: [
        CustomTextButton(
          onPressed: () {
            controller.resetFilters();
            Navigator.of(context).pop();
          },
          text: context.loc.resetButton,
        ),
        PrimaryButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          text: context.loc.applyFiltersButton,
        ),
      ],
    );
  }
}
