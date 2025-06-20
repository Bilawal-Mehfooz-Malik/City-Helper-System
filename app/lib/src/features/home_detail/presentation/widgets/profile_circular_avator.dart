import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
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

    final profileUrl = user?.profileImageUrl;
    final hasImage = profileUrl != null && profileUrl.isNotEmpty;

    ImageProvider? imageProvider;
    if (hasImage) {
      if (kIsWeb) {
        // On web, assume the profileImageUrl is a blob URL or base64 image
        imageProvider = NetworkImage(profileUrl);
      } else {
        // On mobile, assume it's a file path
        imageProvider = FileImage(File(profileUrl));
      }
    }

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
      child: CircleAvatar(
        radius: 15,
        backgroundImage: imageProvider,
        child: imageProvider == null
            ? const Icon(Icons.person, size: 18)
            : null,
      ),
    );
  }
}
