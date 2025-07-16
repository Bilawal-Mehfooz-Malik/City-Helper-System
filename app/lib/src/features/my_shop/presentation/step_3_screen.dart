import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/residence_specific_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step3Screen extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  // This page only needs the data required to find the correct provider instance.
  final ShopForm initialForm;

  const Step3Screen({
    super.key,
    required this.formKey,
    required this.initialForm,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the correct provider instance for this form session.
    final wizardProvider = shopFormWizardControllerProvider(initialForm);

    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final ShopForm formData = wizardState.formData;
    final categoryId = formData.category?.id;

    return Form(
      key: formKey,
      child: ResponsiveScrollable(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          spacing: Sizes.p12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Conditionally show Residence-Specific Fields (Category ID == 1)
            if (categoryId == 1)
              ResidenceSpecificSection(
                price: formData.price,
                isFurnished: formData.isFurnished,
                onPriceChanged: (val) {
                  // Safely parse the double, allowing the field to be empty
                  final price = double.tryParse(val);
                  wizardController.updateFormData(
                    formData.copyWith(price: price),
                  );
                },
                onFurnishedChanged: (val) => wizardController.updateFormData(
                  formData.copyWith(isFurnished: val),
                ),
              ),

            // Conditionally show Gender Preference (Category ID == 1 for Residences or 2 for Food)
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
                validator: (val) =>
                    val == null ? 'Please select a preference'.hardcoded : null,
              ),

            gapH24,
            Center(
              child: Text(
                "You're all set! Review previous pages or press submit."
                    .hardcoded,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
