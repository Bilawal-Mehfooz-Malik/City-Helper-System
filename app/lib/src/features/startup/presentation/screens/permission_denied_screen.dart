import 'package:flutter/material.dart';

import '../../../../core/common_widgets/primary_button.dart';
import '../../../../core/common_widgets/responsive_scrollable.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/theme_extension.dart';
import '../../../../localization/localization_extension.dart';

class PermissionDeniedScreen extends StatelessWidget {
  const PermissionDeniedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.loc.permissionDenied)),
      body: SafeArea(
        child: ResponsiveScrollable(
          child: Column(
            children: [
              // [Headline]
              Text(
                context.loc.permissionDeniedHeadline,
                style: context.textTheme.bodyLarge,
              ),
              gapH24,

              // [Allow Permission Button]
              PrimaryButton(
                text: context.loc.allowPermission,
                onPressed: () {},
              ),
              gapH8,

              // [Exit Button]
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: context.colorScheme.error,
                ),
                onPressed: () {},
                child: Text(context.loc.exit),
              )
            ],
          ),
        ),
      ),
    );
  }
}
