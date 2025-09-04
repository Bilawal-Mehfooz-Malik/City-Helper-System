import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_picker_tile.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step2LocationPage extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final ShopFormWizardControllerProvider wizardProvider;

  const Step2LocationPage({
    super.key,
    required this.formKey,
    required this.wizardProvider,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final ShopForm formData = wizardState.formData;

    return Form(
      key: formKey,
      child: ResponsiveScrollable(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Sizes.p12,
          children: [
            TextFormField(
              initialValue: formData.cityName,
              decoration: InputDecoration(labelText: 'City *'.hardcoded),
              validator: (val) => val!.isEmpty ? 'Required'.hardcoded : null,
              onChanged: (val) => wizardController.updateFormData(
                formData.copyWith(cityName: val),
              ),
            ),
            TextFormField(
              initialValue: formData.sectorName,
              decoration: InputDecoration(labelText: 'Sector *'.hardcoded),
              validator: (val) => val!.isEmpty ? 'Required'.hardcoded : null,
              onChanged: (val) => wizardController.updateFormData(
                formData.copyWith(sectorName: val),
              ),
            ),
            TextFormField(
              initialValue: formData.streetAddress,
              decoration: InputDecoration(
                labelText: 'Street Address *'.hardcoded,
              ),
              validator: (val) => val!.isEmpty ? 'Required'.hardcoded : null,
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
      ),
    );
  }
}