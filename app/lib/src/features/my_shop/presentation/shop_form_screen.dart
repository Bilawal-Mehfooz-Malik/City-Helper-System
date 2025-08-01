import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/my_shop/application/shop_form_provider.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_controller.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_controller.dart';
import 'package:app/src/features/my_shop/presentation/screens/step_1_screen.dart';
import 'package:app/src/features/my_shop/presentation/screens/step_2_screen.dart';
import 'package:app/src/features/my_shop/presentation/screens/step_3_screen.dart';
import 'package:app/src/features/my_shop/presentation/screens/step_4_screen.dart';
import 'package:app/src/features/my_shop/presentation/screens/step_5_screen.dart';
import 'package:app/src/features/my_shop/presentation/shop_form_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ShopFormScreen extends ConsumerWidget {
  final EntityDetail? initialShop;
  const ShopFormScreen({super.key, this.initialShop});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = initialShop != null;
    return isEditing ? _buildEditModeBody(ref) : _buildCreateModeBody(ref);
  }

  Widget _buildEditModeBody(WidgetRef ref) {
    final initialDataAsync = ref.watch(
      initialShopCategoryDataProvider(
        categoryId: initialShop!.categoryId,
        subCategoryId: initialShop!.subCategoryId,
      ),
    );
    return AsyncValueWidget<ShopFormInitialData>(
      value: initialDataAsync,
      data: (initialData) {
        final initialForm = ShopForm.fromEntityDetail(initialShop!).copyWith(
          category: initialData.selectedCategory,
          subCategory: initialData.selectedSubCategory,
        );
        return ShopFormWizard(
          key: ValueKey(initialShop!.id),
          initialShop: initialShop,
          allCategories: initialData.allCategories,
          initialSubCategories: initialData.subCategoryOptions,
          initialForm: initialForm,
        );
      },
    );
  }

  Widget _buildCreateModeBody(WidgetRef ref) {
    final allCategoriesAsync = ref.watch(categoriesListFutureProvider);
    return AsyncValueWidget<List<Category>>(
      value: allCategoriesAsync,
      data: (allCategories) => ShopFormWizard(
        key: const ValueKey('newShop'),
        initialShop: null,
        allCategories: allCategories,
        initialSubCategories: const [],
        initialForm: ShopForm.defaults(),
      ),
    );
  }
}

class ShopFormWizard extends ConsumerStatefulWidget {
  final EntityDetail? initialShop;
  final ShopForm initialForm;
  final List<Category> allCategories;
  final List<SubCategory> initialSubCategories;

  const ShopFormWizard({
    super.key,
    this.initialShop,
    required this.initialForm,
    required this.allCategories,
    required this.initialSubCategories,
  });

  @override
  ConsumerState<ShopFormWizard> createState() => _ShopFormWizardState();
}

class _ShopFormWizardState extends ConsumerState<ShopFormWizard> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _submitShop() async {
    final wizardProvider = shopFormWizardControllerProvider(widget.initialForm);
    final currentFormData = ref.read(wizardProvider).formData;
    final isEditing = widget.initialShop != null;

    // FIX: Check for changes before submitting in edit mode
    if (isEditing) {
      final bool hasDataChanged = widget.initialForm != currentFormData;
      final bool haveImagesChanged =
          currentFormData.coverImageBytes != null ||
          currentFormData.galleryImageBytes.isNotEmpty ||
          currentFormData.galleryUrlsToDelete.isNotEmpty;

      if (!hasDataChanged && !haveImagesChanged) {
        context.pop();
        return; // Exit without doing anything
      }
    }

    if (currentFormData.category == null ||
        currentFormData.latLng == null ||
        (!isEditing && currentFormData.coverImageBytes == null)) {
      showSnackBar(
        context: context,
        message:
            'Please fill all required fields, including category, location, and cover image.',
      );
      return;
    }

    final shopToSave = currentFormData.toEntityDetail(widget.initialShop);

    final bool success = await ref
        .read(shopControllerProvider.notifier)
        .setShop(
          shop: shopToSave,
          categoryId: currentFormData.category!.id,
          coverImageBytes: currentFormData.coverImageBytes,
          galleryImagesBytes: currentFormData.galleryImageBytes,
          galleryUrlsToDelete: currentFormData.galleryUrlsToDelete,
        );

    if (success && mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final wizardProvider = shopFormWizardControllerProvider(widget.initialForm);
    final isEditing = widget.initialShop != null;
    final wizardState = ref.watch(wizardProvider);
    final wizardController = ref.read(wizardProvider.notifier);
    final shopControllerState = ref.watch(shopControllerProvider);
    final isLastPage = wizardState.currentPage == kShopFormTotalPages - 1;

    ref.listen(shopControllerProvider, (previous, next) {
      if (next is AsyncError) {
        showSnackBar(
          context: context,
          message: 'Failed to save shop: ${next.error}',
        );
      }
      if (previous is AsyncLoading && next is AsyncData) {
        showSnackBar(context: context, message: 'Shop saved successfully');
      }
    });

    ref.listen(wizardProvider.select((s) => s.currentPage), (_, nextPage) {
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${isEditing ? 'Edit' : 'Register'} Shop - Step ${wizardState.currentPage + 1}/$kShopFormTotalPages',
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Step1BasicDetailsPage(
              formKey: wizardState.formKeys[0],
              allCategories: widget.allCategories,
              initialSubCategories: widget.initialSubCategories,
              initialForm: widget.initialForm,
              isEditing: isEditing,
            ),
            Step2LocationPage(
              formKey: wizardState.formKeys[1],
              initialForm: widget.initialForm,
            ),
            Step3ContactPage(
              formKey: wizardState.formKeys[2],
              initialForm: widget.initialForm,
            ),
            Step4SpecificsPage(
              formKey: wizardState.formKeys[3],
              initialForm: widget.initialForm,
            ),
            Step5MediaPage(
              formKey: wizardState.formKeys[4],
              initialCoverUrl: widget.initialShop?.coverImageUrl,
              initialGalleryUrls: widget.initialShop?.galleryImageUrls ?? [],
              initialForm: widget.initialForm,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (wizardState.currentPage > 0)
              TextButton.icon(
                icon: const Icon(Icons.arrow_back_ios),
                label: Text('Back'.hardcoded),
                onPressed: wizardController.previousPage,
              )
            else
              const SizedBox(),
            PrimaryButton(
              isLoading: shopControllerState.isLoading,
              onPressed: () {
                if (isLastPage) {
                  if (wizardState
                      .formKeys[wizardState.currentPage]
                      .currentState!
                      .validate()) {
                    _submitShop();
                  }
                } else {
                  wizardController.nextPage();
                }
              },
              text: isLastPage
                  ? (isEditing ? 'Save Changes' : 'Submit'.hardcoded)
                  : 'Next'.hardcoded,
            ),
          ],
        ),
      ),
    );
  }
}
