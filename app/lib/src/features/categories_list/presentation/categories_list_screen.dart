import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/is_small_screen.dart.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/presentation/widgets/large_screen_content.dart';
import 'package:app/src/features/categories_list/presentation/widgets/small_screen_content.dart';
import 'package:app/src/features/home_detail/presentation/widgets/profile_circular_avator.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesListScreen extends ConsumerWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmall = isSmallScreen(context);
    final categoriesValue = ref.watch(categoriesListStreamProvider);

    return Scaffold(
      appBar: isSmall ? const _CategoriesAppBar() : null,
      body: SafeArea(
        child: isSmall
            ? SmallScreenContent(categoriesValue: categoriesValue)
            : LargeScreenContent(categoriesValue: categoriesValue),
      ),
    );
  }
}

class _CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CategoriesAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(context.loc.categories),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: Sizes.p12),
          child: ProfileCircularAvatar(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
