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
  pricing: (json['pricing'] as num).toDouble(),
  isFurnished: json['isFurnished'] as bool? ?? false,
  genderPref:
      $enumDecodeNullable(_$GenderPreferenceEnumMap, json['genderPref']) ??
      GenderPreference.any,
  listingType:
      $enumDecodeNullable(_$ListingTypeEnumMap, json['listingType']) ??
      ListingType.forRent,
  isRoomAvailable: json['isRoomAvailable'] as bool? ?? true,
  isOpen: json['isOpen'] as bool? ?? false,
  ownerId: json['ownerId'] as String,
  description: json['description'] as String,
  galleryImageUrls:
      (json['galleryImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  streetAddress: json['streetAddress'] as String,
  ratingBreakdown:
      (json['ratingBreakdown'] as List<dynamic>?)
          ?.map((e) => RatingBreakdown.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  phoneNumber: json['phoneNumber'] as String?,
  messagingNumber: json['messagingNumber'] as String?,
  updatedAt: _timestampJsonConverter.fromJson(json['updatedAt'] as Timestamp),
  websiteUrl: json['websiteUrl'] as String?,
  instagramUrl: json['instagramUrl'] as String?,
  facebookUrl: json['facebookUrl'] as String?,
  email: json['email'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ResidenceDetailToJson(
  ResidenceDetail instance,
) => <String, dynamic>{
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
  'pricing': instance.pricing,
  'isFurnished': instance.isFurnished,
  'genderPref': _$GenderPreferenceEnumMap[instance.genderPref]!,
  'listingType': _$ListingTypeEnumMap[instance.listingType]!,
  'isRoomAvailable': instance.isRoomAvailable,
  'isOpen': instance.isOpen,
  'ownerId': instance.ownerId,
  'description': instance.description,
  'galleryImageUrls': instance.galleryImageUrls,
  'streetAddress': instance.streetAddress,
  'ratingBreakdown': instance.ratingBreakdown.map((e) => e.toJson()).toList(),
  'phoneNumber': instance.phoneNumber,
  'messagingNumber': instance.messagingNumber,
  'updatedAt': _timestampJsonConverter.toJson(instance.updatedAt),
  'websiteUrl': instance.websiteUrl,
  'instagramUrl': instance.instagramUrl,
  'facebookUrl': instance.facebookUrl,
  'email': instance.email,
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
  genderPref:
      $enumDecodeNullable(_$GenderPreferenceEnumMap, json['genderPref']) ??
      GenderPreference.any,
  isOpen: json['isOpen'] as bool? ?? false,
  ownerId: json['ownerId'] as String,
  description: json['description'] as String,
  galleryImageUrls:
      (json['galleryImageUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  menuImageUrls:
      (json['menuImageUrls'] as List<dynamic>).map((e) => e as String).toList(),
  streetAddress: json['streetAddress'] as String,
  ratingBreakdown:
      (json['ratingBreakdown'] as List<dynamic>?)
          ?.map((e) => RatingBreakdown.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  phoneNumber: json['phoneNumber'] as String?,
  messagingNumber: json['messagingNumber'] as String?,
  updatedAt: _timestampJsonConverter.fromJson(json['updatedAt'] as Timestamp),
  websiteUrl: json['websiteUrl'] as String?,
  instagramUrl: json['instagramUrl'] as String?,
  facebookUrl: json['facebookUrl'] as String?,
  email: json['email'] as String?,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$FoodDetailToJson(
  FoodDetail instance,
) => <String, dynamic>{
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
  'genderPref': _$GenderPreferenceEnumMap[instance.genderPref]!,
  'isOpen': instance.isOpen,
  'ownerId': instance.ownerId,
  'description': instance.description,
  'galleryImageUrls': instance.galleryImageUrls,
  'menuImageUrls': instance.menuImageUrls,
  'streetAddress': instance.streetAddress,
  'ratingBreakdown': instance.ratingBreakdown.map((e) => e.toJson()).toList(),
  'phoneNumber': instance.phoneNumber,
  'messagingNumber': instance.messagingNumber,
  'updatedAt': _timestampJsonConverter.toJson(instance.updatedAt),
  'websiteUrl': instance.websiteUrl,
  'instagramUrl': instance.instagramUrl,
  'facebookUrl': instance.facebookUrl,
  'email': instance.email,
  'runtimeType': instance.$type,
};
