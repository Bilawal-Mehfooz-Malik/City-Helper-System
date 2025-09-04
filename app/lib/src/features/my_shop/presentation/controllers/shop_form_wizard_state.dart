import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_form_wizard_state.freezed.dart';

@freezed
abstract class ShopFormWizardState with _$ShopFormWizardState {
  const factory ShopFormWizardState({
    @Default(0) int currentPage,
    required ShopForm formData,
  }) = _ShopFormWizardState;
}
