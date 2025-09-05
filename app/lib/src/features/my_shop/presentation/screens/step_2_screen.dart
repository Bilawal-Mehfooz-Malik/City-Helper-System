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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Business City Name *'.hardcoded,
            style: context.textTheme.titleMedium,
          ),
          gapH4,
          TextFormField(
            initialValue: formData.cityName,
            decoration: InputDecoration(
              hintText: 'e.g. Mirpur'.hardcoded,
              border: const OutlineInputBorder(),
            ),
            onChanged: (val) => wizardController.updateFormData(
              formData.copyWith(cityName: val),
            ),
          ),
          gapH8,

          Text(
            'Business Sector Name *'.hardcoded,
            style: context.textTheme.titleMedium,
          ),
          gapH4,
          TextFormField(
            initialValue: formData.sectorName,
            decoration: InputDecoration(
              hintText: 'e.g. C4'.hardcoded,
              border: const OutlineInputBorder(),
            ),
            onChanged: (val) => wizardController.updateFormData(
              formData.copyWith(sectorName: val),
            ),
          ),
          gapH8,

          Text(
            'Business Street Address *'.hardcoded,
            style: context.textTheme.titleMedium,
          ),
          gapH4,
          TextFormField(
            initialValue: formData.streetAddress,
            decoration: InputDecoration(
              hintText: 'e.g. 1st Floor, ABC Building'.hardcoded,
              border: const OutlineInputBorder(),
            ),
            onChanged: (val) => wizardController.updateFormData(
              formData.copyWith(streetAddress: val),
            ),
          ),
          gapH16,

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
