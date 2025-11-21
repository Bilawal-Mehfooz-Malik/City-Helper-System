import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const VectorGraphic(
        loader: AssetBytesLoader('assets/logo/app_logo.svg.vec'),
      ),
    );
  }
}
