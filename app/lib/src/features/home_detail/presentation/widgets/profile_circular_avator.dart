import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:app/src/features/my_shop/presentation/controllers/user_mode_controller.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileCircularAvatar extends ConsumerWidget {
  final double avatarSize;
  final double avatarIconSize;

  const ProfileCircularAvatar({
    super.key,
    this.avatarSize = 25,
    this.avatarIconSize = 15,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the provider and handle all its states (data, error, loading).
    final authState = ref.watch(authStateChangesProvider);
    return authState.when(
      data: (user) {
        // If the user is null, show the sign-in avatar and menu.
        if (user == null) {
          return _LoggedOutAvatar(
            avatarSize: avatarSize,
            avatarIconSize: avatarIconSize,
          );
        }
        // If the user is logged in, show their profile avatar and menu.
        return _LoggedInAvatar(
          avatarSize: avatarSize,
          avatarIconSize: avatarIconSize,
          userId: user.uid,
        );
      },
      loading: () => _LoadingAvatar(avatarSize: avatarSize),
      error: (e, st) =>
          _ErrorAvatar(avatarSize: avatarSize, avatarIconSize: avatarIconSize),
    );
  }
}

// A private widget for the logged-out state for better separation.
class _LoggedOutAvatar extends StatelessWidget {
  const _LoggedOutAvatar({
    required this.avatarSize,
    required this.avatarIconSize,
  });
  final double avatarSize;
  final double avatarIconSize;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (_) => context.goNamed(AppRoute.auth.name),
      itemBuilder: (context) => [
        PopupMenuItem<String>(value: 'signin', child: Text(context.loc.signIn)),
      ],
      child: SizedBox.square(
        dimension: avatarSize,
        child: CircleAvatar(child: Icon(Icons.person, size: avatarIconSize)),
      ),
    );
  }
}

// A private widget for the logged-in state.
class _LoggedInAvatar extends ConsumerWidget {
  const _LoggedInAvatar({
    required this.avatarSize,
    required this.avatarIconSize,
    required this.userId,
  });
  final double avatarSize;
  final double avatarIconSize;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch the user's profile information.
    final profileData = ref.watch(getUserByIdProvider(userId));
    final isAdminMode = ref.watch(userModeControllerProvider);

    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'account':
            context.goNamed(AppRoute.account.name);
            break;
          // FIX: Renamed 'admin' to a more generic 'switch_mode'.
          case 'switch_mode':
            // Toggle the mode via the controller.
            ref.read(userModeControllerProvider.notifier).toggleMode();
            // Navigate to the appropriate screen after switching.
            if (isAdminMode) {
              // If we WERE in admin mode, go to the user home screen.
              context.goNamed(AppRoute.category.name);
            } else {
              // If we WERE in user mode, go to the admin screen.
              context.goNamed(AppRoute.myShop.name);
            }
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          value: 'account',
          child: Text(context.loc.account_title),
        ),
        // FIX: Dynamically build the menu item based on the current mode.
        PopupMenuItem<String>(
          value: 'switch_mode',
          child: Text(
            isAdminMode
                ? "Switch to User".hardcoded
                : context.loc.switchToAdmin,
          ),
        ),
      ],
      // Also handle loading/error states for the user profile data.
      child: profileData.when(
        data: (profile) => SizedBox.square(
          dimension: avatarSize,
          child: CustomImageWrapper(
            useCircleLoading: true,
            imageUrl: profile?.profileImageUrl,
            placeholderIconSize: avatarIconSize,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        loading: () => _LoadingAvatar(avatarSize: avatarSize),
        error: (_, _) => _ErrorAvatar(
          avatarSize: avatarSize,
          avatarIconSize: avatarIconSize,
        ),
      ),
    );
  }
}

// A simple loading state widget for the avatar.
class _LoadingAvatar extends StatelessWidget {
  const _LoadingAvatar({required this.avatarSize});
  final double avatarSize;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: true, child: Bone.circle(size: avatarSize));
  }
}

// A simple error state widget for the avatar.
class _ErrorAvatar extends StatelessWidget {
  const _ErrorAvatar({required this.avatarSize, required this.avatarIconSize});
  final double avatarSize;
  final double avatarIconSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: avatarSize,
      child: CircleAvatar(child: Icon(Icons.error, size: avatarIconSize)),
    );
  }
}
