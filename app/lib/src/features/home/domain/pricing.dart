import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/src/core/models/pricing_types.dart';

part 'pricing.freezed.dart';
part 'pricing.g.dart';

@freezed
abstract class Pricing with _$Pricing {
  const factory Pricing({
    required double cost,
    @Default(PricingUnit.person) PricingUnit unit,
    @Default(PricingPeriod.oneTime) PricingPeriod period,
  }) = _Pricing;

  const Pricing._();

  String get displayLabel {
    final formattedCost = '\$${cost.toStringAsFixed(2)}';

    if (period == PricingPeriod.oneTime) {
      return '$formattedCost / ${unit.label}';
    }

    return '$formattedCost / ${unit.label} / ${period.label}';
  }

  IconData get icon => unit.icon;

  factory Pricing.fromJson(Map<String, Object?> json) =>
      _$PricingFromJson(json);
}
