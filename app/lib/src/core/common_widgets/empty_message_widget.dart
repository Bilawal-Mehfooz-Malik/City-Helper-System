import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final bool showTitle;
  final bool showIcon;
  final String message;
  const MessageScreen({
    super.key,
    this.title,
    this.icon,
    this.showTitle = true,
    this.showIcon = false,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showIcon) ...[
                Icon(
                  icon ?? Icons.error_outline,
                  size: 80,
                  color: context.colorScheme.error,
                ),
                gapH24,
              ],
              if (showTitle) ...[
                Text(
                  title ?? 'Oops! something went wrong'.hardcoded,
                  style: context.textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                gapH24,
              ],
              Text(
                message,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CenteredMessageWidget extends StatelessWidget {
  const CenteredMessageWidget(this.message, {super.key});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(child: MessageWidget(message));
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
