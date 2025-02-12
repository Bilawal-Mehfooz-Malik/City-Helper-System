import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/data/connectivity_controller.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/presentation/categories_grid.dart';
import 'package:app/src/features/categories_list/presentation/category_card.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories'.hardcoded)),
      body: Consumer(
        builder: (context, ref, child) {
          // Listen for connectivity changes,  When the connection is restored, refresh the categories stream.
          ref.listen<bool>(connectivityControllerProvider, (_, isConnected) {
            if (isConnected) {
              ref.invalidate(categoriesListStreamProvider);
            }
          });

          final categoriesListValue = ref.watch(categoriesListStreamProvider);

          return AsyncValueWidget(
            value: categoriesListValue,
            data: (categories) => CategoriesGrid(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(category: category);
              },
            ),
          );
        },
      ),
    );
  }
}
