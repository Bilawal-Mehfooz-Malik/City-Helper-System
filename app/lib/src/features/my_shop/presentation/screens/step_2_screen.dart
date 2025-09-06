import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_picker_tile.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2LocationPage extends ConsumerWidget {
  final ShopFormWizardControllerProvider wizardProvider;

  const Step2LocationPage({super.key, required this.wizardProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final ShopForm formData = wizardState.formData;

    return ResponsiveScrollable(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        spacing: Sizes.p8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LocationFieldCard(
            title: 'Business City Name *'.hardcoded,
            hint: 'e.g. Mirpur'.hardcoded,
            initialValue: formData.cityName,
            onChanged: (val) => wizardController.updateFormData(
              formData.copyWith(cityName: val),
            ),
          ),
          LocationFieldCard(
            title: 'Business Sector Name *'.hardcoded,
            hint: 'e.g. C4'.hardcoded,
            initialValue: formData.sectorName,

            onChanged: (val) => wizardController.updateFormData(
              formData.copyWith(sectorName: val),
            ),
          ),
          LocationFieldCard(
            title: 'Business Street Address *'.hardcoded,
            hint: 'e.g. 1st Floor, ABC Building'.hardcoded,
            initialValue: formData.streetAddress,

            onChanged: (val) => wizardController.updateFormData(
              formData.copyWith(streetAddress: val),
            ),
          ),
          LocationPickerTile(
            pickedLatLng: formData.latLng,
            onLocationPicked: (latLng) => wizardController.updateFormData(
              formData.copyWith(latLng: latLng),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationFieldCard extends StatelessWidget {
  final String title;
  final String hint;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const LocationFieldCard({
    super.key,
    required this.title,
    required this.hint,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
        side: BorderSide(
          color: context.colorScheme.outline.withAlpha(126),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textTheme.titleMedium),
            gapH4,
            TextFormField(
              initialValue: initialValue,
              decoration: InputDecoration(
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Sizes.p8),
                ),
                filled: true,
                fillColor: context.colorScheme.surface.withAlpha(25),
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
