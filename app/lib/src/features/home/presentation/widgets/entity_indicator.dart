import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/themes/theme_helpers.dart';
import 'package:flutter/material.dart';

class OpenIndicator extends StatelessWidget {
  const OpenIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: ThemeHelpers.borderRadiusAllRounded(),
      ),
      child: Row(
        spacing: Sizes.p4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              Icons.circle,
              color: context.colorScheme.primary,
              size: 14,
            ),
          ),
          Flexible(
            child: Text(context.loc.open, style: context.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}

class CloseIndicator extends StatelessWidget {
  final bool allBorders;
  const CloseIndicator({super.key, this.allBorders = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: ThemeHelpers.borderRadiusAllRounded(),
      ),
      child: Row(
        spacing: Sizes.p4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              Icons.circle,
              color: context.colorScheme.error,
              size: 14,
            ),
          ),
          Flexible(
            child: Text(context.loc.close, style: context.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}

class AvailableIndicator extends StatelessWidget {
  const AvailableIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: ThemeHelpers.borderRadiusAllRounded(),
      ),
      child: Row(
        spacing: Sizes.p4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              Icons.circle,
              color: context.colorScheme.primary, // Green for available
              size: 14,
            ),
          ),
          Flexible(
            child: Text(context.loc.available, style: context.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}

class UnavailableIndicator extends StatelessWidget {
  const UnavailableIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Sizes.p4, horizontal: Sizes.p8),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: ThemeHelpers.borderRadiusAllRounded(),
      ),
      child: Row(
        spacing: Sizes.p4,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(
              Icons.circle,
              color: context.colorScheme.error, // Red for unavailable
              size: 14,
            ),
          ),
          Flexible(
            child: Text(context.loc.unavailable, style: context.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}