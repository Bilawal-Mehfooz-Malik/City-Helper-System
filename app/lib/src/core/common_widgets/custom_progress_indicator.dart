import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key, this.size = 30, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CenteredCircularProgressIndicator(size: size, color: color),
      ),
    );
  }
}

class CenteredCircularProgressIndicator extends StatelessWidget {
  const CenteredCircularProgressIndicator({
    super.key,
    this.size = 30,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomCircularProgressIndicator(size: size, color: color),
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
    this.size = 30,
    this.color,
    this.strokeWidth,
  });

  final double size;
  final Color? color;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(color: color, strokeWidth: strokeWidth),
    );
  }
}
