import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pricing.freezed.dart';
part 'pricing.g.dart';

enum PricingUnit {
  person('person', Icons.person),
  room('room', Icons.king_bed),
  unit('unit', Icons.home);

  const PricingUnit(this.label, this.icon);
  final String label;
  final IconData icon;
}

enum PricingPeriod {
  oneTime('one-time'),
  day('day'),
  week('week'),
  month('month'),
  year('year');

  const PricingPeriod(this.label);
  final String label;
}

@freezed
abstract class Pricing with _$Pricing {
  const factory Pricing({
    required double cost,
    @Default(PricingUnit.person) PricingUnit unit,
    @Default(PricingPeriod.oneTime) PricingPeriod period,
  }) = _Pricing;

  const Pricing._();

  String get displayLabel {
    if (period == PricingPeriod.oneTime) {
      return 'per ${unit.label}';
    }

    return 'per ${unit.label} / ${period.label}';
  }

  IconData get icon => unit.icon;

  factory Pricing.fromJson(Map<String, Object?> json) =>
      _$PricingFromJson(json);
}
