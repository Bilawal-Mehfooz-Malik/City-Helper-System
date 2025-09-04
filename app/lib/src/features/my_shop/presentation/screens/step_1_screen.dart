import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/basic_info_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/category_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1BasicDetailsPage extends ConsumerWidget {
  final List<Category> allCategories;
  final List<SubCategory> initialSubCategories;
  final ShopFormWizardControllerProvider wizardProvider;
  final bool isEditing;

  const Step1BasicDetailsPage({
    super.key,
    required this.allCategories,
    required this.initialSubCategories,
    required this.wizardProvider,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final ShopForm formData = wizardState.formData;

    final subCategoryOptionsAsync = formData.category != null
        ? ref.watch(subCategoriesListFutureProvider(formData.category!.id))
        : null;

    return ResponsiveScrollable(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Column(
        spacing: Sizes.p12,
        children: [
          CategorySection(
            isEditing: isEditing,
            allCategories: allCategories,
            subCategoryOptions:
                subCategoryOptionsAsync?.valueOrNull ?? initialSubCategories,
            selectedCategory: formData.category,
            selectedSubCategory: formData.subCategory,
            onCategoryChanged: (category) {
              final updatedForm = formData.copyWith(
                category: category,
                subCategory: null,
              );
              wizardController.updateFormData(updatedForm);
            },
            onSubCategoryChanged: (subCategory) => wizardController
                .updateFormData(formData.copyWith(subCategory: subCategory)),
          ),
          gapH12,
          // FIX: This call is now valid and will not cause an error.
          BasicInfoSection(
            name: formData.name,
            description: formData.description,
            onNameChanged: (val) =>
                wizardController.updateFormData(formData.copyWith(name: val)),
            onDescriptionChanged: (val) => wizardController.updateFormData(
              formData.copyWith(description: val),
            ),
          ),
        ],
      ),
    );
  }
}
