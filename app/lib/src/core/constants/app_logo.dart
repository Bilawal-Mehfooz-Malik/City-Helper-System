import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.height, required this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    const logoPath = 'assets/logo/app_logo.svg';
    return SizedBox(
      height: height,
      width: width,
      child: SvgPicture.asset(
        logoPath,
        placeholderBuilder: (context) {
          return Skeletonizer(
            enabled: true,
            child: SizedBox(height: height, width: width),
          );
        },
      ),
    );
  }
}
