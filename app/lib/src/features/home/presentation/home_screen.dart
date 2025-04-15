import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/presentation/entities_list_section.dart';
import 'package:app/src/features/home/presentation/carousel_ads_list.dart';
import 'package:app/src/features/home/presentation/sub_categories_list.dart';
import 'package:app/src/features/home/presentation/popular_entities_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final CategoryId categoryId;
  const HomeScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HomeSearchBar()),
            sliverGapH8,
            SliverToBoxAdapter(
              child: SubCategoriesList(categoryId: categoryId),
            ),
            sliverGapH8,
            SliverToBoxAdapter(child: CarouselAdsList(categoryId: categoryId)),
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

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.p16, vertical: Sizes.p4),
      child: SearchBar(
        leading: BackButton(),
        elevation: WidgetStatePropertyAll(2),
        hintText: 'Search...'.hardcoded,
      ),
    );
  }
}
