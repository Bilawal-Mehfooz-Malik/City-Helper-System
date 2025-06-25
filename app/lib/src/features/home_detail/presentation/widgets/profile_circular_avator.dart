import 'package:app/src/core/common_widgets/custom_image.dart';
import 'package:app/src/features/auth/data/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';

class ProfileCircularAvator extends ConsumerWidget {
  const ProfileCircularAvator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;

    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'signin':
            context.goNamed(AppRoute.auth.name);
            break;
          case 'account':
            context.goNamed(AppRoute.account.name);
            break;
          case 'admin':
            context.pushNamed(AppRoute.profile.name);
            break;
        }
      },
      itemBuilder: (context) {
        if (user == null) {
          return [
            PopupMenuItem<String>(
              value: 'signin',
              child: Text(context.loc.signIn),
            ),
          ];
        } else {
          return [
            PopupMenuItem<String>(
              value: 'account',
              child: Text(context.loc.account_title),
            ),
            PopupMenuItem<String>(
              value: 'admin',
              child: Text(context.loc.switchToAdmin),
            ),
          ];
        }
      },
      child: user == null
          ? SizedBox(
              width: 30,
              height: 30,
              child: const CircleAvatar(child: Icon(Icons.person, size: 20)),
            )
          : Builder(
              builder: (context) {
                final profile = ref.watch(getUserByIdProvider(user.uid)).value;
                final profileUrl = profile?.profileImageUrl;

                return SizedBox(
                  width: 30,
                  height: 30,
                  child: CustomImage(
                    imageUrl: profileUrl,
                    fit: BoxFit.cover,
                    iconPersonSize: 20,
                    useAspectRatio: false,
                    borderRadius: BorderRadius.circular(50),
                  ),
                );
              },
            ),
    );
  }
}
