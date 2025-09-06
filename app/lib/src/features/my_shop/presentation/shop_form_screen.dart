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

class ShopFormScreen extends ConsumerStatefulWidget {
  final EntityDetail? initialShop;
  const ShopFormScreen({super.key, this.initialShop});

  @override
  ConsumerState<ShopFormScreen> createState() => _ShopFormScreenState();
}

class _ShopFormScreenState extends ConsumerState<ShopFormScreen> {
  late final ShopFormWizardControllerProvider wizardProvider;

  @override
  void initState() {
    super.initState();
    final initialForm = widget.initialShop != null
        ? ShopForm.fromEntityDetail(widget.initialShop!)
        : ShopForm.defaults();
    wizardProvider = shopFormWizardControllerProvider(initialForm);
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initialShop != null;
    final wizardState = ref.watch(wizardProvider);

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
      body: isEditing ? _buildEditModeBody(ref) : _buildCreateModeBody(ref),
    );
  }

  Widget _buildEditModeBody(WidgetRef ref) {
    final provider = initialShopCategoryDataProvider(
      categoryId: widget.initialShop!.categoryId,
      subCategoryId: widget.initialShop!.subCategoryId,
    );

    ref.listen<AsyncValue<ShopFormInitialData>>(provider, (previous, next) {
      if (next.hasValue) {
        final initialData = next.value!;
        ref
            .read(wizardProvider.notifier)
            .setInitialCategoryData(
              initialData.selectedCategory,
              initialData.selectedSubCategory,
            );
      }
    });

    final initialDataAsync = ref.watch(provider);
    return AsyncValueWidget<ShopFormInitialData>(
      value: initialDataAsync,
      data: (initialData) {
        return ShopFormWizard(
          key: ValueKey(widget.initialShop!.id),
          initialShop: widget.initialShop,
          allCategories: initialData.allCategories,
          initialSubCategories: initialData.subCategoryOptions,
          wizardProvider: wizardProvider,
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
        wizardProvider: wizardProvider,
      ),
    );
  }
}

class ShopFormWizard extends ConsumerStatefulWidget {
  final EntityDetail? initialShop;
  final List<Category> allCategories;
  final List<SubCategory> initialSubCategories;
  final ShopFormWizardControllerProvider wizardProvider;

  const ShopFormWizard({
    super.key,
    this.initialShop,
    required this.allCategories,
    required this.initialSubCategories,
    required this.wizardProvider,
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
    final currentFormData = ref.read(widget.wizardProvider).formData;
    final isEditing = widget.initialShop != null;

    // FIX: Check for changes before submitting in edit mode
    if (isEditing) {
      final initialForm = ShopForm.fromEntityDetail(widget.initialShop!);
      final bool hasDataChanged = initialForm != currentFormData;
      final bool haveImagesChanged =
          currentFormData.coverImageBytes != null ||
          currentFormData.galleryImageBytes.isNotEmpty ||
          currentFormData.galleryUrlsToDelete.isNotEmpty;

      if (!hasDataChanged && !haveImagesChanged) {
        context.pop();
        return; // Exit without doing anything
      }
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
          menuImagesBytes: currentFormData.menuImageBytes,
          menuUrlsToDelete: currentFormData.menuUrlsToDelete,
        );

    if (success && mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initialShop != null;
    final wizardState = ref.watch(widget.wizardProvider);
    final wizardController = ref.read(widget.wizardProvider.notifier);
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

    ref.listen(widget.wizardProvider.select((s) => s.currentPage), (
      _,
      nextPage,
    ) {
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });

    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Step1BasicDetailsPage(
                allCategories: widget.allCategories,
                initialSubCategories: widget.initialSubCategories,
                wizardProvider: widget.wizardProvider,
                isEditing: isEditing,
              ),
              Step2LocationPage(wizardProvider: widget.wizardProvider),
              Step3ContactPage(wizardProvider: widget.wizardProvider),
              Step4SpecificsPage(wizardProvider: widget.wizardProvider),
              Step5MediaPage(
                initialCoverUrl: widget.initialShop?.coverImageUrl,
                initialGalleryUrls: widget.initialShop?.galleryImageUrls ?? [],
                initialMenuUrls: (widget.initialShop is FoodDetail)
                    ? (widget.initialShop as FoodDetail).menuImageUrls
                    : [],
                wizardProvider: widget.wizardProvider,
              ),
            ],
          ),
        ),
        BottomAppBar(
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
                    if (wizardController.validateAllPages()) {
                      // New validation check
                      _submitShop();
                    } else {
                      showSnackBar(
                        // Show error if validation fails
                        context: context,
                        message: 'Please fill all required fields.',
                      );
                    }
                  } else {
                    if (!wizardController.nextPage()) {
                      // Check if page advanced
                      showSnackBar(
                        // Show error if validation fails
                        context: context,
                        message:
                            'Please fill all required fields on this page.',
                      );
                    }
                  }
                },
                text: isLastPage
                    ? (isEditing ? 'Save Changes' : 'Submit'.hardcoded)
                    : 'Next'.hardcoded,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
