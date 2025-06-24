import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/core/common_widgets/custom_outlined_button.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:app/src/features/startup/presentation/controllers/user_location_controller.dart';
import 'package:app/src/features/startup/presentation/widgets/google_map_widget.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  void _logout(BuildContext context, WidgetRef ref) async {
    final logout = await showAlertDialog(
      context: context,
      title: context.loc.areYouSure,
      cancelActionText: context.loc.cancel,
      defaultActionText: context.loc.logout,
    );
    if (logout == true) {
      ref.read(authControllerProvider.notifier).signOut();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    if (user == null) return const SizedBox.shrink();

    final userProfile = ref.watch(getUserByIdProvider(user.uid));
    final userLocation = ref.watch(userLocationControllerProvider).value;
    final defaultLocation = ref.watch(defaultLocationProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.account_title)),
      body: AsyncValueWidget(
        value: userProfile,
        data: (profile) {
          if (profile == null) return const SizedBox.shrink();

          final location =
              profile.lastLocation ?? userLocation ?? defaultLocation;

          return SafeArea(
            child: ResponsiveScrollable(
              maxContentWidth: Breakpoint.tablet,
              padding: const EdgeInsets.all(Sizes.p16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile Image
                  SizedBox(
                    width: 96,
                    height: 96,
                    child: ClipOval(
                      child: CustomImage(
                        imageUrl: profile.profileImageUrl,
                        useAspectRatio: false,
                        fit: BoxFit.cover,
                        borderRadius: BorderRadius.circular(48),
                      ),
                    ),
                  ),
                  gapH16,

                  // Name & Phone
                  Text(
                    profile.name,
                    style: context.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  gapH8,
                  Text(
                    profile.phoneNumber,
                    style: TextStyle(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),

                  gapH24,

                  // Map Heading
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      context.loc.account_yourLocation,
                      style: context.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  gapH8,

                  // Google Map
                  SizedBox(
                    height: 250,
                    child: GoogleMapWidget(latLng: location),
                  ),

                  gapH24,

                  // Edit Button
                  PrimaryButton(
                    useMaxSize: true,
                    text: context.loc.account_editProfile,
                    onPressed: () => context.pushNamed(AppRoute.profile.name),
                  ),

                  gapH8,
                  CustomOutlinedButton(
                    useMaxSize: true,
                    text: context.loc.logout,
                    onPressed: () => _logout(context, ref),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
