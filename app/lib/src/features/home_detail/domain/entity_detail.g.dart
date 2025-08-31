// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResidenceDetail _$ResidenceDetailFromJson(
  Map<String, dynamic> json,
) => ResidenceDetail(
  id: json['id'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  subCategoryId: (json['subCategoryId'] as num).toInt(),
  name: json['name'] as String,
  coverImageUrl: json['coverImageUrl'] as String,
  cityName: json['cityName'] as String,
  sectorName: json['sectorName'] as String,
  latLng: _latLngJsonConverter.fromJson(json['latLng'] as Object),
  streetAddress: json['streetAddress'] as String,
  avgRating: (json['avgRating'] as num?)?.toDouble() ?? 0.0,
  totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 0,
  isPopular: json['isPopular'] as bool? ?? false,
  ratingBreakdown:
      (json['ratingBreakdown'] as List<dynamic>?)
          ?.map((e) => RatingBreakdown.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  operationalStatus:
      $enumDecodeNullable(
        _$OperationalStatusEnumMap,
        json['operationalStatus'],
      ) ??
      OperationalStatus.defaultStatus,
  approvalStatus:
      $enumDecodeNullable(_$ApprovalStatusEnumMap, json['approvalStatus']) ??
      ApprovalStatus.pending,
  createdAt: _timestampJsonConverter.fromJson(json['createdAt'] as Timestamp),
  updatedAt: _timestampJsonConverter.fromJson(json['updatedAt'] as Timestamp),
  openingHours: _$JsonConverterFromJson<
    Map<String, dynamic>,
    Map<DayOfWeek, OpeningHours>
  >(json['openingHours'], _openingHoursConverter.fromJson),
  ownerId: json['ownerId'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  waNumber: json['waNumber'] as String?,
  email: json['email'] as String?,
  websiteUrl: json['websiteUrl'] as String?,
  instagramUrl: json['instagramUrl'] as String?,
  facebookUrl: json['facebookUrl'] as String?,
  description: json['description'] as String,
  galleryImageUrls:
      (json['galleryImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  pricing: Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
  isFurnished: json['isFurnished'] as bool? ?? false,
  genderPreference:
      $enumDecodeNullable(
        _$GenderPreferenceEnumMap,
        json['genderPreference'],
      ) ??
      GenderPreference.any,
  listingType:
      $enumDecodeNullable(_$ListingTypeEnumMap, json['listingType']) ??
      ListingType.forRent,
  isRoomAvailable: json['isRoomAvailable'] as bool? ?? true,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ResidenceDetailToJson(
  ResidenceDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'subCategoryId': instance.subCategoryId,
  'name': instance.name,
  'coverImageUrl': instance.coverImageUrl,
  'cityName': instance.cityName,
  'sectorName': instance.sectorName,
  'latLng': _latLngJsonConverter.toJson(instance.latLng),
  'streetAddress': instance.streetAddress,
  'avgRating': instance.avgRating,
  'totalReviews': instance.totalReviews,
  'isPopular': instance.isPopular,
  'ratingBreakdown': instance.ratingBreakdown.map((e) => e.toJson()).toList(),
  'operationalStatus': _$OperationalStatusEnumMap[instance.operationalStatus]!,
  'approvalStatus': _$ApprovalStatusEnumMap[instance.approvalStatus]!,
  'createdAt': _timestampJsonConverter.toJson(instance.createdAt),
  'updatedAt': _timestampJsonConverter.toJson(instance.updatedAt),
  'openingHours':
      _$JsonConverterToJson<Map<String, dynamic>, Map<DayOfWeek, OpeningHours>>(
        instance.openingHours,
        _openingHoursConverter.toJson,
      ),
  'ownerId': instance.ownerId,
  'phoneNumber': instance.phoneNumber,
  'waNumber': instance.waNumber,
  'email': instance.email,
  'websiteUrl': instance.websiteUrl,
  'instagramUrl': instance.instagramUrl,
  'facebookUrl': instance.facebookUrl,
  'description': instance.description,
  'galleryImageUrls': instance.galleryImageUrls,
  'pricing': instance.pricing.toJson(),
  'isFurnished': instance.isFurnished,
  'genderPreference': _$GenderPreferenceEnumMap[instance.genderPreference]!,
  'listingType': _$ListingTypeEnumMap[instance.listingType]!,
  'isRoomAvailable': instance.isRoomAvailable,
  'runtimeType': instance.$type,
};

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

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

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

FoodDetail _$FoodDetailFromJson(Map<String, dynamic> json) => FoodDetail(
  id: json['id'] as String,
  categoryId: (json['categoryId'] as num).toInt(),
  subCategoryId: (json['subCategoryId'] as num).toInt(),
  name: json['name'] as String,
  coverImageUrl: json['coverImageUrl'] as String,
  cityName: json['cityName'] as String,
  sectorName: json['sectorName'] as String,
  latLng: _latLngJsonConverter.fromJson(json['latLng'] as Object),
  streetAddress: json['streetAddress'] as String,
  avgRating: (json['avgRating'] as num?)?.toDouble() ?? 0.0,
  totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 0,
  isPopular: json['isPopular'] as bool? ?? false,
  ratingBreakdown:
      (json['ratingBreakdown'] as List<dynamic>?)
          ?.map((e) => RatingBreakdown.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  operationalStatus:
      $enumDecodeNullable(
        _$OperationalStatusEnumMap,
        json['operationalStatus'],
      ) ??
      OperationalStatus.defaultStatus,
  approvalStatus:
      $enumDecodeNullable(_$ApprovalStatusEnumMap, json['approvalStatus']) ??
      ApprovalStatus.pending,
  createdAt: _timestampJsonConverter.fromJson(json['createdAt'] as Timestamp),
  updatedAt: _timestampJsonConverter.fromJson(json['updatedAt'] as Timestamp),
  openingHours: _openingHoursConverter.fromJson(
    json['openingHours'] as Map<String, dynamic>,
  ),
  ownerId: json['ownerId'] as String,
  phoneNumber: json['phoneNumber'] as String?,
  waNumber: json['waNumber'] as String?,
  email: json['email'] as String?,
  websiteUrl: json['websiteUrl'] as String?,
  instagramUrl: json['instagramUrl'] as String?,
  facebookUrl: json['facebookUrl'] as String?,
  description: json['description'] as String,
  galleryImageUrls:
      (json['galleryImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  menuImageUrls:
      (json['menuImageUrls'] as List<dynamic>).map((e) => e as String).toList(),
  genderPreference:
      $enumDecodeNullable(
        _$GenderPreferenceEnumMap,
        json['genderPreference'],
      ) ??
      GenderPreference.any,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$FoodDetailToJson(
  FoodDetail instance,
) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'subCategoryId': instance.subCategoryId,
  'name': instance.name,
  'coverImageUrl': instance.coverImageUrl,
  'cityName': instance.cityName,
  'sectorName': instance.sectorName,
  'latLng': _latLngJsonConverter.toJson(instance.latLng),
  'streetAddress': instance.streetAddress,
  'avgRating': instance.avgRating,
  'totalReviews': instance.totalReviews,
  'isPopular': instance.isPopular,
  'ratingBreakdown': instance.ratingBreakdown.map((e) => e.toJson()).toList(),
  'operationalStatus': _$OperationalStatusEnumMap[instance.operationalStatus]!,
  'approvalStatus': _$ApprovalStatusEnumMap[instance.approvalStatus]!,
  'createdAt': _timestampJsonConverter.toJson(instance.createdAt),
  'updatedAt': _timestampJsonConverter.toJson(instance.updatedAt),
  'openingHours': _openingHoursConverter.toJson(instance.openingHours),
  'ownerId': instance.ownerId,
  'phoneNumber': instance.phoneNumber,
  'waNumber': instance.waNumber,
  'email': instance.email,
  'websiteUrl': instance.websiteUrl,
  'instagramUrl': instance.instagramUrl,
  'facebookUrl': instance.facebookUrl,
  'description': instance.description,
  'galleryImageUrls': instance.galleryImageUrls,
  'menuImageUrls': instance.menuImageUrls,
  'genderPreference': _$GenderPreferenceEnumMap[instance.genderPreference]!,
  'runtimeType': instance.$type,
};
