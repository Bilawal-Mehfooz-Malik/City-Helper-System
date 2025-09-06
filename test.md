import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialMediaSection extends StatelessWidget {
  final String facebook;
  final String instagram;
  final String website;
  final ValueChanged<String> onFacebookChanged;
  final ValueChanged<String> onInstagramChanged;
  final ValueChanged<String> onWebsiteChanged;

  const SocialMediaSection({
    super.key,
    required this.facebook,
    required this.instagram,
    required this.website,
    required this.onFacebookChanged,
    required this.onInstagramChanged,
    required this.onWebsiteChanged,
  });

  @override
  Widget build(BuildContext context) {
    final facebookController = TextEditingController(text: facebook);
    final instagramController = TextEditingController(text: instagram);
    final websiteController = TextEditingController(text: website);

    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
        side: BorderSide(
          color: context.colorScheme.outline.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colorScheme.surface,
              context.colorScheme.surface.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Social Media (optional)'.hardcoded,
                style: context.textTheme.titleMedium,
              ),
              gapH8,
              TextFormField(
                controller: facebookController,
                onChanged: onFacebookChanged,
                decoration: InputDecoration(
                  hintText: 'e.g. @yourshop'.hardcoded,
                  prefixIcon: Icon(Icons.facebook, color: context.colorScheme.primary),
                  filled: true,
                  fillColor: context.colorScheme.surface.withOpacity(0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
                  ),
                ),
              ),
              gapH12,
              TextFormField(
                controller: instagramController,
                onChanged: onInstagramChanged,
                decoration: InputDecoration(
                  hintText: 'e.g. @yourshop'.hardcoded,
                  prefixIcon: Icon(Icons.camera_alt, color: context.colorScheme.primary),
                  filled: true,
                  fillColor: context.colorScheme.surface.withOpacity(0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
                  ),
                ),
              ),
              gapH12,
              TextFormField(
                controller: websiteController,
                onChanged: onWebsiteChanged,
                decoration: InputDecoration(
                  hintText: 'e.g. www.yourshop.com'.hardcoded,
                  prefixIcon: Icon(Icons.language, color: context.colorScheme.primary),
                  filled: true,
                  fillColor: context.colorScheme.surface.withOpacity(0.9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
                  ),
                ),
                keyboardType: TextInputType.url,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Step3ContactPage extends ConsumerWidget {
  final ShopFormWizardControllerProvider wizardProvider;

  const Step3ContactPage({super.key, required this.wizardProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final formData = wizardState.formData;

    final phoneController = TextEditingController(text: formData.phoneNumber);
    final waController = TextEditingController(text: formData.waNumber);
    final emailController = TextEditingController(text: formData.email);

    return ResponsiveScrollable(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        spacing: Sizes.p12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.p8),
              side: BorderSide(
                color: context.colorScheme.outline.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.surface,
                    context.colorScheme.surface.withValues(alpha: 0.9),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contact Information (optional)'.hardcoded,
                      style: context.textTheme.titleMedium,
                    ),
                    gapH8,
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: '03001234567'.hardcoded,
                        prefixIcon: Icon(Icons.phone, color: context.colorScheme.primary),
                        filled: true,
                        fillColor: context.colorScheme.surface.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.p8),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.p8),
                          borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => wizardController.updateFormData(
                        formData.copyWith(phoneNumber: val),
                      ),
                    ),
                    gapH12,
                    TextFormField(
                      controller: waController,
                      decoration: InputDecoration(
                        hintText: '+923001234567'.hardcoded,
                        prefixIcon: Icon(Icons.message, color: context.colorScheme.primary),
                        filled: true,
                        fillColor: context.colorScheme.surface.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.p8),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.p8),
                          borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => wizardController.updateFormData(
                        formData.copyWith(waNumber: val),
                      ),
                    ),
                    gapH12,
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'shop@example.com'.hardcoded,
                        prefixIcon: Icon(Icons.email, color: context.colorScheme.primary),
                        filled: true,
                        fillColor: context.colorScheme.surface.withOpacity(0.9),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.p8),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.p8),
                          borderSide: BorderSide(color: context.colorScheme.primary, width: 2),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) => wizardController.updateFormData(
                        formData.copyWith(email: val),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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