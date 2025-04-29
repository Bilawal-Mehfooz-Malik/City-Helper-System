import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/section_header.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/application/entity_service.dart';
import 'package:app/src/features/home/domain/categories/entity.dart';
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
    final popularEntitiesListValue = ref.watch(
      WatchPopularEntitiesProvider(categoryId, subCategory),
    );

    return AsyncValueWidget<List<Entity>>(
      value: popularEntitiesListValue,
      loading: const PopularEntitesSkeletonList(),
      error: (_, __) => const SizedBox.shrink(),
      data: (entities) {
        if (entities.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          spacing: Sizes.p4,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(
              height: entities is List<Residence> ? 300 : 275,
              child: ListView.builder(
                itemExtent: 280,
                shrinkWrap: true,
                itemCount: entities.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: Sizes.p16),
                itemBuilder: (_, index) {
                  return Card(
                    margin: EdgeInsets.only(
                      right: Sizes.p8,
                      top: Sizes.p4,
                      bottom: Sizes.p4,
                    ),
                    child: EntityCard(
                      entity: entities[index],
                      allBorders: false,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
