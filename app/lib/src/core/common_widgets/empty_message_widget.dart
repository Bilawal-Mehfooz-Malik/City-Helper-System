import 'package:app/src/core/common_widgets/responsive_center_beta.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable_beta.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final String? title;
  final String message;
  final IconData? icon;
  final Widget? actions;
  final bool showAppBar;
  final String? appBarTitle;
  final bool showTitle;
  final bool useResponsiveDesign;

  const MessageScreen({
    super.key,
    required this.message,
    this.title,
    this.icon,
    this.actions,
    this.showAppBar = false,
    this.appBarTitle,
    this.showTitle = true,
    this.useResponsiveDesign = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(title: appBarTitle != null ? Text(appBarTitle!) : null)
          : null,
      body: SafeArea(
        child: ResponsiveCenter(
          paddingInsideCard: const EdgeInsets.all(Sizes.p16),
          child: CenteredMessageWidget(
            useResponsiveDesign: useResponsiveDesign,
            message: message,
            title: showTitle ? title : null,
            icon: icon,
            actions: actions,
          ),
        ),
      ),
    );
  }
}

class CenteredMessageWidget extends StatelessWidget {
  const CenteredMessageWidget({
    super.key,
    required this.message,
    this.title,
    this.icon,
    this.actions,
    required this.useResponsiveDesign,
    this.padding = const EdgeInsets.all(Sizes.p16),
  });

  final String message;
  final String? title;
  final IconData? icon;
  final Widget? actions;
  final EdgeInsetsGeometry padding;
  final bool useResponsiveDesign;

  @override
  Widget build(BuildContext context) {
    if (isSmallHeightScreen(context) && useResponsiveDesign) {
      return ResponsiveScrollable(
        padding: padding,
        child: MessageContent(
          icon: icon,
          title: title,
          message: message,
          actions: actions,
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Center(
          child: MessageContent(
            icon: icon,
            title: title,
            message: message,
            actions: actions,
          ),
        ),
      );
    }
  }
}

class MessageContent extends StatelessWidget {
  const MessageContent({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.actions,
  });

  final IconData? icon;
  final String? title;
  final String message;
  final Widget? actions;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 80, color: context.colorScheme.error),
          gapH32,
        ],
        if (title != null) ...[
          Text(
            title!,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          gapH12,
        ],
        Text(
          message,
          style: context.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        if (actions != null) ...[gapH32, actions!],
      ],
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget(this.message, {super.key});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: context.textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
