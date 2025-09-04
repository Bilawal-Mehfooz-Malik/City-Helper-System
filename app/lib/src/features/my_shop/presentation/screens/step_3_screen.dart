import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/social_media_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step3ContactPage extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final ShopFormWizardControllerProvider wizardProvider;

  const Step3ContactPage({
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
          spacing: Sizes.p12,
          children: [
            TextFormField(
              initialValue: formData.phoneNumber,
              decoration: InputDecoration(labelText: 'Phone Number'.hardcoded),
              keyboardType: TextInputType.phone,
              onChanged: (val) => wizardController.updateFormData(
                formData.copyWith(phoneNumber: val),
              ),
            ),
            TextFormField(
              initialValue: formData.waNumber,
              decoration: InputDecoration(
                labelText: 'Messaging Number'.hardcoded,
              ),
              keyboardType: TextInputType.phone,
              onChanged: (val) => wizardController.updateFormData(
                formData.copyWith(waNumber: val),
              ),
            ),
            TextFormField(
              initialValue: formData.email,
              decoration: InputDecoration(labelText: 'Email Address'.hardcoded),
              keyboardType: TextInputType.emailAddress,
              onChanged: (val) => wizardController.updateFormData(
                formData.copyWith(email: val),
              ),
            ),
            const Divider(),
            SocialMediaSection(
              facebook: formData.facebookUrl,
              instagram: formData.instagramUrl,
              website: formData.websiteUrl,
              onFacebookChanged: (val) => wizardController.updateFormData(
                formData.copyWith(facebookUrl: val),
              ),
              onInstagramChanged: (val) => wizardController.updateFormData(
                formData.copyWith(instagramUrl: val),
              ),
              onWebsiteChanged: (val) => wizardController.updateFormData(
                formData.copyWith(websiteUrl: val),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
