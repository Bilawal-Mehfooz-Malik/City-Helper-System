import 'dart:io' show File;

import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/default_location_provider.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/features/startup/presentation/widgets/google_map_widget.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    final defaultLocation = ref.read(defaultLocationProvider);
    final latLng = user?.lastLocation ?? defaultLocation;

    final hasProfileImage =
        user != null &&
        user.profileImageUrl != null &&
        user.profileImageUrl!.isNotEmpty;

    ImageProvider? imageProvider;
    if (hasProfileImage) {
      if (kIsWeb) {
        imageProvider = NetworkImage(user.profileImageUrl!);
      } else {
        imageProvider = FileImage(File(user.profileImageUrl!));
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(context.loc.account_title)),
      body: user == null
          ? const SizedBox.shrink()
          : SafeArea(
              child: ResponsiveScrollable(
                padding: const EdgeInsets.all(Sizes.p16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: imageProvider,
                      child: imageProvider == null
                          ? const Icon(Icons.person, size: 80)
                          : null,
                    ),

                    gapH16,

                    // Name & Phone
                    Text(
                      user.name,
                      style: context.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    gapH8,
                    Text(
                      user.phoneNumber,
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
                      child: GoogleMapWidget(latLng: latLng),
                    ),

                    gapH24,

                    // Edit Button
                    PrimaryButton(
                      useMaxSize: true,
                      text: context.loc.account_editProfile,
                      onPressed: () => context.pushNamed(AppRoute.profile.name),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
