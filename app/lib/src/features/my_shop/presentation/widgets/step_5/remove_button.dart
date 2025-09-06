import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RemoveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: const BoxConstraints(),
      padding: const EdgeInsets.all(Sizes.p4),
      icon: CircleAvatar(
        radius: 20,
        backgroundColor: context.colorScheme.surface.withAlpha(204),
        child: Icon(Icons.close, color: context.colorScheme.error, size: 22),
      ),
      onPressed: onPressed,
    );
  }
}
