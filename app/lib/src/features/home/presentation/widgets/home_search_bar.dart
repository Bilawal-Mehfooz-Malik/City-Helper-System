import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/constants/breakpoints.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/categories_list/presentation/controllers/selected_category_view_controller.dart';
import 'package:app/src/features/home/domain/search_entitiy.dart';
import 'package:app/src/features/home/presentation/controllers/entity_search_query_notifier.dart';
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

  void _goToDetails(BuildContext context, WidgetRef ref, SearchEntity entity) {
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
            'categoryId': widget.categoryId.toString(),
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
          onChanged: (value) {
            ref
                .read(entitySearchQueryNotifierProvider.notifier)
                .setQuery(value);
            debugPrint('Query from onChanged: $value');
          },
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
                      ref
                          .read(entitySearchQueryNotifierProvider.notifier)
                          .setQuery('');
                      setState(() {});
                    },
                  ),
                ]
              : null,
          suggestionsBuilder: (context, controller) {
            final currentText = controller.text.trim();
            final query = ref.watch(entitySearchQueryNotifierProvider);

            return [
              _SearchSuggestions(
                categoryId: widget.categoryId,
                currentText: currentText,
                debouncedQuery: query,
                onSelect: (entity) => _goToDetails(context, ref, entity),
              ),
            ];
          },
        ),
      ),
    );
  }
}

class _SearchSuggestions extends ConsumerWidget {
  const _SearchSuggestions({
    required this.categoryId,
    required this.currentText,
    required this.debouncedQuery,
    required this.onSelect,
  });

  final CategoryId categoryId;
  final String currentText;
  final String debouncedQuery;
  final void Function(SearchEntity) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use immediate input for UI feedback
    if (currentText.isEmpty) {
      return _SuggestionBuilderMessage(
        icon: Icons.info_outline,
        message: context.loc.typeToSeeSuggestion,
      );
    }

    // Show loading if debounce hasn't completed
    if (currentText != debouncedQuery) {
      return _SuggestionBuilderMessage(
        icon: Icons.hourglass_empty,
        message: 'Loading...',
      );
    }

    // Fetch results using DEBOUNCED query
    final asyncResults = ref.watch(entitySearchResultsProvider(categoryId));

    return asyncResults.when(
      data: (results) =>
          _SearchSuggestionListView(results: results, onSelect: onSelect),
      loading: () => _SuggestionBuilderMessage(
        icon: Icons.hourglass_empty,
        message: 'Loading...',
      ),
      error: (e, _) => _SuggestionBuilderMessage(
        icon: Icons.error,
        message: '${context.loc.error} $e',
      ),
    );
  }
}

class _SearchSuggestionListView extends StatelessWidget {
  const _SearchSuggestionListView({
    required this.results,
    required this.onSelect,
  });

  final List<SearchEntity> results;
  final void Function(SearchEntity) onSelect;

  @override
  Widget build(BuildContext context) {
    final matches = results.take(5).toList();

    if (matches.isEmpty) {
      return _SuggestionBuilderMessage(
        icon: Icons.search_off,
        message: context.loc.noResultFound,
      );
    }
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: matches.map((entity) {
        return InkWell(
          onTap: () => onSelect(entity),
          child: _SearchSuggestionListTile(entity: entity),
        );
      }).toList(),
    );
  }
}

class _SearchSuggestionListTile extends StatelessWidget {
  const _SearchSuggestionListTile({required this.entity});

  final SearchEntity entity;

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

class _SuggestionBuilderMessage extends StatelessWidget {
  const _SuggestionBuilderMessage({required this.message, required this.icon});

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
