import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class PhoneAvatar extends StatelessWidget {
  const PhoneAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: context.colorScheme.primary,
      child: Icon(
        Icons.smartphone,
        color: context.colorScheme.onPrimary,
        size: 30,
      ),
    );
  }
}
