// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pricing _$PricingFromJson(Map<String, dynamic> json) => _Pricing(
  cost: (json['cost'] as num).toDouble(),
  unit:
      $enumDecodeNullable(_$PricingUnitEnumMap, json['unit']) ??
      PricingUnit.person,
  period:
      $enumDecodeNullable(_$PricingPeriodEnumMap, json['period']) ??
      PricingPeriod.oneTime,
);

Map<String, dynamic> _$PricingToJson(_Pricing instance) => <String, dynamic>{
  'cost': instance.cost,
  'unit': _$PricingUnitEnumMap[instance.unit]!,
  'period': _$PricingPeriodEnumMap[instance.period]!,
};

const _$PricingUnitEnumMap = {
  PricingUnit.person: 'person',
  PricingUnit.room: 'room',
  PricingUnit.unit: 'unit',
};

const _$PricingPeriodEnumMap = {
  PricingPeriod.oneTime: 'oneTime',
  PricingPeriod.day: 'day',
  PricingPeriod.week: 'week',
  PricingPeriod.month: 'month',
  PricingPeriod.year: 'year',
};
