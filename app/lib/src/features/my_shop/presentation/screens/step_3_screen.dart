import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
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
    final formData = wizardState.formData;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ContactCard(
            title: 'Contact Information (optional)'.hardcoded,
            children: [
              _SimpleTextField(
                label: 'Phone Number'.hardcoded,
                hint: '03001234567'.hardcoded,
                initialValue: formData.phoneNumber,
                keyboardType: TextInputType.phone,
                onChanged: (val) => wizardController.updateFormData(
                  formData.copyWith(phoneNumber: val),
                ),
              ),
              gapH12,
              _SimpleTextField(
                label: 'WhatsApp Number'.hardcoded,
                hint: '+923001234567'.hardcoded,
                initialValue: formData.waNumber,
                keyboardType: TextInputType.phone,
                onChanged: (val) => wizardController.updateFormData(
                  formData.copyWith(waNumber: val),
                ),
              ),
              gapH12,
              _SimpleTextField(
                label: 'Email Address'.hardcoded,
                hint: 'shop@example.com'.hardcoded,
                initialValue: formData.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) => wizardController.updateFormData(
                  formData.copyWith(email: val),
                ),
              ),
            ],
          ),
          gapH16,
          _ContactCard(
            title: 'Social Media (optional)'.hardcoded,
            children: [
              _SimpleTextField(
                label: 'Facebook Profile'.hardcoded,
                hint: 'e.g. @yourshop'.hardcoded,
                initialValue: formData.facebookUrl,
                onChanged: (val) => wizardController.updateFormData(
                  formData.copyWith(facebookUrl: val),
                ),
              ),
              gapH12,
              _SimpleTextField(
                label: 'Instagram Profile'.hardcoded,
                hint: 'e.g. @yourshop'.hardcoded,
                initialValue: formData.instagramUrl,
                onChanged: (val) => wizardController.updateFormData(
                  formData.copyWith(instagramUrl: val),
                ),
              ),
              gapH12,
              _SimpleTextField(
                label: 'Website Link'.hardcoded,
                hint: 'e.g. www.yourshop.com'.hardcoded,
                initialValue: formData.websiteUrl,
                keyboardType: TextInputType.url,
                onChanged: (val) => wizardController.updateFormData(
                  formData.copyWith(websiteUrl: val),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _ContactCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.p8),
        side: BorderSide(color: context.colorScheme.outline.withAlpha(80)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textTheme.titleMedium),
            gapH12,
            ...children,
          ],
        ),
      ),
    );
  }
}

class _SimpleTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String? initialValue;
  final TextInputType? keyboardType;
  final ValueChanged<String> onChanged;

  const _SimpleTextField({
    required this.label,
    required this.hint,
    required this.initialValue,
    required this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: Sizes.p12,
          horizontal: Sizes.p12,
        ),
      ),
    );
  }
}
