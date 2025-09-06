import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_state.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/my_shop/domain/shop_form_validator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_form_wizard_controller.g.dart';

const int kShopFormTotalPages = 5;

@riverpod
class ShopFormWizardController extends _$ShopFormWizardController {
  @override
  ShopFormWizardState build(ShopForm initialFormData) {
    return ShopFormWizardState(formData: initialFormData);
  }

  void setInitialCategoryData(Category? category, SubCategory? subCategory) {
    final currentFormData = state.formData;
    if (currentFormData.category != category ||
        currentFormData.subCategory != subCategory) {
      state = state.copyWith(
        formData: currentFormData.copyWith(
          category: category,
          subCategory: subCategory,
        ),
      );
    }
  }

  bool _validateCurrentPage() {
    final formData = state.formData;
    switch (state.currentPage) {
      case 0:
        if (ShopFormValidator.validateName(formData.name) != null) return false;
        if (formData.category == null) return false; // required
        if (formData.subCategory == null) return false; // required
        break;
      case 1: // Step 2: Location (City, Sector, Street Address, LatLng)
        if (ShopFormValidator.validateCity(formData.cityName) != null) {
          return false;
        }
        if (ShopFormValidator.validateSector(formData.sectorName) != null) {
          return false;
        }
        if (ShopFormValidator.validateStreetAddress(formData.streetAddress) !=
            null) {
          return false;
        }
        if (formData.latLng == null) return false; // LatLng is required
        break;
      case 2: // Step 3: Contact (Phone, Messaging, Email, Social Media)
        break;
      case 3: // Step 4: Specifics (Opening Hours, Pricing, Gender Preference)
        if (formData.openingHours == null) return false;
        if (formData.category?.id == 1) {
          if (formData.pricing == null) return false;
        }
        break;
      case 4: // Step 5: Media (Cover Image, Gallery Images)
        // Cover image is required for new shops, but not for editing
        // Gallery images are optional
        break;
    }
    return true;
  }

  bool nextPage() {
    // Changed return type to bool
    if (_validateCurrentPage()) {
      if (state.currentPage < kShopFormTotalPages - 1) {
        state = state.copyWith(currentPage: state.currentPage + 1);
        return true; // Page advanced
      }
    }
    return false; // Validation failed or already on last page
  }

  bool validateAllPages() {
    for (int i = 0; i < kShopFormTotalPages; i++) {
      // Temporarily set current page for validation
      final originalPage = state.currentPage;
      state = state.copyWith(currentPage: i);
      if (!_validateCurrentPage()) {
        state = state.copyWith(
          currentPage: originalPage,
        ); // Restore original page
        return false; // Validation failed for this page
      }
      state = state.copyWith(
        currentPage: originalPage,
      ); // Restore original page
    }
    return true; // All pages validated successfully
  }

  void previousPage() {
    if (state.currentPage > 0) {
      state = state.copyWith(currentPage: state.currentPage - 1);
    }
  }

  void updateFormData(ShopForm updatedFormData) {
    state = state.copyWith(formData: updatedFormData);
  }
}
