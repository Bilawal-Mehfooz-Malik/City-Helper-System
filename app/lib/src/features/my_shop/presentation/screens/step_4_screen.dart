import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/default_opening_hours.dart';
import 'package:app/src/core/models/my_data_types.dart';
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
              price: formData.pricing?.cost,
              isFurnished: formData.isFurnished,
              isRoomAvailable: formData.isRoomAvailable, // New field
              onPriceChanged: (val) {
                final pricing = double.tryParse(val);
                wizardController.updateFormData(
                  formData.copyWith(pricing: Pricing(cost: pricing ?? 0.0)),
                );
              },
              onFurnishedChanged: (val) => wizardController.updateFormData(
                formData.copyWith(isFurnished: val),
              ),
              onIsRoomAvailableChanged: (val) =>
                  wizardController.updateFormData(
                    // New callback
                    formData.copyWith(isRoomAvailable: val),
                  ),
            ),
          if (categoryId == 1 || categoryId == 2)
            DropdownButtonFormField<GenderPreference>(
              value: formData.genderPref,
              decoration: InputDecoration(
                labelText: 'Gender Preference'.hardcoded,
                border: const OutlineInputBorder(),
              ),
              items: GenderPreference.values
                  .map(
                    (gp) => DropdownMenuItem(value: gp, child: Text(gp.name)),
                  )
                  .toList(),
              onChanged: (val) {
                if (val != null) {
                  wizardController.updateFormData(
                    formData.copyWith(genderPref: val),
                  );
                }
              },
            ),
        ],
      ),
    );
  }
}
