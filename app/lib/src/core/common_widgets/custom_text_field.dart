import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.onchanged,
    this.focusNode,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool enabled;
  final ValueChanged<String>? onchanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      enabled: enabled,
      onChanged: onchanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
