import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/controllers/shop_form_wizard_state.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_form_wizard_controller.g.dart';

const int kShopFormTotalPages = 3;

@riverpod
class ShopFormWizardController extends _$ShopFormWizardController {
  @override
  ShopFormWizardState build(ShopForm initialFormData) {
    return ShopFormWizardState(
      formData: initialFormData,
      formKeys: List.generate(
        kShopFormTotalPages,
        (_) => GlobalKey<FormState>(),
      ),
    );
  }

  void nextPage() {
    if (state.formKeys[state.currentPage].currentState!.validate()) {
      if (state.currentPage < kShopFormTotalPages - 1) {
        state = state.copyWith(currentPage: state.currentPage + 1);
      }
    }
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
