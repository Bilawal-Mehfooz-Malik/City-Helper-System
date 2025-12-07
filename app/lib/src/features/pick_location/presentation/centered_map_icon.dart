import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class CenteredIcon extends StatelessWidget {
  const CenteredIcon({super.key, this.iconSize = 40});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -(iconSize / 2)),
        child: Icon(
          Icons.location_on,
          size: iconSize,
          color: context.colorScheme.error,
        ),
      ),
    );
  }
}
