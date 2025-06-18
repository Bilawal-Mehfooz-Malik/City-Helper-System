import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.enabled = true,
    this.onchanged,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool enabled;
  final ValueChanged<String>? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
