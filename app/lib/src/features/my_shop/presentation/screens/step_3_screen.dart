import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/social_media_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step3ContactPage extends ConsumerWidget {
  final ShopFormWizardControllerProvider wizardProvider;

  const Step3ContactPage({super.key, required this.wizardProvider});

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
            'Phone Number (optional)'.hardcoded,
            style: context.textTheme.titleMedium,
          ),
          gapH4,
          TextFormField(
            initialValue: formData.phoneNumber,
            decoration: InputDecoration(
              hintText: '03001234567'.hardcoded,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            onChanged: (val) => wizardController.updateFormData(
              formData.copyWith(phoneNumber: val),
            ),
          ),
          gapH8,

          Text(
            'Whatsapp Number (optional)'.hardcoded,
            style: context.textTheme.titleMedium,
          ),
          gapH4,
          TextFormField(
            initialValue: formData.waNumber,
            decoration: InputDecoration(
              hintText: '+923001234567'.hardcoded,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            onChanged: (val) => wizardController.updateFormData(
              formData.copyWith(waNumber: val),
            ),
          ),
          gapH8,

          Text(
            'Email Address (optional)'.hardcoded,
            style: context.textTheme.titleMedium,
          ),
          gapH4,
          TextFormField(
            initialValue: formData.email,
            decoration: InputDecoration(
              hintText: 'shop@example.com'.hardcoded,
              border: const OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) =>
                wizardController.updateFormData(formData.copyWith(email: val)),
          ),
          gapH4,
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
    );
  }
}
