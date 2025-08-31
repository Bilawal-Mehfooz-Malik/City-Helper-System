// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Residence _$ResidenceFromJson(Map<String, dynamic> json) => Residence(
  id: json['id'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  subCategoryId: (json['subCategoryId'] as num).toInt(),
  coverImageUrl: json['coverImageUrl'] as String,
  name: json['name'] as String,
  cityName: json['cityName'] as String,
  sectorName: json['sectorName'] as String,
  latLng: _latLngJsonConverter.fromJson(json['latLng'] as Object),
  avgRating: (json['avgRating'] as num?)?.toDouble() ?? 0.0,
  totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 0,
  isPopular: json['isPopular'] as bool? ?? false,
  openingHours: _$JsonConverterFromJson<
    Map<String, dynamic>,
    Map<DayOfWeek, OpeningHours>
  >(json['openingHours'], _openingHoursConverter.fromJson),
  approvalStatus:
      $enumDecodeNullable(_$ApprovalStatusEnumMap, json['approvalStatus']) ??
      ApprovalStatus.pending,
  pricing: Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
  isFurnished: json['isFurnished'] as bool? ?? false,
  genderPreference:
      $enumDecodeNullable(
        _$GenderPreferenceEnumMap,
        json['genderPreference'],
      ) ??
      GenderPreference.familyFriendly,
  listingType:
      $enumDecodeNullable(_$ListingTypeEnumMap, json['listingType']) ??
      ListingType.forRent,
  isRoomAvailable: json['isRoomAvailable'] as bool? ?? true,
  updatedAt: _timestampJsonConverter.fromJson(json['updatedAt'] as Timestamp),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ResidenceToJson(Residence instance) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'subCategoryId': instance.subCategoryId,
  'coverImageUrl': instance.coverImageUrl,
  'name': instance.name,
  'cityName': instance.cityName,
  'sectorName': instance.sectorName,
  'latLng': _latLngJsonConverter.toJson(instance.latLng),
  'avgRating': instance.avgRating,
  'totalReviews': instance.totalReviews,
  'isPopular': instance.isPopular,
  'openingHours':
      _$JsonConverterToJson<Map<String, dynamic>, Map<DayOfWeek, OpeningHours>>(
        instance.openingHours,
        _openingHoursConverter.toJson,
      ),
  'approvalStatus': _$ApprovalStatusEnumMap[instance.approvalStatus]!,
  'pricing': instance.pricing.toJson(),
  'isFurnished': instance.isFurnished,
  'genderPreference': _$GenderPreferenceEnumMap[instance.genderPreference]!,
  'listingType': _$ListingTypeEnumMap[instance.listingType]!,
  'isRoomAvailable': instance.isRoomAvailable,
  'updatedAt': _timestampJsonConverter.toJson(instance.updatedAt),
  'runtimeType': instance.$type,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$ApprovalStatusEnumMap = {
  ApprovalStatus.blocked: 'blocked',
  ApprovalStatus.pending: 'pending',
  ApprovalStatus.approved: 'approved',
};

const _$GenderPreferenceEnumMap = {
  GenderPreference.any: 'any',
  GenderPreference.maleOnly: 'maleOnly',
  GenderPreference.femaleOnly: 'femaleOnly',
  GenderPreference.familyFriendly: 'familyFriendly',
};

const _$ListingTypeEnumMap = {
  ListingType.forRent: 'forRent',
  ListingType.forSale: 'forSale',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
  id: json['id'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  subCategoryId: (json['subCategoryId'] as num).toInt(),
  coverImageUrl: json['coverImageUrl'] as String,
  name: json['name'] as String,
  cityName: json['cityName'] as String,
  sectorName: json['sectorName'] as String,
  latLng: _latLngJsonConverter.fromJson(json['latLng'] as Object),
  avgRating: (json['avgRating'] as num?)?.toDouble() ?? 0.0,
  totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 0,
  isPopular: json['isPopular'] as bool? ?? false,
  openingHours: _openingHoursConverter.fromJson(
    json['openingHours'] as Map<String, dynamic>,
  ),
  operationalStatus:
      $enumDecodeNullable(
        _$OperationalStatusEnumMap,
        json['operationalStatus'],
      ) ??
      OperationalStatus.defaultStatus,
  approvalStatus:
      $enumDecodeNullable(_$ApprovalStatusEnumMap, json['approvalStatus']) ??
      ApprovalStatus.pending,
  genderPreference:
      $enumDecodeNullable(
        _$GenderPreferenceEnumMap,
        json['genderPreference'],
      ) ??
      GenderPreference.any,
  updatedAt: _timestampJsonConverter.fromJson(json['updatedAt'] as Timestamp),
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'subCategoryId': instance.subCategoryId,
  'coverImageUrl': instance.coverImageUrl,
  'name': instance.name,
  'cityName': instance.cityName,
  'sectorName': instance.sectorName,
  'latLng': _latLngJsonConverter.toJson(instance.latLng),
  'avgRating': instance.avgRating,
  'totalReviews': instance.totalReviews,
  'isPopular': instance.isPopular,
  'openingHours': _openingHoursConverter.toJson(instance.openingHours),
  'operationalStatus': _$OperationalStatusEnumMap[instance.operationalStatus]!,
  'approvalStatus': _$ApprovalStatusEnumMap[instance.approvalStatus]!,
  'genderPreference': _$GenderPreferenceEnumMap[instance.genderPreference]!,
  'updatedAt': _timestampJsonConverter.toJson(instance.updatedAt),
  'runtimeType': instance.$type,
};

const _$OperationalStatusEnumMap = {
  OperationalStatus.open: 'open',
  OperationalStatus.close: 'close',
  OperationalStatus.defaultStatus: 'defaultStatus',
};
