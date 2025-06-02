import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/utils/currency_formatter.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:app/src/features/home_detail/presentation/widgets/outlined_contact_button.dart';
import 'package:app/src/features/home_detail/presentation/widgets/primary_contact_button.dart';
import 'package:app/src/localization/localization_extension.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EntityDetailContent extends ConsumerWidget {
  final EntityDetail entity;

  const EntityDetailContent({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isResidence = entity is ResidenceDetail;
    final residence = isResidence ? entity as ResidenceDetail : null;
    final formattedPrice = residence != null
        ? ref.watch(currencyFormatterProvider).format(residence.price)
        : null;

    return Card(
      elevation: 4,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: Sizes.p32,
              left: Sizes.p16,
              right: Sizes.p16,
              bottom: Sizes.p16,
            ),
            child: Column(
              spacing: Sizes.p12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (formattedPrice != null)
                  Text(
                    '${context.loc.startsFrom} $formattedPrice',
                    style: context.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                LocationRow(entity: entity),
                RatingWidget(entity: entity),
                if (residence != null) FurnishedInfo(residence: residence),

                Text(
                  context.loc.contactOptions,
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const ContactOptionsRow(),
              ],
            ),
          ),
          Positioned(
            right: Sizes.p4,
            top: Sizes.p4,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.p16,
                vertical: Sizes.p4,
              ),
              decoration: BoxDecoration(
                color: Colors.amber.shade300,
                borderRadius: BorderRadius.circular(Sizes.p16),
              ),
              child: Text(context.loc.popular),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationRow extends StatelessWidget {
  final EntityDetail entity;

  const LocationRow({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.p4,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.location_on, size: 20),
        Expanded(
          child: Text(
            '${entity.streetAddress}, ${context.loc.sector} ${entity.sectorName}, ${entity.cityName}',
            style: context.textTheme.bodyMedium,
          ),
        ),
        PrimaryButton(onPressed: () {}, text: context.loc.locateONMap),
      ],
    );
  }
}

class RatingWidget extends StatelessWidget {
  final EntityDetail entity;

  const RatingWidget({required this.entity, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: Sizes.p4,
      children: [
        Icon(Icons.star, color: Colors.amber),
        Text('${entity.avgRating}'),
        Text('(${entity.avgRating} ${context.loc.reviews})'.hardcoded),
      ],
    );
  }
}

class FurnishedInfo extends StatelessWidget {
  final ResidenceDetail residence;

  const FurnishedInfo({required this.residence, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.loc.furnished,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(residence.isFurnished ? context.loc.yes : context.loc.no),
      ],
    );
  }
}

class ContactOptionsRow extends StatelessWidget {
  const ContactOptionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: Sizes.p8,
      runSpacing: Sizes.p8,
      children: [
        DetailContactButton(
          icon: Icons.phone,
          color: context.colorScheme.primary,
          label: context.loc.call,
          onPressed: () {}, // TODO
        ),
        DetailContactButton(
          icon: Icons.chat,
          color: context.colorScheme.primary,
          label: context.loc.message,
          onPressed: () {}, // TODO
        ),
        OutlinedContactButton(
          icon: FontAwesomeIcons.facebookF,
          label: context.loc.facebook,
          onPressed: () {}, // TODO
        ),
        OutlinedContactButton(
          icon: FontAwesomeIcons.instagram,
          label: context.loc.instagram,
          onPressed: () {}, // TODO
        ),
        OutlinedContactButton(
          icon: Icons.language,
          label: context.loc.website,
          onPressed: () {}, // TODO
        ),
        OutlinedContactButton(
          icon: Icons.email,
          label: context.loc.email,
          onPressed: () {}, // TODO
        ),
      ],
    );
  }
}
