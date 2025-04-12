// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntityDetail {

 EntityId get entityId; UserId get userId; CategoryId get categoryId; SubCategoryId get subCategoryId; String get name; String get description; List<String> get imagesUrls; String get videoUrl; double get avgRating; int get reviewsCount; String get shopAddress; String get shopGeoPoints; String? get phoneNum; String? get msgNum; String? get webUrl; String? get instaUrl; String? get fbUrl; String? get emailAddress;
/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntityDetailCopyWith<EntityDetail> get copyWith => _$EntityDetailCopyWithImpl<EntityDetail>(this as EntityDetail, _$identity);

  /// Serializes this EntityDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntityDetail&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.imagesUrls, imagesUrls)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.shopAddress, shopAddress) || other.shopAddress == shopAddress)&&(identical(other.shopGeoPoints, shopGeoPoints) || other.shopGeoPoints == shopGeoPoints)&&(identical(other.phoneNum, phoneNum) || other.phoneNum == phoneNum)&&(identical(other.msgNum, msgNum) || other.msgNum == msgNum)&&(identical(other.webUrl, webUrl) || other.webUrl == webUrl)&&(identical(other.instaUrl, instaUrl) || other.instaUrl == instaUrl)&&(identical(other.fbUrl, fbUrl) || other.fbUrl == fbUrl)&&(identical(other.emailAddress, emailAddress) || other.emailAddress == emailAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entityId,userId,categoryId,subCategoryId,name,description,const DeepCollectionEquality().hash(imagesUrls),videoUrl,avgRating,reviewsCount,shopAddress,shopGeoPoints,phoneNum,msgNum,webUrl,instaUrl,fbUrl,emailAddress);

@override
String toString() {
  return 'EntityDetail(entityId: $entityId, userId: $userId, categoryId: $categoryId, subCategoryId: $subCategoryId, name: $name, description: $description, imagesUrls: $imagesUrls, videoUrl: $videoUrl, avgRating: $avgRating, reviewsCount: $reviewsCount, shopAddress: $shopAddress, shopGeoPoints: $shopGeoPoints, phoneNum: $phoneNum, msgNum: $msgNum, webUrl: $webUrl, instaUrl: $instaUrl, fbUrl: $fbUrl, emailAddress: $emailAddress)';
}


}

/// @nodoc
abstract mixin class $EntityDetailCopyWith<$Res>  {
  factory $EntityDetailCopyWith(EntityDetail value, $Res Function(EntityDetail) _then) = _$EntityDetailCopyWithImpl;
@useResult
$Res call({
 String entityId, String userId, int categoryId, int subCategoryId, String name, String description, List<String> imagesUrls, String videoUrl, double avgRating, int reviewsCount, String shopAddress, String shopGeoPoints, String? phoneNum, String? msgNum, String? webUrl, String? instaUrl, String? fbUrl, String? emailAddress
});




}
/// @nodoc
class _$EntityDetailCopyWithImpl<$Res>
    implements $EntityDetailCopyWith<$Res> {
  _$EntityDetailCopyWithImpl(this._self, this._then);

  final EntityDetail _self;
  final $Res Function(EntityDetail) _then;

/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entityId = null,Object? userId = null,Object? categoryId = null,Object? subCategoryId = null,Object? name = null,Object? description = null,Object? imagesUrls = null,Object? videoUrl = null,Object? avgRating = null,Object? reviewsCount = null,Object? shopAddress = null,Object? shopGeoPoints = null,Object? phoneNum = freezed,Object? msgNum = freezed,Object? webUrl = freezed,Object? instaUrl = freezed,Object? fbUrl = freezed,Object? emailAddress = freezed,}) {
  return _then(_self.copyWith(
entityId: null == entityId ? _self.entityId! : entityId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId! : userId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId! : categoryId // ignore: cast_nullable_to_non_nullable
as int,subCategoryId: null == subCategoryId ? _self.subCategoryId! : subCategoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagesUrls: null == imagesUrls ? _self.imagesUrls : imagesUrls // ignore: cast_nullable_to_non_nullable
as List<String>,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,shopAddress: null == shopAddress ? _self.shopAddress : shopAddress // ignore: cast_nullable_to_non_nullable
as String,shopGeoPoints: null == shopGeoPoints ? _self.shopGeoPoints : shopGeoPoints // ignore: cast_nullable_to_non_nullable
as String,phoneNum: freezed == phoneNum ? _self.phoneNum : phoneNum // ignore: cast_nullable_to_non_nullable
as String?,msgNum: freezed == msgNum ? _self.msgNum : msgNum // ignore: cast_nullable_to_non_nullable
as String?,webUrl: freezed == webUrl ? _self.webUrl : webUrl // ignore: cast_nullable_to_non_nullable
as String?,instaUrl: freezed == instaUrl ? _self.instaUrl : instaUrl // ignore: cast_nullable_to_non_nullable
as String?,fbUrl: freezed == fbUrl ? _self.fbUrl : fbUrl // ignore: cast_nullable_to_non_nullable
as String?,emailAddress: freezed == emailAddress ? _self.emailAddress : emailAddress // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _EntityDetail implements EntityDetail {
  const _EntityDetail({required this.entityId, required this.userId, required this.categoryId, required this.subCategoryId, required this.name, required this.description, required final  List<String> imagesUrls, required this.videoUrl, required this.avgRating, required this.reviewsCount, required this.shopAddress, required this.shopGeoPoints, this.phoneNum, this.msgNum, this.webUrl, this.instaUrl, this.fbUrl, this.emailAddress}): _imagesUrls = imagesUrls;
  factory _EntityDetail.fromJson(Map<String, dynamic> json) => _$EntityDetailFromJson(json);

@override final  String entityId;
@override final  String userId;
@override final  int categoryId;
@override final  int subCategoryId;
@override final  String name;
@override final  String description;
 final  List<String> _imagesUrls;
@override List<String> get imagesUrls {
  if (_imagesUrls is EqualUnmodifiableListView) return _imagesUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imagesUrls);
}

@override final  String videoUrl;
@override final  double avgRating;
@override final  int reviewsCount;
@override final  String shopAddress;
@override final  String shopGeoPoints;
@override final  String? phoneNum;
@override final  String? msgNum;
@override final  String? webUrl;
@override final  String? instaUrl;
@override final  String? fbUrl;
@override final  String? emailAddress;

/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntityDetailCopyWith<_EntityDetail> get copyWith => __$EntityDetailCopyWithImpl<_EntityDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EntityDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntityDetail&&(identical(other.entityId, entityId) || other.entityId == entityId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._imagesUrls, _imagesUrls)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.reviewsCount, reviewsCount) || other.reviewsCount == reviewsCount)&&(identical(other.shopAddress, shopAddress) || other.shopAddress == shopAddress)&&(identical(other.shopGeoPoints, shopGeoPoints) || other.shopGeoPoints == shopGeoPoints)&&(identical(other.phoneNum, phoneNum) || other.phoneNum == phoneNum)&&(identical(other.msgNum, msgNum) || other.msgNum == msgNum)&&(identical(other.webUrl, webUrl) || other.webUrl == webUrl)&&(identical(other.instaUrl, instaUrl) || other.instaUrl == instaUrl)&&(identical(other.fbUrl, fbUrl) || other.fbUrl == fbUrl)&&(identical(other.emailAddress, emailAddress) || other.emailAddress == emailAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entityId,userId,categoryId,subCategoryId,name,description,const DeepCollectionEquality().hash(_imagesUrls),videoUrl,avgRating,reviewsCount,shopAddress,shopGeoPoints,phoneNum,msgNum,webUrl,instaUrl,fbUrl,emailAddress);

@override
String toString() {
  return 'EntityDetail(entityId: $entityId, userId: $userId, categoryId: $categoryId, subCategoryId: $subCategoryId, name: $name, description: $description, imagesUrls: $imagesUrls, videoUrl: $videoUrl, avgRating: $avgRating, reviewsCount: $reviewsCount, shopAddress: $shopAddress, shopGeoPoints: $shopGeoPoints, phoneNum: $phoneNum, msgNum: $msgNum, webUrl: $webUrl, instaUrl: $instaUrl, fbUrl: $fbUrl, emailAddress: $emailAddress)';
}


}

/// @nodoc
abstract mixin class _$EntityDetailCopyWith<$Res> implements $EntityDetailCopyWith<$Res> {
  factory _$EntityDetailCopyWith(_EntityDetail value, $Res Function(_EntityDetail) _then) = __$EntityDetailCopyWithImpl;
@override @useResult
$Res call({
 String entityId, String userId, int categoryId, int subCategoryId, String name, String description, List<String> imagesUrls, String videoUrl, double avgRating, int reviewsCount, String shopAddress, String shopGeoPoints, String? phoneNum, String? msgNum, String? webUrl, String? instaUrl, String? fbUrl, String? emailAddress
});




}
/// @nodoc
class __$EntityDetailCopyWithImpl<$Res>
    implements _$EntityDetailCopyWith<$Res> {
  __$EntityDetailCopyWithImpl(this._self, this._then);

  final _EntityDetail _self;
  final $Res Function(_EntityDetail) _then;

/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entityId = null,Object? userId = null,Object? categoryId = null,Object? subCategoryId = null,Object? name = null,Object? description = null,Object? imagesUrls = null,Object? videoUrl = null,Object? avgRating = null,Object? reviewsCount = null,Object? shopAddress = null,Object? shopGeoPoints = null,Object? phoneNum = freezed,Object? msgNum = freezed,Object? webUrl = freezed,Object? instaUrl = freezed,Object? fbUrl = freezed,Object? emailAddress = freezed,}) {
  return _then(_EntityDetail(
entityId: null == entityId ? _self.entityId : entityId // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imagesUrls: null == imagesUrls ? _self._imagesUrls : imagesUrls // ignore: cast_nullable_to_non_nullable
as List<String>,videoUrl: null == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,reviewsCount: null == reviewsCount ? _self.reviewsCount : reviewsCount // ignore: cast_nullable_to_non_nullable
as int,shopAddress: null == shopAddress ? _self.shopAddress : shopAddress // ignore: cast_nullable_to_non_nullable
as String,shopGeoPoints: null == shopGeoPoints ? _self.shopGeoPoints : shopGeoPoints // ignore: cast_nullable_to_non_nullable
as String,phoneNum: freezed == phoneNum ? _self.phoneNum : phoneNum // ignore: cast_nullable_to_non_nullable
as String?,msgNum: freezed == msgNum ? _self.msgNum : msgNum // ignore: cast_nullable_to_non_nullable
as String?,webUrl: freezed == webUrl ? _self.webUrl : webUrl // ignore: cast_nullable_to_non_nullable
as String?,instaUrl: freezed == instaUrl ? _self.instaUrl : instaUrl // ignore: cast_nullable_to_non_nullable
as String?,fbUrl: freezed == fbUrl ? _self.fbUrl : fbUrl // ignore: cast_nullable_to_non_nullable
as String?,emailAddress: freezed == emailAddress ? _self.emailAddress : emailAddress // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
