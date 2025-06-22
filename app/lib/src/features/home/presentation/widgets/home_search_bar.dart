import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/presentation/selected_category_view_controller.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
import 'package:app/src/features/home/presentation/controllers/entity_search_query_notifier.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home_detail/presentation/controllers/entity_id_controller.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeSearchBar extends ConsumerStatefulWidget {
  const HomeSearchBar({
    super.key,
    required this.showBackButton,
    required this.categoryId,
  });

  final CategoryId categoryId;
  final bool showBackButton;

  @override
  ConsumerState<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends ConsumerState<HomeSearchBar> {
  late final SearchController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SearchController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goToDetails(BuildContext context, WidgetRef ref, Entity entity) {
    FocusScope.of(context).unfocus();
    final screenSize = MediaQuery.sizeOf(context);
    final screenType = ScreenType.determine(
      width: screenSize.width,
      height: screenSize.height,
    );

    if (screenType == ScreenType.tablet || screenType == ScreenType.desktop) {
      ref
          .read(entitySearchQueryNotifierProvider.notifier)
          .setQuery(entity.name);
      ref.read(entityIdControllerProvider.notifier).updateEntityId(entity.id);
      ref
          .read(selectedCategoryViewControllerProvider.notifier)
          .setSelectedCategoryView(SelectedCategoryView.detail);
    } else {
      if (_controller.isAttached) {
        _controller.closeView(entity.name);
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ref
            .read(entitySearchQueryNotifierProvider.notifier)
            .setQuery(entity.name);
        ref.read(entityIdControllerProvider.notifier).updateEntityId(entity.id);
        context.goNamed(
          AppRoute.homeDetail.name,
          pathParameters: {
            'categoryId': entity.categoryId.toString(),
            'entityId': entity.id,
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: SearchAnchor.bar(
          searchController: _controller,
          barHintText: context.loc.search,
          onChanged: (value) => setState(() {}),
          barElevation: const WidgetStatePropertyAll(2),
          barLeading: widget.showBackButton
              ? const BackButton()
              : const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(Icons.search),
                ),
          barTrailing: _controller.text.isNotEmpty
              ? [
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                      setState(() {});
                    },
                  ),
                ]
              : null,
          suggestionsBuilder: (context, controller) {
            final query = controller.text.trim().toLowerCase();

            if (query.isEmpty) {
              return [
                SuggestionBuilderMessage(
                  icon: Icons.info_outline,
                  message: context.loc.typeToSeeSuggestion,
                ),
              ];
            }

            final subCategory = ref.watch(subcategoryControllerProvider);
            final asyncEntities = ref.watch(
              watchEntitiesProvider(widget.categoryId, subCategory),
            );

            return asyncEntities.when(
              data: (entities) {
                final matches = entities
                    .where((e) => e.name.toLowerCase().contains(query))
                    .take(5)
                    .toList();

                if (matches.isEmpty) {
                  return [
                    SuggestionBuilderMessage(
                      icon: Icons.search_off,
                      message: context.loc.noResultFound,
                    ),
                  ];
                }

                return matches.map((entity) {
                  return InkWell(
                    onTap: () => _goToDetails(context, ref, entity),
                    child: SearchSuggestionListTile(entity: entity),
                  );
                }).toList();
              },
              loading: () => [],
              error: (e, _) => [
                SuggestionBuilderMessage(
                  icon: Icons.error,
                  message: '${context.loc.error} $e',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SearchSuggestionListTile extends StatelessWidget {
  final Entity entity;
  const SearchSuggestionListTile({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p16,
        vertical: Sizes.p12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(entity.name, style: context.textTheme.bodyLarge),
          const SizedBox(height: Sizes.p4),
          Text(
            '${context.loc.sector} ${entity.sectorName}, ${entity.cityName}',
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class SuggestionBuilderMessage extends StatelessWidget {
  const SuggestionBuilderMessage({
    super.key,
    required this.message,
    required this.icon,
  });

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(width: Sizes.p8),
          Text(message, style: context.textTheme.bodyMedium),
        ],
      ),
    );
  }
}
