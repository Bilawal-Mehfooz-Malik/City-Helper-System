import 'package:app/src/core/common_widgets/empty_message_widget.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/presentation/controllers/combined_error_controller.dart';
import 'package:app/src/features/home/presentation/entities_list_section.dart';
import 'package:app/src/features/home/presentation/carousel_ads_list.dart';
import 'package:app/src/features/home/presentation/sub_categories_list.dart';
import 'package:app/src/features/home/presentation/popular_entities_section.dart';
import 'package:app/src/features/home/presentation/widgets/home_search_bar.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  final bool showBackButton;
  final CategoryId categoryId;
  const HomeScreen({
    super.key,
    required this.categoryId,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final error = ref.watch(
      combinedErrorStatusProvider(categoryId: categoryId),
    );

    return Scaffold(
      body: SafeArea(
        child: error != null
            ? CenteredMessageWidget(
                message: context.loc.somethingWentWrongTryAgain,
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    snap: true,
                    elevation: 0,
                    floating: true,
                    titleSpacing: 0,
                    forceElevated: false,
                    automaticallyImplyLeading: false,
                    toolbarHeight: kToolbarHeight + Sizes.p12,
                    surfaceTintColor: context.theme.scaffoldBackgroundColor,
                    backgroundColor: context.theme.scaffoldBackgroundColor,
                    title: HomeSearchBar(
                      showBackButton: showBackButton,
                      categoryId: categoryId,
                    ),
                  ),
                  sliverGapH8,
                  SliverToBoxAdapter(
                    child: SubCategoriesList(categoryId: categoryId),
                  ),
                  sliverGapH8,
                  SliverToBoxAdapter(
                    child: CarouselAdsList(categoryId: categoryId),
                  ),
                  SliverToBoxAdapter(
                    child: PopularEnitiesSection(categoryId: categoryId),
                  ),
                  sliverGapH8,
                  SliverToBoxAdapter(
                    child: EntitiesListSection(categoryId: categoryId),
                  ),
                ],
              ),
      ),
    );
  }
}
