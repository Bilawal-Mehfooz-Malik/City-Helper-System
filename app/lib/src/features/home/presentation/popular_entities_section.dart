import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:app/src/features/home/presentation/controllers/subcategory_controller.dart';
import 'package:app/src/features/home/presentation/home_skeletons.dart';
import 'package:app/src/features/home/presentation/widgets/entity_card.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopularEnitiesSection extends ConsumerWidget {
  final CategoryId categoryId;
  const PopularEnitiesSection({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subCategory = ref.watch(subcategoryControllerProvider);
    final entitiesListValue = ref.watch(
      WatchPopularEntitiesProvider(categoryId, subCategory),
    );

    // Show skeleton while loading
    if (entitiesListValue.isLoading) {
      return const PopularEntitesSkeletonList();
    }

    // Extract the data from the AsyncValue
    final entities = entitiesListValue.value;

    // Return an empty widget if there are no entities
    if (entities == null || entities.isEmpty) {
      return const SizedBox.shrink();
    }

    // Show the list of entities
    return Column(
      spacing: Sizes.p4,
      children: [
        SectionHeader(
          startWidget: Text(
            context.loc.popular,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          endWidget: Text(
            context.loc.seeAll,
            style: context.textTheme.bodyLarge,
          ),
        ),
        // TODO: Remove it
        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: IntrinsicHeight(
        //     child: Row(
        //       children: List.generate(entities.length, (index) {
        //         return Padding(
        //           padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
        //           child: Card(child: EntityCard(entity: entities[index])),
        //         );
        //       }),
        //     ),
        //   ),
        // ),
        SizedBox(
          height: entities is List<Residence> ? 300 : 275,
          child: ListView.builder(
            itemExtent: 280,
            shrinkWrap: true,
            itemCount: entities.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
            itemBuilder: (_, index) {
              return Card(child: EntityCard(entity: entities[index]));
            },
          ),
        ),
      ],
    );
  }
}
