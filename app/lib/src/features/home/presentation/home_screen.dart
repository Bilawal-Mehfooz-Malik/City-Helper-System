import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/features/home/application/entities_notifier.dart';
import 'package:app/src/features/home/application/popular_entities_notifier.dart';
import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/data/real/ads_carousel_repository.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/presentation/controllers/home_error_controller.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/entities_list_section.dart';
import 'package:app/src/features/home/presentation/carousel_ads_list.dart';
import 'package:app/src/features/home/presentation/sub_categories_list.dart';
import 'package:app/src/features/home/presentation/popular_entities_section.dart';
import 'package:app/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:app/src/features/home/presentation/widgets/persistent_error_bar.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final bool showBackButton;
  final CategoryId categoryId;
  const HomeScreen({
    super.key,
    required this.categoryId,
    this.showBackButton = true,
  });

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      ref
          .read(entitiesNotifierProvider(widget.categoryId).notifier)
          .fetchNextPage();
    }
  }

  Future<void> _onRefresh(WidgetRef ref) async {
    ref.invalidate(subcategoryControllerProvider);
    ref.invalidate(popularEntitiesNotifierProvider(widget.categoryId));
    ref.invalidate(entitiesNotifierProvider(widget.categoryId));

    await Future.wait([
      ref.refresh(subCategoriesListStreamProvider(widget.categoryId).future),
      ref.refresh(adsListFutureProvider(widget.categoryId).future),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final criticalError = ref.watch(
      criticalErrorStatusProvider(categoryId: widget.categoryId),
    );
    final nonCriticalErrors = ref.watch(
      nonCriticalErrorsProvider(categoryId: widget.categoryId),
    );

    return Scaffold(
      body: SafeArea(
        child: criticalError != null
            ? CenteredMessageWidget(
                useResponsiveDesign: true,
                message: context.loc.somethingWentWrongTryAgain,
                actions: PrimaryButton(
                  text: context.loc.refresh,
                  onPressed: () => _onRefresh(ref),
                ),
              )
            : Stack(
                children: [
                  RefreshIndicator(
                    onRefresh: () => _onRefresh(ref),
                    child: CustomScrollView(
                      controller: _scrollController,
                      slivers: [
                        SliverAppBar(
                          snap: true,
                          elevation: 0,
                          floating: true,
                          titleSpacing: 0,
                          forceElevated: false,
                          automaticallyImplyLeading: false,
                          toolbarHeight: kToolbarHeight + Sizes.p12,
                          surfaceTintColor:
                              context.theme.scaffoldBackgroundColor,
                          backgroundColor:
                              context.theme.scaffoldBackgroundColor,
                          title: HomeSearchBar(
                            showBackButton: widget.showBackButton,
                            categoryId: widget.categoryId,
                          ),
                        ),
                        sliverGapH8,
                        SliverToBoxAdapter(
                          child: SubCategoriesList(
                            categoryId: widget.categoryId,
                          ),
                        ),
                        sliverGapH8,
                        SliverToBoxAdapter(
                          child: CarouselAdsList(categoryId: widget.categoryId),
                        ),
                        SliverToBoxAdapter(
                          child: PopularEnitiesSection(
                            categoryId: widget.categoryId,
                          ),
                        ),
                        sliverGapH8,
                        SliverToBoxAdapter(
                          child: EntitiesListSection(
                            categoryId: widget.categoryId,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (nonCriticalErrors.isNotEmpty)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: PersistentErrorBar(
                        message: nonCriticalErrors.first,
                        onRetry: () => _onRefresh(ref),
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
