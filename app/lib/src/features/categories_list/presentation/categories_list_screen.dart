import 'package:app/src/core/utils/screen_utils.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/presentation/responsive/large_screen_content.dart';
import 'package:app/src/features/categories_list/presentation/responsive/small_screen_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesListScreen extends ConsumerWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSmall = isMobileScreen(context);
    final categoriesValue = ref.watch(categoriesListFutureProvider);

    return SafeArea(
      child: isSmall
          ? SmallScreenContent(categoriesValue: categoriesValue)
          : LargeScreenContent(categoriesValue: categoriesValue),
    );
  }
}
