import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class CarouselButton extends StatelessWidget {
  const CarouselButton({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: context.colorScheme.onSurface),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: context.colorScheme.surface.withAlpha(140),
      ),
    );
  }
}
