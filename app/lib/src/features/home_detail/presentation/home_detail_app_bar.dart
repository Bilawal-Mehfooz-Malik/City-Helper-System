import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_view_controller.dart';
import 'package:app/src/features/home_detail/application/entity_detail_service.dart';
import 'package:app/src/features/home_detail/presentation/controllers/popular_detail_view_controller.dart';
import 'package:app/src/localization/localization_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeDetailAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final bool isPushed;
  final EntityId entityId;
  final CategoryId categoryId;

  const HomeDetailAppBar({
    super.key,
    required this.entityId,
    required this.categoryId,
    required this.isPushed,
  });

  void _onPressed(WidgetRef ref) {
    final isPopularDetail = ref.read(popularDetailViewControllerProvider);
    if (isPopularDetail == true) {
      ref
          .read(selectedCategoryViewControllerProvider.notifier)
          .setSelectedCategoryView(SelectedCategoryView.popular);
    } else if (isPopularDetail == false) {
      ref
          .read(selectedCategoryViewControllerProvider.notifier)
          .setSelectedCategoryView(SelectedCategoryView.home);
    }

    ref
        .read(popularDetailViewControllerProvider.notifier)
        .setPopularView(false);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entityAsyncValue = ref.watch(
      fetchEntityDetailsProvider(categoryId, entityId),
    );

    return AppBar(
      leading: isPushed ? null : BackButton(onPressed: () => _onPressed(ref)),
      title: AsyncValueWidget(
        value: entityAsyncValue,
        error: (_, _) => Text(context.loc.error),
        loading: Skeletonizer(
          enabled: true,
          child: AppBarContent(name: BoneMock.title),
        ),
        data: (entity) => AppBarContent(
          name: entity?.name,
          isPopular: entity?.isPopular ?? false,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppBarContent extends StatelessWidget {
  final String? name;
  final bool isPopular; // New parameter
  const AppBarContent({
    super.key,
    required this.name,
    this.isPopular = false,
  }); // Initialize new parameter

  @override
  Widget build(BuildContext context) {
    return Row(
      // Use Row to place icon next to text
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: Text(name ?? context.loc.somethingWentWrong, overflow: TextOverflow.ellipsis)),
        if (isPopular) ...[
          // Conditionally display icon
          gapW4,
          Icon(Icons.local_fire_department, color: Theme.of(context).colorScheme.tertiary, size: 25),
        ],
      ],
    );
  }
}
