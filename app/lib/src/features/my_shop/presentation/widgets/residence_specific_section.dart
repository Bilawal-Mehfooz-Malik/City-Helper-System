import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/utils/theme_extension.dart';
import 'package:app/src/features/home/domain/pricing.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';

class ResidenceSpecificSection extends StatelessWidget {
  final Pricing? pricing;
  final ListingType? listingType;
  final bool isFurnished;
  final bool isRoomAvailable;
  final ValueChanged<Pricing> onPricingChanged;
  final ValueChanged<bool> onFurnishedChanged;
  final ValueChanged<bool> onIsRoomAvailableChanged;

  const ResidenceSpecificSection({
    super.key,
    required this.pricing,
    required this.listingType,
    required this.isFurnished,
    required this.isRoomAvailable,
    required this.onPricingChanged,
    required this.onFurnishedChanged,
    required this.onIsRoomAvailableChanged,
  });

  @override
  Widget build(BuildContext context) {
    final price = pricing ?? const Pricing(cost: 0);
    final isForSale = listingType == ListingType.forSale;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p8),
            side: BorderSide(
              color: context.colorScheme.outline.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set the price and details for your listing *'.hardcoded,
                  style: context.textTheme.titleMedium,
                ),

                gapH8,
                TextFormField(
                  initialValue: price.cost != 0 ? price.cost.toString() : '',
                  onChanged: (value) {
                    final cost = double.tryParse(value) ?? 0.0;
                    onPricingChanged(price.copyWith(cost: cost));
                  },
                  decoration: InputDecoration(
                    labelText: 'Price *'.hardcoded,
                    hintText: 'e.g. 50000'.hardcoded,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                gapH12,
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<PricingUnit>(
                        value: price.unit,
                        decoration: InputDecoration(
                          labelText: 'Unit *'.hardcoded,
                          border: const OutlineInputBorder(),
                        ),
                        items: PricingUnit.values
                            .map(
                              (unit) => DropdownMenuItem(
                                value: unit,
                                child: Text(unit.label),
                              ),
                            )
                            .toList(),
                        onChanged: (unit) {
                          if (unit != null) {
                            onPricingChanged(price.copyWith(unit: unit));
                          }
                        },
                      ),
                    ),
                    gapW8,
                    Expanded(
                      child: DropdownButtonFormField<PricingPeriod>(
                        value: isForSale ? PricingPeriod.oneTime : price.period,
                        decoration: InputDecoration(
                          labelText: 'Period *'.hardcoded,
                          hintText: isForSale
                              ? 'Not applicable for sale'.hardcoded
                              : 'Like monthly or yearly'.hardcoded,
                          border: const OutlineInputBorder(),
                          filled: isForSale,
                          fillColor: context.colorScheme.surface.withValues(
                            alpha: 0.1,
                          ),
                        ),
                        items: PricingPeriod.values
                            .map(
                              (period) => DropdownMenuItem(
                                value: period,
                                child: Text(period.label),
                              ),
                            )
                            .toList(),
                        onChanged: isForSale
                            ? null
                            : (period) {
                                if (period != null) {
                                  onPricingChanged(
                                    price.copyWith(period: period),
                                  );
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        gapH16,
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p8),
            side: BorderSide(
              color: context.colorScheme.outline.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Additional Details *'.hardcoded,
                  style: context.textTheme.titleMedium,
                ),
                gapH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Is Furnished?'.hardcoded,
                      style: context.textTheme.bodyMedium,
                    ),
                    Switch(
                      value: isFurnished,
                      onChanged: onFurnishedChanged,
                      activeColor: context.colorScheme.primary,
                    ),
                  ],
                ),
                gapH8,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Is Room Available?'.hardcoded,
                      style: context.textTheme.bodyMedium,
                    ),
                    Switch(
                      value: isRoomAvailable,
                      onChanged: onIsRoomAvailableChanged,
                      activeColor: context.colorScheme.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
