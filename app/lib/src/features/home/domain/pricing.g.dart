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
  PricingUnit.bed: 'bed',
  PricingUnit.room: 'room',
  PricingUnit.house: 'house',
  PricingUnit.floor: 'floor',
  PricingUnit.property: 'property',
};

const _$PricingPeriodEnumMap = {
  PricingPeriod.hourly: 'hourly',
  PricingPeriod.daily: 'daily',
  PricingPeriod.monthly: 'monthly',
  PricingPeriod.oneTime: 'oneTime',
};
