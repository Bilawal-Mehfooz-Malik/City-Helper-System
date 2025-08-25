// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel_ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarouselAd {

 CarouselAdId get id;// Unique ad identifier
 BusinessId get businessId;// ID of the owning business/shop
 CategoryId get categoryId;// e.g., CategoryId (int)
 SubCategoryId? get subcategoryId;// Optional: ID of the subcategory
 String get imageUrl;// URL to the 16:9 ad banner image
 AdLinkType get linkType;// "internal_profile" or "external_url"
 EntityId? get internalProfileId;// Conditional: ID of the in-app profile to link to
 String? get externalUrl;// Conditional: Full URL to an external website
 DateTime get startDate;// When the ad starts showing
 DateTime get endDate;// When the ad stops showing
 DateTime get createdAt;// Ad creation timestamp
 DateTime get updatedAt;// Last update timestamp
 bool get isActive;// True if ad is active
 int get priorityScore;// Numerical priority: 1 (Basic), 2 (Premium), 3 (Featured)
 DateTime? get lastShownAt;// Timestamp of the last time this ad was shown
 int get impressionCount;// Number of times ad has been shown
 int get clickCount;// Number of times ad has been clicked
 AdApprovalStatus get status;
/// Create a copy of CarouselAd
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarouselAdCopyWith<CarouselAd> get copyWith => _$CarouselAdCopyWithImpl<CarouselAd>(this as CarouselAd, _$identity);

  /// Serializes this CarouselAd to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarouselAd&&(identical(other.id, id) || other.id == id)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subcategoryId, subcategoryId) || other.subcategoryId == subcategoryId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.linkType, linkType) || other.linkType == linkType)&&(identical(other.internalProfileId, internalProfileId) || other.internalProfileId == internalProfileId)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.priorityScore, priorityScore) || other.priorityScore == priorityScore)&&(identical(other.lastShownAt, lastShownAt) || other.lastShownAt == lastShownAt)&&(identical(other.impressionCount, impressionCount) || other.impressionCount == impressionCount)&&(identical(other.clickCount, clickCount) || other.clickCount == clickCount)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,businessId,categoryId,subcategoryId,imageUrl,linkType,internalProfileId,externalUrl,startDate,endDate,createdAt,updatedAt,isActive,priorityScore,lastShownAt,impressionCount,clickCount,status);

@override
String toString() {
  return 'CarouselAd(id: $id, businessId: $businessId, categoryId: $categoryId, subcategoryId: $subcategoryId, imageUrl: $imageUrl, linkType: $linkType, internalProfileId: $internalProfileId, externalUrl: $externalUrl, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, priorityScore: $priorityScore, lastShownAt: $lastShownAt, impressionCount: $impressionCount, clickCount: $clickCount, status: $status)';
}


}

/// @nodoc
abstract mixin class $CarouselAdCopyWith<$Res>  {
  factory $CarouselAdCopyWith(CarouselAd value, $Res Function(CarouselAd) _then) = _$CarouselAdCopyWithImpl;
@useResult
$Res call({
 CarouselAdId id, BusinessId businessId, CategoryId categoryId, SubCategoryId? subcategoryId, String imageUrl, AdLinkType linkType, EntityId? internalProfileId, String? externalUrl, DateTime startDate, DateTime endDate, DateTime createdAt, DateTime updatedAt, bool isActive, int priorityScore, DateTime? lastShownAt, int impressionCount, int clickCount, AdApprovalStatus status
});




}
/// @nodoc
class _$CarouselAdCopyWithImpl<$Res>
    implements $CarouselAdCopyWith<$Res> {
  _$CarouselAdCopyWithImpl(this._self, this._then);

  final CarouselAd _self;
  final $Res Function(CarouselAd) _then;

/// Create a copy of CarouselAd
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? businessId = null,Object? categoryId = null,Object? subcategoryId = freezed,Object? imageUrl = null,Object? linkType = null,Object? internalProfileId = freezed,Object? externalUrl = freezed,Object? startDate = null,Object? endDate = null,Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? priorityScore = null,Object? lastShownAt = freezed,Object? impressionCount = null,Object? clickCount = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CarouselAdId,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as BusinessId,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,subcategoryId: freezed == subcategoryId ? _self.subcategoryId : subcategoryId // ignore: cast_nullable_to_non_nullable
as SubCategoryId?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,linkType: null == linkType ? _self.linkType : linkType // ignore: cast_nullable_to_non_nullable
as AdLinkType,internalProfileId: freezed == internalProfileId ? _self.internalProfileId : internalProfileId // ignore: cast_nullable_to_non_nullable
as EntityId?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,priorityScore: null == priorityScore ? _self.priorityScore : priorityScore // ignore: cast_nullable_to_non_nullable
as int,lastShownAt: freezed == lastShownAt ? _self.lastShownAt : lastShownAt // ignore: cast_nullable_to_non_nullable
as DateTime?,impressionCount: null == impressionCount ? _self.impressionCount : impressionCount // ignore: cast_nullable_to_non_nullable
as int,clickCount: null == clickCount ? _self.clickCount : clickCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdApprovalStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [CarouselAd].
extension CarouselAdPatterns on CarouselAd {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarouselAd value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarouselAd() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarouselAd value)  $default,){
final _that = this;
switch (_that) {
case _CarouselAd():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarouselAd value)?  $default,){
final _that = this;
switch (_that) {
case _CarouselAd() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CarouselAdId id,  BusinessId businessId,  CategoryId categoryId,  SubCategoryId? subcategoryId,  String imageUrl,  AdLinkType linkType,  EntityId? internalProfileId,  String? externalUrl,  DateTime startDate,  DateTime endDate,  DateTime createdAt,  DateTime updatedAt,  bool isActive,  int priorityScore,  DateTime? lastShownAt,  int impressionCount,  int clickCount,  AdApprovalStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarouselAd() when $default != null:
return $default(_that.id,_that.businessId,_that.categoryId,_that.subcategoryId,_that.imageUrl,_that.linkType,_that.internalProfileId,_that.externalUrl,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt,_that.isActive,_that.priorityScore,_that.lastShownAt,_that.impressionCount,_that.clickCount,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CarouselAdId id,  BusinessId businessId,  CategoryId categoryId,  SubCategoryId? subcategoryId,  String imageUrl,  AdLinkType linkType,  EntityId? internalProfileId,  String? externalUrl,  DateTime startDate,  DateTime endDate,  DateTime createdAt,  DateTime updatedAt,  bool isActive,  int priorityScore,  DateTime? lastShownAt,  int impressionCount,  int clickCount,  AdApprovalStatus status)  $default,) {final _that = this;
switch (_that) {
case _CarouselAd():
return $default(_that.id,_that.businessId,_that.categoryId,_that.subcategoryId,_that.imageUrl,_that.linkType,_that.internalProfileId,_that.externalUrl,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt,_that.isActive,_that.priorityScore,_that.lastShownAt,_that.impressionCount,_that.clickCount,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CarouselAdId id,  BusinessId businessId,  CategoryId categoryId,  SubCategoryId? subcategoryId,  String imageUrl,  AdLinkType linkType,  EntityId? internalProfileId,  String? externalUrl,  DateTime startDate,  DateTime endDate,  DateTime createdAt,  DateTime updatedAt,  bool isActive,  int priorityScore,  DateTime? lastShownAt,  int impressionCount,  int clickCount,  AdApprovalStatus status)?  $default,) {final _that = this;
switch (_that) {
case _CarouselAd() when $default != null:
return $default(_that.id,_that.businessId,_that.categoryId,_that.subcategoryId,_that.imageUrl,_that.linkType,_that.internalProfileId,_that.externalUrl,_that.startDate,_that.endDate,_that.createdAt,_that.updatedAt,_that.isActive,_that.priorityScore,_that.lastShownAt,_that.impressionCount,_that.clickCount,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarouselAd implements CarouselAd {
  const _CarouselAd({required this.id, required this.businessId, required this.categoryId, this.subcategoryId, required this.imageUrl, required this.linkType, this.internalProfileId, this.externalUrl, required this.startDate, required this.endDate, required this.createdAt, required this.updatedAt, this.isActive = true, this.priorityScore = 1, this.lastShownAt, this.impressionCount = 0, this.clickCount = 0, this.status = AdApprovalStatus.pending});
  factory _CarouselAd.fromJson(Map<String, dynamic> json) => _$CarouselAdFromJson(json);

@override final  CarouselAdId id;
// Unique ad identifier
@override final  BusinessId businessId;
// ID of the owning business/shop
@override final  CategoryId categoryId;
// e.g., CategoryId (int)
@override final  SubCategoryId? subcategoryId;
// Optional: ID of the subcategory
@override final  String imageUrl;
// URL to the 16:9 ad banner image
@override final  AdLinkType linkType;
// "internal_profile" or "external_url"
@override final  EntityId? internalProfileId;
// Conditional: ID of the in-app profile to link to
@override final  String? externalUrl;
// Conditional: Full URL to an external website
@override final  DateTime startDate;
// When the ad starts showing
@override final  DateTime endDate;
// When the ad stops showing
@override final  DateTime createdAt;
// Ad creation timestamp
@override final  DateTime updatedAt;
// Last update timestamp
@override@JsonKey() final  bool isActive;
// True if ad is active
@override@JsonKey() final  int priorityScore;
// Numerical priority: 1 (Basic), 2 (Premium), 3 (Featured)
@override final  DateTime? lastShownAt;
// Timestamp of the last time this ad was shown
@override@JsonKey() final  int impressionCount;
// Number of times ad has been shown
@override@JsonKey() final  int clickCount;
// Number of times ad has been clicked
@override@JsonKey() final  AdApprovalStatus status;

/// Create a copy of CarouselAd
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarouselAdCopyWith<_CarouselAd> get copyWith => __$CarouselAdCopyWithImpl<_CarouselAd>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarouselAdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarouselAd&&(identical(other.id, id) || other.id == id)&&(identical(other.businessId, businessId) || other.businessId == businessId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subcategoryId, subcategoryId) || other.subcategoryId == subcategoryId)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.linkType, linkType) || other.linkType == linkType)&&(identical(other.internalProfileId, internalProfileId) || other.internalProfileId == internalProfileId)&&(identical(other.externalUrl, externalUrl) || other.externalUrl == externalUrl)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.priorityScore, priorityScore) || other.priorityScore == priorityScore)&&(identical(other.lastShownAt, lastShownAt) || other.lastShownAt == lastShownAt)&&(identical(other.impressionCount, impressionCount) || other.impressionCount == impressionCount)&&(identical(other.clickCount, clickCount) || other.clickCount == clickCount)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,businessId,categoryId,subcategoryId,imageUrl,linkType,internalProfileId,externalUrl,startDate,endDate,createdAt,updatedAt,isActive,priorityScore,lastShownAt,impressionCount,clickCount,status);

@override
String toString() {
  return 'CarouselAd(id: $id, businessId: $businessId, categoryId: $categoryId, subcategoryId: $subcategoryId, imageUrl: $imageUrl, linkType: $linkType, internalProfileId: $internalProfileId, externalUrl: $externalUrl, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, priorityScore: $priorityScore, lastShownAt: $lastShownAt, impressionCount: $impressionCount, clickCount: $clickCount, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CarouselAdCopyWith<$Res> implements $CarouselAdCopyWith<$Res> {
  factory _$CarouselAdCopyWith(_CarouselAd value, $Res Function(_CarouselAd) _then) = __$CarouselAdCopyWithImpl;
@override @useResult
$Res call({
 CarouselAdId id, BusinessId businessId, CategoryId categoryId, SubCategoryId? subcategoryId, String imageUrl, AdLinkType linkType, EntityId? internalProfileId, String? externalUrl, DateTime startDate, DateTime endDate, DateTime createdAt, DateTime updatedAt, bool isActive, int priorityScore, DateTime? lastShownAt, int impressionCount, int clickCount, AdApprovalStatus status
});




}
/// @nodoc
class __$CarouselAdCopyWithImpl<$Res>
    implements _$CarouselAdCopyWith<$Res> {
  __$CarouselAdCopyWithImpl(this._self, this._then);

  final _CarouselAd _self;
  final $Res Function(_CarouselAd) _then;

/// Create a copy of CarouselAd
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? businessId = null,Object? categoryId = null,Object? subcategoryId = freezed,Object? imageUrl = null,Object? linkType = null,Object? internalProfileId = freezed,Object? externalUrl = freezed,Object? startDate = null,Object? endDate = null,Object? createdAt = null,Object? updatedAt = null,Object? isActive = null,Object? priorityScore = null,Object? lastShownAt = freezed,Object? impressionCount = null,Object? clickCount = null,Object? status = null,}) {
  return _then(_CarouselAd(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CarouselAdId,businessId: null == businessId ? _self.businessId : businessId // ignore: cast_nullable_to_non_nullable
as BusinessId,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,subcategoryId: freezed == subcategoryId ? _self.subcategoryId : subcategoryId // ignore: cast_nullable_to_non_nullable
as SubCategoryId?,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,linkType: null == linkType ? _self.linkType : linkType // ignore: cast_nullable_to_non_nullable
as AdLinkType,internalProfileId: freezed == internalProfileId ? _self.internalProfileId : internalProfileId // ignore: cast_nullable_to_non_nullable
as EntityId?,externalUrl: freezed == externalUrl ? _self.externalUrl : externalUrl // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,priorityScore: null == priorityScore ? _self.priorityScore : priorityScore // ignore: cast_nullable_to_non_nullable
as int,lastShownAt: freezed == lastShownAt ? _self.lastShownAt : lastShownAt // ignore: cast_nullable_to_non_nullable
as DateTime?,impressionCount: null == impressionCount ? _self.impressionCount : impressionCount // ignore: cast_nullable_to_non_nullable
as int,clickCount: null == clickCount ? _self.clickCount : clickCount // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdApprovalStatus,
  ));
}


}

// dart format on
