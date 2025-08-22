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
  entityStatus:
      $enumDecodeNullable(_$OperationalStatusEnumMap, json['entityStatus']) ??
      OperationalStatus.defaultStatus,
  status:
      $enumDecodeNullable(_$ApprovalStatusEnumMap, json['status']) ??
      ApprovalStatus.pending,
  createdAt: _timestampJsonConverter.fromJson(json['createdAt'] as Timestamp),
  type:
      $enumDecodeNullable(_$EntityTypeEnumMap, json['type']) ??
      EntityType.residence,
  pricing: (json['price'] as num).toDouble(),
  isFurnished: json['isFurnished'] as bool? ?? false,
  genderPref:
      $enumDecodeNullable(_$GenderPreferenceEnumMap, json['genderPref']) ??
      GenderPreference.familyFriendly,
  listingType:
      $enumDecodeNullable(_$ListingTypeEnumMap, json['listingType']) ??
      ListingType.forRent,
  timezone: json['timezone'] as String? ?? "Asia/Karachi",
  scheduledTaskNames:
      (json['scheduledTaskNames'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
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
  'entityStatus': _$OperationalStatusEnumMap[instance.entityStatus]!,
  'status': _$ApprovalStatusEnumMap[instance.status]!,
  'createdAt': _timestampJsonConverter.toJson(instance.createdAt),
  'type': _$EntityTypeEnumMap[instance.type]!,
  'price': instance.pricing,
  'isFurnished': instance.isFurnished,
  'genderPref': _$GenderPreferenceEnumMap[instance.genderPref]!,
  'listingType': _$ListingTypeEnumMap[instance.listingType]!,
  'timezone': instance.timezone,
  'scheduledTaskNames': instance.scheduledTaskNames,
  'runtimeType': instance.$type,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$OperationalStatusEnumMap = {
  OperationalStatus.open: 'open',
  OperationalStatus.close: 'close',
  OperationalStatus.defaultStatus: 'defaultStatus',
};

const _$ApprovalStatusEnumMap = {
  ApprovalStatus.blocked: 'blocked',
  ApprovalStatus.pending: 'pending',
  ApprovalStatus.approved: 'approved',
};

const _$EntityTypeEnumMap = {
  EntityType.residence: 'residence',
  EntityType.food: 'food',
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
  entityStatus:
      $enumDecodeNullable(_$OperationalStatusEnumMap, json['entityStatus']) ??
      OperationalStatus.defaultStatus,
  status:
      $enumDecodeNullable(_$ApprovalStatusEnumMap, json['status']) ??
      ApprovalStatus.pending,
  createdAt: _timestampJsonConverter.fromJson(json['createdAt'] as Timestamp),
  type:
      $enumDecodeNullable(_$EntityTypeEnumMap, json['type']) ?? EntityType.food,
  genderPref:
      $enumDecodeNullable(_$GenderPreferenceEnumMap, json['genderPref']) ??
      GenderPreference.any,
  timezone: json['timezone'] as String? ?? "Asia/Karachi",
  isOpen: json['isOpen'] as bool?,
  scheduledTaskNames:
      (json['scheduledTaskNames'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const {},
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
  'entityStatus': _$OperationalStatusEnumMap[instance.entityStatus]!,
  'status': _$ApprovalStatusEnumMap[instance.status]!,
  'createdAt': _timestampJsonConverter.toJson(instance.createdAt),
  'type': _$EntityTypeEnumMap[instance.type]!,
  'genderPref': _$GenderPreferenceEnumMap[instance.genderPref]!,
  'timezone': instance.timezone,
  'isOpen': instance.isOpen,
  'scheduledTaskNames': instance.scheduledTaskNames,
  'runtimeType': instance.$type,
};
