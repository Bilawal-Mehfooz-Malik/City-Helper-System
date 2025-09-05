import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/default_opening_hours.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/pricing.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/opening_hour_tile.dart';
import 'package:app/src/features/my_shop/presentation/widgets/residence_specific_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step4SpecificsPage extends ConsumerWidget {
  final ShopFormWizardControllerProvider wizardProvider;

  const Step4SpecificsPage({super.key, required this.wizardProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final ShopForm formData = wizardState.formData;
    final categoryId = formData.category?.id;

    final pricing =
        formData.pricing ??
        Pricing.fromListingType(
          cost: 0.0,
          listingType: formData.listingType ?? ListingType.forRent,
        );

    return ResponsiveScrollable(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        spacing: Sizes.p12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OpeningHoursTile(
            openingHours: formData.openingHours ?? defaultOpeningHours,
            onOpeningHoursChanged: (hours) => wizardController.updateFormData(
              formData.copyWith(openingHours: hours),
            ),
            categoryId: categoryId ?? 0,
          ),
          if (categoryId == 1)
            ResidenceSpecificSection(
              pricing: pricing,
              listingType: formData.listingType,
              isFurnished: formData.isFurnished,
              isRoomAvailable: formData.isRoomAvailable,
              onPricingChanged: (newPricing) {
                wizardController.updateFormData(
                  formData.copyWith(pricing: newPricing),
                );
              },
              onFurnishedChanged: (val) => wizardController.updateFormData(
                formData.copyWith(isFurnished: val),
              ),
              onIsRoomAvailableChanged: (val) => wizardController
                  .updateFormData(formData.copyWith(isRoomAvailable: val)),
            ),
          if (categoryId == 1 || categoryId == 2)
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.p8),
                side: BorderSide(
                  color: context.colorScheme.outline.withValues(alpha: 0.5),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select the preferred gender for your listing *'
                          .hardcoded,
                      style: context.textTheme.titleMedium,
                    ),
                    gapH12,
                    DropdownButtonFormField<GenderPreference?>(
                      value: formData.genderPref,
                      decoration: InputDecoration(
                        labelText: 'Gender Preference'.hardcoded,
                        hintText: 'Select Gender Preference'.hardcoded,
                        border: const OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem<GenderPreference?>(
                          value: null,
                          child: Text('None'.hardcoded),
                        ),
                        ...GenderPreference.values.map(
                          (gp) => DropdownMenuItem<GenderPreference?>(
                            value: gp,
                            child: Text(gp.name),
                          ),
                        ),
                      ],
                      onChanged: (val) {
                        wizardController.updateFormData(
                          formData.copyWith(genderPref: val),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
