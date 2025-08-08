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
  latLng: _latLngJsonConverter.fromJson(json['latLng'] as Map<String, Object?>),
  avgRating: (json['avgRating'] as num).toDouble(),
  totalReviews: (json['totalReviews'] as num).toInt(),
  isPopular: json['isPopular'] as bool,
  openingHours:
      (json['openingHours'] as List<dynamic>)
          .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
          .toList(),
  entityStatus: $enumDecode(_$EntityStatusEnumMap, json['entityStatus']),
  status: $enumDecode(_$StatusEnumMap, json['status']),
  createdAt: _timestampJsonConverter.fromJson(json['createdAt'] as Timestamp),
  type: $enumDecode(_$EntityTypeEnumMap, json['type']),
  price: (json['price'] as num).toDouble(),
  isFurnished: json['isFurnished'] as bool,
  genderPref: $enumDecode(_$GenderPreferenceEnumMap, json['genderPref']),
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
  'openingHours': instance.openingHours.map((e) => e.toJson()).toList(),
  'entityStatus': _$EntityStatusEnumMap[instance.entityStatus]!,
  'status': _$StatusEnumMap[instance.status]!,
  'createdAt': _timestampJsonConverter.toJson(instance.createdAt),
  'type': _$EntityTypeEnumMap[instance.type]!,
  'price': instance.price,
  'isFurnished': instance.isFurnished,
  'genderPref': _$GenderPreferenceEnumMap[instance.genderPref]!,
  'runtimeType': instance.$type,
};

const _$EntityStatusEnumMap = {
  EntityStatus.open: 'open',
  EntityStatus.close: 'close',
  EntityStatus.defaultStatus: 'defaultStatus',
};

const _$StatusEnumMap = {
  Status.blocked: 'blocked',
  Status.pending: 'pending',
  Status.approved: 'approved',
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

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
  id: json['id'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  subCategoryId: (json['subCategoryId'] as num).toInt(),
  coverImageUrl: json['coverImageUrl'] as String,
  name: json['name'] as String,
  cityName: json['cityName'] as String,
  sectorName: json['sectorName'] as String,
  latLng: _latLngJsonConverter.fromJson(json['latLng'] as Map<String, Object?>),
  avgRating: (json['avgRating'] as num).toDouble(),
  totalReviews: (json['totalReviews'] as num).toInt(),
  isPopular: json['isPopular'] as bool,
  openingHours:
      (json['openingHours'] as List<dynamic>)
          .map((e) => OpeningHours.fromJson(e as Map<String, dynamic>))
          .toList(),
  entityStatus: $enumDecode(_$EntityStatusEnumMap, json['entityStatus']),
  status: $enumDecode(_$StatusEnumMap, json['status']),
  createdAt: _timestampJsonConverter.fromJson(json['createdAt'] as Timestamp),
  type: $enumDecode(_$EntityTypeEnumMap, json['type']),
  genderPref: $enumDecode(_$GenderPreferenceEnumMap, json['genderPref']),
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
  'openingHours': instance.openingHours.map((e) => e.toJson()).toList(),
  'entityStatus': _$EntityStatusEnumMap[instance.entityStatus]!,
  'status': _$StatusEnumMap[instance.status]!,
  'createdAt': _timestampJsonConverter.toJson(instance.createdAt),
  'type': _$EntityTypeEnumMap[instance.type]!,
  'genderPref': _$GenderPreferenceEnumMap[instance.genderPref]!,
  'runtimeType': instance.$type,
};
