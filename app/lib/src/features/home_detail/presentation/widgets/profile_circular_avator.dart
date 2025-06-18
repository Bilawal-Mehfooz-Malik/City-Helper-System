import 'dart:io';

import 'package:app/src/features/auth/data/auth_repository.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileCircularAvator extends ConsumerWidget {
  const ProfileCircularAvator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;

    final hasProfileImage =
        user != null &&
        user.profileImageUrl != null &&
        user.profileImageUrl!.isNotEmpty &&
        File(user.profileImageUrl!).existsSync();

    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'signin':
            context.goNamed(AppRoute.auth.name);
            break;
          case 'profile':
            context.goNamed(AppRoute.profile.name);
            break;
          case 'admin':
            context.pushNamed(AppRoute.profile.name);
            break;
        }
      },
      itemBuilder: (context) {
        if (user == null) {
          return const [
            PopupMenuItem<String>(value: 'signin', child: Text('Sign In')),
          ];
        } else {
          return const [
            PopupMenuItem<String>(value: 'profile', child: Text('Profile')),
            PopupMenuItem<String>(
              value: 'admin',
              child: Text('Switch to Admin'),
            ),
          ];
        }
      },
      child: CircleAvatar(
        radius: 15,
        backgroundImage: hasProfileImage
            ? FileImage(File(user.profileImageUrl!))
            : null,
        child: !hasProfileImage ? const Icon(Icons.person, size: 18) : null,
      ),
    );
  }
}
