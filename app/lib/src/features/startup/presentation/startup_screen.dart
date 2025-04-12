import 'package:app/src/core/common_widgets/responsive_center.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/common_widgets/responsive_two_column_layout.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/features/startup/presentation/startup_content/get_location_content.dart';
import 'package:app/src/features/startup/presentation/startup_content/startup_content.dart';
import 'package:flutter/material.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  bool _isBottomSheetVisible = false;
  PersistentBottomSheetController? _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void dispose() {
    _controller?.close();
    super.dispose();
  }

  void _openBottomSheet() {
    if (_isBottomSheetVisible) return;

    _controller = _scaffoldKey.currentState!.showBottomSheet(
      elevation: 3,
      enableDrag: false,
      (context) => const SafeArea(
        child: ResponsiveScrollable(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.p32,
              horizontal: Sizes.p16,
            ),
            child: GetLocationContent(),
          ),
        ),
      ),
    );

    _isBottomSheetVisible = true;

    _controller?.closed.then((_) {
      _isBottomSheetVisible = false;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final width = size.width;
    final height = size.height;

    final screenType = ScreenType.determine(width: width, height: height);

    // Auto-close bottom sheet on large screens
    if (screenType == ScreenType.desktop || screenType == ScreenType.tablet) {
      if (_isBottomSheetVisible) {
        _controller?.close();
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: switch (screenType) {
          ScreenType.smallHeight => ResponsiveScrollable(
            padding: const EdgeInsets.all(Sizes.p16),
            child: StartupContent(
              isLargeScreen: false,
              onGetStarted: _openBottomSheet,
            ),
          ),
          ScreenType.mobile => Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: StartupContent(
              useSpacer: true,
              isLargeScreen: false,
              onGetStarted: _openBottomSheet,
            ),
          ),
          ScreenType.tablet => ResponsiveCenter(
            showCard: true,
            paddingInsideCard: const EdgeInsets.all(Sizes.p24),
            child: ResponsiveTwoColumnLayout(
              spacing: Sizes.p16,
              rowLayoutOnly: true,
              startContent: StartupContent(
                isLargeScreen: true,
                onGetStarted: _openBottomSheet,
              ),
              endContent: const GetLocationContent(isLargeScreen: true),
            ),
          ),
          ScreenType.desktop => ResponsiveCenter(
            showCard: true,
            paddingInsideCard: const EdgeInsets.all(Sizes.p48),
            child: ResponsiveTwoColumnLayout(
              spacing: Sizes.p32,
              rowLayoutOnly: true,
              startContent: StartupContent(
                isLargeScreen: true,
                onGetStarted: _openBottomSheet,
              ),
              endContent: const GetLocationContent(),
            ),
          ),
        },
      ),
    );
  }
}
