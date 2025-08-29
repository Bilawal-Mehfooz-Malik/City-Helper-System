import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    var newText = '';

    if (text.isNotEmpty) {
      newText += text.substring(0, text.length > 3 ? 3 : text.length);
    }
    if (text.length > 3) {
      newText += ' ';
      newText += text.substring(3, text.length > 10 ? 10 : text.length);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
