import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/data/connectivity_controller.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/presentation/categories_grid.dart';
import 'package:app/src/features/categories_list/presentation/category_card.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kCategoriesListScreen = Key('categories-list-screen-key');

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  Future<void> _onRefresh(WidgetRef ref) async {
    ref.invalidate(categoriesListFutureProvider);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: kCategoriesListScreen,
      appBar: AppBar(
        title: Text('Categories'.hardcoded),
        backgroundColor: context.colorScheme.surfaceContainerLow,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          // Listen for connectivity changes,  When the connection is restored, refresh the categories stream.
          ref.listen<bool>(connectivityControllerProvider, (_, isConnected) {
            if (isConnected) {
              ref.invalidate(categoriesListFutureProvider);
            }
          });

          final categoriesListValue = ref.watch(categoriesListFutureProvider);

          return AsyncValueWidget(
            value: categoriesListValue,
            data:
                (categories) => RefreshIndicator(
                  onRefresh: () => _onRefresh(ref),
                  child: CategoriesGrid(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return CategoryCard(category: category);
                    },
                  ),
                ),
          );
        },
      ),
    );
  }
}
