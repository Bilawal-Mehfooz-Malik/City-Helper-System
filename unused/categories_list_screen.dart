// import 'package:app/src/core/common_widgets/async_value_widget.dart';
// import 'package:app/src/core/constants/app_sizes.dart';
// import 'package:app/src/core/data/connectivity_controller.dart';
// import 'package:app/src/core/models/my_data_types.dart';
// import 'package:app/src/core/utils/theme_extension.dart';
// import 'package:app/src/features/categories_list/data/categories_repository.dart';
// import 'package:app/src/features/categories_list/domain/categories_exception.dart';
// import 'package:app/src/features/categories_list/presentation/grid_layout.dart';
// import 'package:app/src/features/categories_list/presentation/category_card.dart';
// import 'package:app/src/localization/string_hardcoded.dart';
// import 'package:app/src/routers/app_router.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// const kCategoriesListScreen = Key('categories-list-screen-key');

// class CategoriesListScreen extends StatelessWidget {
//   const CategoriesListScreen({super.key});

//   Future<void> _onRefresh(WidgetRef ref) async {
//     ref.invalidate(categoriesListFutureProvider);
//   }

//   void _onTap(BuildContext context, CategoryId id) {
//     context.goNamed(
//       AppRoute.home.name,
//       pathParameters: {'categoryId': id.toString()},
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: kCategoriesListScreen,
//       appBar: AppBar(
//         title: Text('Categories'.hardcoded),
//         backgroundColor: context.colorScheme.surfaceContainerLow,
//       ),
//       body: SafeArea(
//         child: Consumer(
//           builder: (context, ref, child) {
//             // Listen for connectivity changes,  When the connection is restored, refresh the categories stream.
//             ref.listen<bool>(connectivityControllerProvider, (_, isConnected) {
//               if (isConnected) {
//                 ref.invalidate(categoriesListFutureProvider);
//               }
//             });

//             final categoriesListValue = ref.watch(categoriesListFutureProvider);

//             return AsyncValueWidget(
//               value: categoriesListValue,
//               // TODO: Remove Refresh Indicator
//               data:
//                   (categories) => RefreshIndicator(
//                     onRefresh: () => _onRefresh(ref),
//                     child: Padding(
//                       padding: const EdgeInsets.all(Sizes.p12),
//                       child: GridLayout(
//                         itemCount: categories.length,
//                         emptyMessage: NoCategoryFoundException().message,
//                         itemBuilder: (context, index) {
//                           final category = categories[index];
//                           return CategoryCard(
//                             category: category,
//                             onTap: () => _onTap(context, category.id),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
