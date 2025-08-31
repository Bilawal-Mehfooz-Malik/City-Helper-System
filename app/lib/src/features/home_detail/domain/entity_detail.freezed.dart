// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
EntityDetail _$EntityDetailFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'residence':
          return ResidenceDetail.fromJson(
            json
          );
                case 'food':
          return FoodDetail.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'EntityDetail',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$EntityDetail {

// Core Identifiers & Basic Info
 EntityId get id; CategoryId get categoryId; SubCategoryId get subCategoryId; String get name; String get coverImageUrl;// Location
 String get cityName; String get sectorName;@_latLngJsonConverter LatLng get latLng; String get streetAddress;// Ratings & Popularity
 double get avgRating; int get totalReviews; bool get isPopular; List<RatingBreakdown> get ratingBreakdown;// Operational Status & Timestamps
 OperationalStatus get operationalStatus; ApprovalStatus get approvalStatus;@_timestampJsonConverter DateTime get createdAt;@_timestampJsonConverter DateTime get updatedAt;@_openingHoursConverter Map<DayOfWeek, OpeningHours>? get openingHours;// Contact Information
 UserId get ownerId; String? get phoneNumber; String? get waNumber; String? get email; String? get websiteUrl; String? get instagramUrl; String? get facebookUrl;// Descriptions & Media
 String get description; List<String> get galleryImageUrls;// Specific Attributes
 GenderPreference get genderPreference;
/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntityDetailCopyWith<EntityDetail> get copyWith => _$EntityDetailCopyWithImpl<EntityDetail>(this as EntityDetail, _$identity);

  /// Serializes this EntityDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntityDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other.ratingBreakdown, ratingBreakdown)&&(identical(other.operationalStatus, operationalStatus) || other.operationalStatus == operationalStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.openingHours, openingHours)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.waNumber, waNumber) || other.waNumber == waNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.galleryImageUrls, galleryImageUrls)&&(identical(other.genderPreference, genderPreference) || other.genderPreference == genderPreference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,subCategoryId,name,coverImageUrl,cityName,sectorName,latLng,streetAddress,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(ratingBreakdown),operationalStatus,approvalStatus,createdAt,updatedAt,const DeepCollectionEquality().hash(openingHours),ownerId,phoneNumber,waNumber,email,websiteUrl,instagramUrl,facebookUrl,description,const DeepCollectionEquality().hash(galleryImageUrls),genderPreference]);

@override
String toString() {
  return 'EntityDetail(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, name: $name, coverImageUrl: $coverImageUrl, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, streetAddress: $streetAddress, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, ratingBreakdown: $ratingBreakdown, operationalStatus: $operationalStatus, approvalStatus: $approvalStatus, createdAt: $createdAt, updatedAt: $updatedAt, openingHours: $openingHours, ownerId: $ownerId, phoneNumber: $phoneNumber, waNumber: $waNumber, email: $email, websiteUrl: $websiteUrl, instagramUrl: $instagramUrl, facebookUrl: $facebookUrl, description: $description, galleryImageUrls: $galleryImageUrls, genderPreference: $genderPreference)';
}


}

/// @nodoc
abstract mixin class $EntityDetailCopyWith<$Res>  {
  factory $EntityDetailCopyWith(EntityDetail value, $Res Function(EntityDetail) _then) = _$EntityDetailCopyWithImpl;
@useResult
$Res call({
 String id, int categoryId, int subCategoryId, String name, String coverImageUrl, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, String streetAddress, double avgRating, int totalReviews, bool isPopular, List<RatingBreakdown> ratingBreakdown, OperationalStatus operationalStatus, ApprovalStatus approvalStatus,@_timestampJsonConverter DateTime createdAt,@_timestampJsonConverter DateTime updatedAt,@_openingHoursConverter Map<DayOfWeek, OpeningHours> openingHours, String ownerId, String? phoneNumber, String? waNumber, String? email, String? websiteUrl, String? instagramUrl, String? facebookUrl, String description, List<String> galleryImageUrls, GenderPreference genderPreference
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? name = null,Object? coverImageUrl = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? streetAddress = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? ratingBreakdown = null,Object? operationalStatus = null,Object? approvalStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? openingHours = null,Object? ownerId = null,Object? phoneNumber = freezed,Object? waNumber = freezed,Object? email = freezed,Object? websiteUrl = freezed,Object? instagramUrl = freezed,Object? facebookUrl = freezed,Object? description = null,Object? galleryImageUrls = null,Object? genderPreference = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,ratingBreakdown: null == ratingBreakdown ? _self.ratingBreakdown : ratingBreakdown // ignore: cast_nullable_to_non_nullable
as List<RatingBreakdown>,operationalStatus: null == operationalStatus ? _self.operationalStatus : operationalStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,openingHours: null == openingHours ? _self.openingHours! : openingHours // ignore: cast_nullable_to_non_nullable
as Map<DayOfWeek, OpeningHours>,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,waNumber: freezed == waNumber ? _self.waNumber : waNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,facebookUrl: freezed == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,galleryImageUrls: null == galleryImageUrls ? _self.galleryImageUrls : galleryImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,genderPreference: null == genderPreference ? _self.genderPreference : genderPreference // ignore: cast_nullable_to_non_nullable
as GenderPreference,
  ));
}

}


/// Adds pattern-matching-related methods to [EntityDetail].
extension EntityDetailPatterns on EntityDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ResidenceDetail value)?  residence,TResult Function( FoodDetail value)?  food,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ResidenceDetail() when residence != null:
return residence(_that);case FoodDetail() when food != null:
return food(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ResidenceDetail value)  residence,required TResult Function( FoodDetail value)  food,}){
final _that = this;
switch (_that) {
case ResidenceDetail():
return residence(_that);case FoodDetail():
return food(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ResidenceDetail value)?  residence,TResult? Function( FoodDetail value)?  food,}){
final _that = this;
switch (_that) {
case ResidenceDetail() when residence != null:
return residence(_that);case FoodDetail() when food != null:
return food(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String name,  String coverImageUrl,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  String streetAddress,  double avgRating,  int totalReviews,  bool isPopular,  List<RatingBreakdown> ratingBreakdown,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus, @_timestampJsonConverter  DateTime createdAt, @_timestampJsonConverter  DateTime updatedAt, @_openingHoursConverter  Map<DayOfWeek, OpeningHours>? openingHours,  UserId ownerId,  String? phoneNumber,  String? waNumber,  String? email,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String description,  List<String> galleryImageUrls,  Pricing pricing,  bool isFurnished,  GenderPreference genderPreference,  ListingType listingType,  bool isRoomAvailable)?  residence,TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String name,  String coverImageUrl,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  String streetAddress,  double avgRating,  int totalReviews,  bool isPopular,  List<RatingBreakdown> ratingBreakdown,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus, @_timestampJsonConverter  DateTime createdAt, @_timestampJsonConverter  DateTime updatedAt, @_openingHoursConverter  Map<DayOfWeek, OpeningHours> openingHours,  UserId ownerId,  String? phoneNumber,  String? waNumber,  String? email,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String description,  List<String> galleryImageUrls,  List<String> menuImageUrls,  GenderPreference genderPreference)?  food,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResidenceDetail() when residence != null:
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.name,_that.coverImageUrl,_that.cityName,_that.sectorName,_that.latLng,_that.streetAddress,_that.avgRating,_that.totalReviews,_that.isPopular,_that.ratingBreakdown,_that.operationalStatus,_that.approvalStatus,_that.createdAt,_that.updatedAt,_that.openingHours,_that.ownerId,_that.phoneNumber,_that.waNumber,_that.email,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.description,_that.galleryImageUrls,_that.pricing,_that.isFurnished,_that.genderPreference,_that.listingType,_that.isRoomAvailable);case FoodDetail() when food != null:
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.name,_that.coverImageUrl,_that.cityName,_that.sectorName,_that.latLng,_that.streetAddress,_that.avgRating,_that.totalReviews,_that.isPopular,_that.ratingBreakdown,_that.operationalStatus,_that.approvalStatus,_that.createdAt,_that.updatedAt,_that.openingHours,_that.ownerId,_that.phoneNumber,_that.waNumber,_that.email,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.description,_that.galleryImageUrls,_that.menuImageUrls,_that.genderPreference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String name,  String coverImageUrl,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  String streetAddress,  double avgRating,  int totalReviews,  bool isPopular,  List<RatingBreakdown> ratingBreakdown,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus, @_timestampJsonConverter  DateTime createdAt, @_timestampJsonConverter  DateTime updatedAt, @_openingHoursConverter  Map<DayOfWeek, OpeningHours>? openingHours,  UserId ownerId,  String? phoneNumber,  String? waNumber,  String? email,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String description,  List<String> galleryImageUrls,  Pricing pricing,  bool isFurnished,  GenderPreference genderPreference,  ListingType listingType,  bool isRoomAvailable)  residence,required TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String name,  String coverImageUrl,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  String streetAddress,  double avgRating,  int totalReviews,  bool isPopular,  List<RatingBreakdown> ratingBreakdown,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus, @_timestampJsonConverter  DateTime createdAt, @_timestampJsonConverter  DateTime updatedAt, @_openingHoursConverter  Map<DayOfWeek, OpeningHours> openingHours,  UserId ownerId,  String? phoneNumber,  String? waNumber,  String? email,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String description,  List<String> galleryImageUrls,  List<String> menuImageUrls,  GenderPreference genderPreference)  food,}) {final _that = this;
switch (_that) {
case ResidenceDetail():
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.name,_that.coverImageUrl,_that.cityName,_that.sectorName,_that.latLng,_that.streetAddress,_that.avgRating,_that.totalReviews,_that.isPopular,_that.ratingBreakdown,_that.operationalStatus,_that.approvalStatus,_that.createdAt,_that.updatedAt,_that.openingHours,_that.ownerId,_that.phoneNumber,_that.waNumber,_that.email,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.description,_that.galleryImageUrls,_that.pricing,_that.isFurnished,_that.genderPreference,_that.listingType,_that.isRoomAvailable);case FoodDetail():
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.name,_that.coverImageUrl,_that.cityName,_that.sectorName,_that.latLng,_that.streetAddress,_that.avgRating,_that.totalReviews,_that.isPopular,_that.ratingBreakdown,_that.operationalStatus,_that.approvalStatus,_that.createdAt,_that.updatedAt,_that.openingHours,_that.ownerId,_that.phoneNumber,_that.waNumber,_that.email,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.description,_that.galleryImageUrls,_that.menuImageUrls,_that.genderPreference);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String name,  String coverImageUrl,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  String streetAddress,  double avgRating,  int totalReviews,  bool isPopular,  List<RatingBreakdown> ratingBreakdown,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus, @_timestampJsonConverter  DateTime createdAt, @_timestampJsonConverter  DateTime updatedAt, @_openingHoursConverter  Map<DayOfWeek, OpeningHours>? openingHours,  UserId ownerId,  String? phoneNumber,  String? waNumber,  String? email,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String description,  List<String> galleryImageUrls,  Pricing pricing,  bool isFurnished,  GenderPreference genderPreference,  ListingType listingType,  bool isRoomAvailable)?  residence,TResult? Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String name,  String coverImageUrl,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  String streetAddress,  double avgRating,  int totalReviews,  bool isPopular,  List<RatingBreakdown> ratingBreakdown,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus, @_timestampJsonConverter  DateTime createdAt, @_timestampJsonConverter  DateTime updatedAt, @_openingHoursConverter  Map<DayOfWeek, OpeningHours> openingHours,  UserId ownerId,  String? phoneNumber,  String? waNumber,  String? email,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String description,  List<String> galleryImageUrls,  List<String> menuImageUrls,  GenderPreference genderPreference)?  food,}) {final _that = this;
switch (_that) {
case ResidenceDetail() when residence != null:
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.name,_that.coverImageUrl,_that.cityName,_that.sectorName,_that.latLng,_that.streetAddress,_that.avgRating,_that.totalReviews,_that.isPopular,_that.ratingBreakdown,_that.operationalStatus,_that.approvalStatus,_that.createdAt,_that.updatedAt,_that.openingHours,_that.ownerId,_that.phoneNumber,_that.waNumber,_that.email,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.description,_that.galleryImageUrls,_that.pricing,_that.isFurnished,_that.genderPreference,_that.listingType,_that.isRoomAvailable);case FoodDetail() when food != null:
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.name,_that.coverImageUrl,_that.cityName,_that.sectorName,_that.latLng,_that.streetAddress,_that.avgRating,_that.totalReviews,_that.isPopular,_that.ratingBreakdown,_that.operationalStatus,_that.approvalStatus,_that.createdAt,_that.updatedAt,_that.openingHours,_that.ownerId,_that.phoneNumber,_that.waNumber,_that.email,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.description,_that.galleryImageUrls,_that.menuImageUrls,_that.genderPreference);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class ResidenceDetail extends EntityDetail {
  const ResidenceDetail({required this.id, required this.categoryId, required this.subCategoryId, required this.name, required this.coverImageUrl, required this.cityName, required this.sectorName, @_latLngJsonConverter required this.latLng, required this.streetAddress, this.avgRating = 0.0, this.totalReviews = 0, this.isPopular = false, final  List<RatingBreakdown> ratingBreakdown = const [], this.operationalStatus = OperationalStatus.defaultStatus, this.approvalStatus = ApprovalStatus.pending, @_timestampJsonConverter required this.createdAt, @_timestampJsonConverter required this.updatedAt, @_openingHoursConverter final  Map<DayOfWeek, OpeningHours>? openingHours, required this.ownerId, this.phoneNumber, this.waNumber, this.email, this.websiteUrl, this.instagramUrl, this.facebookUrl, required this.description, required final  List<String> galleryImageUrls, required this.pricing, this.isFurnished = false, this.genderPreference = GenderPreference.any, this.listingType = ListingType.forRent, this.isRoomAvailable = true, final  String? $type}): _ratingBreakdown = ratingBreakdown,_openingHours = openingHours,_galleryImageUrls = galleryImageUrls,$type = $type ?? 'residence',super._();
  factory ResidenceDetail.fromJson(Map<String, dynamic> json) => _$ResidenceDetailFromJson(json);

// Core Identifiers & Basic Info
@override final  EntityId id;
@override final  CategoryId categoryId;
@override final  SubCategoryId subCategoryId;
@override final  String name;
@override final  String coverImageUrl;
// Location
@override final  String cityName;
@override final  String sectorName;
@override@_latLngJsonConverter final  LatLng latLng;
@override final  String streetAddress;
// Ratings & Popularity
@override@JsonKey() final  double avgRating;
@override@JsonKey() final  int totalReviews;
@override@JsonKey() final  bool isPopular;
 final  List<RatingBreakdown> _ratingBreakdown;
@override@JsonKey() List<RatingBreakdown> get ratingBreakdown {
  if (_ratingBreakdown is EqualUnmodifiableListView) return _ratingBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratingBreakdown);
}

// Operational Status & Timestamps
@override@JsonKey() final  OperationalStatus operationalStatus;
@override@JsonKey() final  ApprovalStatus approvalStatus;
@override@_timestampJsonConverter final  DateTime createdAt;
@override@_timestampJsonConverter final  DateTime updatedAt;
 final  Map<DayOfWeek, OpeningHours>? _openingHours;
@override@_openingHoursConverter Map<DayOfWeek, OpeningHours>? get openingHours {
  final value = _openingHours;
  if (value == null) return null;
  if (_openingHours is EqualUnmodifiableMapView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

// Contact Information
@override final  UserId ownerId;
@override final  String? phoneNumber;
@override final  String? waNumber;
@override final  String? email;
@override final  String? websiteUrl;
@override final  String? instagramUrl;
@override final  String? facebookUrl;
// Descriptions & Media
@override final  String description;
 final  List<String> _galleryImageUrls;
@override List<String> get galleryImageUrls {
  if (_galleryImageUrls is EqualUnmodifiableListView) return _galleryImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImageUrls);
}

// Specific Attributes
 final  Pricing pricing;
@JsonKey() final  bool isFurnished;
@override@JsonKey() final  GenderPreference genderPreference;
@JsonKey() final  ListingType listingType;
@JsonKey() final  bool isRoomAvailable;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidenceDetailCopyWith<ResidenceDetail> get copyWith => _$ResidenceDetailCopyWithImpl<ResidenceDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidenceDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidenceDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._ratingBreakdown, _ratingBreakdown)&&(identical(other.operationalStatus, operationalStatus) || other.operationalStatus == operationalStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.waNumber, waNumber) || other.waNumber == waNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._galleryImageUrls, _galleryImageUrls)&&(identical(other.pricing, pricing) || other.pricing == pricing)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished)&&(identical(other.genderPreference, genderPreference) || other.genderPreference == genderPreference)&&(identical(other.listingType, listingType) || other.listingType == listingType)&&(identical(other.isRoomAvailable, isRoomAvailable) || other.isRoomAvailable == isRoomAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,subCategoryId,name,coverImageUrl,cityName,sectorName,latLng,streetAddress,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(_ratingBreakdown),operationalStatus,approvalStatus,createdAt,updatedAt,const DeepCollectionEquality().hash(_openingHours),ownerId,phoneNumber,waNumber,email,websiteUrl,instagramUrl,facebookUrl,description,const DeepCollectionEquality().hash(_galleryImageUrls),pricing,isFurnished,genderPreference,listingType,isRoomAvailable]);

@override
String toString() {
  return 'EntityDetail.residence(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, name: $name, coverImageUrl: $coverImageUrl, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, streetAddress: $streetAddress, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, ratingBreakdown: $ratingBreakdown, operationalStatus: $operationalStatus, approvalStatus: $approvalStatus, createdAt: $createdAt, updatedAt: $updatedAt, openingHours: $openingHours, ownerId: $ownerId, phoneNumber: $phoneNumber, waNumber: $waNumber, email: $email, websiteUrl: $websiteUrl, instagramUrl: $instagramUrl, facebookUrl: $facebookUrl, description: $description, galleryImageUrls: $galleryImageUrls, pricing: $pricing, isFurnished: $isFurnished, genderPreference: $genderPreference, listingType: $listingType, isRoomAvailable: $isRoomAvailable)';
}


}

/// @nodoc
abstract mixin class $ResidenceDetailCopyWith<$Res> implements $EntityDetailCopyWith<$Res> {
  factory $ResidenceDetailCopyWith(ResidenceDetail value, $Res Function(ResidenceDetail) _then) = _$ResidenceDetailCopyWithImpl;
@override @useResult
$Res call({
 EntityId id, CategoryId categoryId, SubCategoryId subCategoryId, String name, String coverImageUrl, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, String streetAddress, double avgRating, int totalReviews, bool isPopular, List<RatingBreakdown> ratingBreakdown, OperationalStatus operationalStatus, ApprovalStatus approvalStatus,@_timestampJsonConverter DateTime createdAt,@_timestampJsonConverter DateTime updatedAt,@_openingHoursConverter Map<DayOfWeek, OpeningHours>? openingHours, UserId ownerId, String? phoneNumber, String? waNumber, String? email, String? websiteUrl, String? instagramUrl, String? facebookUrl, String description, List<String> galleryImageUrls, Pricing pricing, bool isFurnished, GenderPreference genderPreference, ListingType listingType, bool isRoomAvailable
});


$PricingCopyWith<$Res> get pricing;

}
/// @nodoc
class _$ResidenceDetailCopyWithImpl<$Res>
    implements $ResidenceDetailCopyWith<$Res> {
  _$ResidenceDetailCopyWithImpl(this._self, this._then);

  final ResidenceDetail _self;
  final $Res Function(ResidenceDetail) _then;

/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? name = null,Object? coverImageUrl = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? streetAddress = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? ratingBreakdown = null,Object? operationalStatus = null,Object? approvalStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? openingHours = freezed,Object? ownerId = null,Object? phoneNumber = freezed,Object? waNumber = freezed,Object? email = freezed,Object? websiteUrl = freezed,Object? instagramUrl = freezed,Object? facebookUrl = freezed,Object? description = null,Object? galleryImageUrls = null,Object? pricing = null,Object? isFurnished = null,Object? genderPreference = null,Object? listingType = null,Object? isRoomAvailable = null,}) {
  return _then(ResidenceDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as EntityId,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as SubCategoryId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,ratingBreakdown: null == ratingBreakdown ? _self._ratingBreakdown : ratingBreakdown // ignore: cast_nullable_to_non_nullable
as List<RatingBreakdown>,operationalStatus: null == operationalStatus ? _self.operationalStatus : operationalStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,openingHours: freezed == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as Map<DayOfWeek, OpeningHours>?,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as UserId,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,waNumber: freezed == waNumber ? _self.waNumber : waNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,facebookUrl: freezed == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,galleryImageUrls: null == galleryImageUrls ? _self._galleryImageUrls : galleryImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,pricing: null == pricing ? _self.pricing : pricing // ignore: cast_nullable_to_non_nullable
as Pricing,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,genderPreference: null == genderPreference ? _self.genderPreference : genderPreference // ignore: cast_nullable_to_non_nullable
as GenderPreference,listingType: null == listingType ? _self.listingType : listingType // ignore: cast_nullable_to_non_nullable
as ListingType,isRoomAvailable: null == isRoomAvailable ? _self.isRoomAvailable : isRoomAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PricingCopyWith<$Res> get pricing {
  
  return $PricingCopyWith<$Res>(_self.pricing, (value) {
    return _then(_self.copyWith(pricing: value));
  });
}
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class FoodDetail extends EntityDetail {
  const FoodDetail({required this.id, required this.categoryId, required this.subCategoryId, required this.name, required this.coverImageUrl, required this.cityName, required this.sectorName, @_latLngJsonConverter required this.latLng, required this.streetAddress, this.avgRating = 0.0, this.totalReviews = 0, this.isPopular = false, final  List<RatingBreakdown> ratingBreakdown = const [], this.operationalStatus = OperationalStatus.defaultStatus, this.approvalStatus = ApprovalStatus.pending, @_timestampJsonConverter required this.createdAt, @_timestampJsonConverter required this.updatedAt, @_openingHoursConverter required final  Map<DayOfWeek, OpeningHours> openingHours, required this.ownerId, this.phoneNumber, this.waNumber, this.email, this.websiteUrl, this.instagramUrl, this.facebookUrl, required this.description, required final  List<String> galleryImageUrls, required final  List<String> menuImageUrls, this.genderPreference = GenderPreference.any, final  String? $type}): _ratingBreakdown = ratingBreakdown,_openingHours = openingHours,_galleryImageUrls = galleryImageUrls,_menuImageUrls = menuImageUrls,$type = $type ?? 'food',super._();
  factory FoodDetail.fromJson(Map<String, dynamic> json) => _$FoodDetailFromJson(json);

// Core Identifiers & Basic Info
@override final  EntityId id;
@override final  CategoryId categoryId;
@override final  SubCategoryId subCategoryId;
@override final  String name;
@override final  String coverImageUrl;
// Location
@override final  String cityName;
@override final  String sectorName;
@override@_latLngJsonConverter final  LatLng latLng;
@override final  String streetAddress;
// Ratings & Popularity
@override@JsonKey() final  double avgRating;
@override@JsonKey() final  int totalReviews;
@override@JsonKey() final  bool isPopular;
 final  List<RatingBreakdown> _ratingBreakdown;
@override@JsonKey() List<RatingBreakdown> get ratingBreakdown {
  if (_ratingBreakdown is EqualUnmodifiableListView) return _ratingBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratingBreakdown);
}

// Operational Status & Timestamps
@override@JsonKey() final  OperationalStatus operationalStatus;
@override@JsonKey() final  ApprovalStatus approvalStatus;
@override@_timestampJsonConverter final  DateTime createdAt;
@override@_timestampJsonConverter final  DateTime updatedAt;
 final  Map<DayOfWeek, OpeningHours> _openingHours;
@override@_openingHoursConverter Map<DayOfWeek, OpeningHours> get openingHours {
  if (_openingHours is EqualUnmodifiableMapView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_openingHours);
}

// Contact Information
@override final  UserId ownerId;
@override final  String? phoneNumber;
@override final  String? waNumber;
@override final  String? email;
@override final  String? websiteUrl;
@override final  String? instagramUrl;
@override final  String? facebookUrl;
// Descriptions & Media
@override final  String description;
 final  List<String> _galleryImageUrls;
@override List<String> get galleryImageUrls {
  if (_galleryImageUrls is EqualUnmodifiableListView) return _galleryImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImageUrls);
}

 final  List<String> _menuImageUrls;
 List<String> get menuImageUrls {
  if (_menuImageUrls is EqualUnmodifiableListView) return _menuImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menuImageUrls);
}

// Specific Attributes
@override@JsonKey() final  GenderPreference genderPreference;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodDetailCopyWith<FoodDetail> get copyWith => _$FoodDetailCopyWithImpl<FoodDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.name, name) || other.name == name)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._ratingBreakdown, _ratingBreakdown)&&(identical(other.operationalStatus, operationalStatus) || other.operationalStatus == operationalStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.waNumber, waNumber) || other.waNumber == waNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._galleryImageUrls, _galleryImageUrls)&&const DeepCollectionEquality().equals(other._menuImageUrls, _menuImageUrls)&&(identical(other.genderPreference, genderPreference) || other.genderPreference == genderPreference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,subCategoryId,name,coverImageUrl,cityName,sectorName,latLng,streetAddress,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(_ratingBreakdown),operationalStatus,approvalStatus,createdAt,updatedAt,const DeepCollectionEquality().hash(_openingHours),ownerId,phoneNumber,waNumber,email,websiteUrl,instagramUrl,facebookUrl,description,const DeepCollectionEquality().hash(_galleryImageUrls),const DeepCollectionEquality().hash(_menuImageUrls),genderPreference]);

@override
String toString() {
  return 'EntityDetail.food(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, name: $name, coverImageUrl: $coverImageUrl, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, streetAddress: $streetAddress, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, ratingBreakdown: $ratingBreakdown, operationalStatus: $operationalStatus, approvalStatus: $approvalStatus, createdAt: $createdAt, updatedAt: $updatedAt, openingHours: $openingHours, ownerId: $ownerId, phoneNumber: $phoneNumber, waNumber: $waNumber, email: $email, websiteUrl: $websiteUrl, instagramUrl: $instagramUrl, facebookUrl: $facebookUrl, description: $description, galleryImageUrls: $galleryImageUrls, menuImageUrls: $menuImageUrls, genderPreference: $genderPreference)';
}


}

/// @nodoc
abstract mixin class $FoodDetailCopyWith<$Res> implements $EntityDetailCopyWith<$Res> {
  factory $FoodDetailCopyWith(FoodDetail value, $Res Function(FoodDetail) _then) = _$FoodDetailCopyWithImpl;
@override @useResult
$Res call({
 EntityId id, CategoryId categoryId, SubCategoryId subCategoryId, String name, String coverImageUrl, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, String streetAddress, double avgRating, int totalReviews, bool isPopular, List<RatingBreakdown> ratingBreakdown, OperationalStatus operationalStatus, ApprovalStatus approvalStatus,@_timestampJsonConverter DateTime createdAt,@_timestampJsonConverter DateTime updatedAt,@_openingHoursConverter Map<DayOfWeek, OpeningHours> openingHours, UserId ownerId, String? phoneNumber, String? waNumber, String? email, String? websiteUrl, String? instagramUrl, String? facebookUrl, String description, List<String> galleryImageUrls, List<String> menuImageUrls, GenderPreference genderPreference
});




}
/// @nodoc
class _$FoodDetailCopyWithImpl<$Res>
    implements $FoodDetailCopyWith<$Res> {
  _$FoodDetailCopyWithImpl(this._self, this._then);

  final FoodDetail _self;
  final $Res Function(FoodDetail) _then;

/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? name = null,Object? coverImageUrl = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? streetAddress = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? ratingBreakdown = null,Object? operationalStatus = null,Object? approvalStatus = null,Object? createdAt = null,Object? updatedAt = null,Object? openingHours = null,Object? ownerId = null,Object? phoneNumber = freezed,Object? waNumber = freezed,Object? email = freezed,Object? websiteUrl = freezed,Object? instagramUrl = freezed,Object? facebookUrl = freezed,Object? description = null,Object? galleryImageUrls = null,Object? menuImageUrls = null,Object? genderPreference = null,}) {
  return _then(FoodDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as EntityId,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as SubCategoryId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,ratingBreakdown: null == ratingBreakdown ? _self._ratingBreakdown : ratingBreakdown // ignore: cast_nullable_to_non_nullable
as List<RatingBreakdown>,operationalStatus: null == operationalStatus ? _self.operationalStatus : operationalStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,openingHours: null == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as Map<DayOfWeek, OpeningHours>,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as UserId,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,waNumber: freezed == waNumber ? _self.waNumber : waNumber // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,facebookUrl: freezed == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,galleryImageUrls: null == galleryImageUrls ? _self._galleryImageUrls : galleryImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,menuImageUrls: null == menuImageUrls ? _self._menuImageUrls : menuImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,genderPreference: null == genderPreference ? _self.genderPreference : genderPreference // ignore: cast_nullable_to_non_nullable
as GenderPreference,
  ));
}


}

// dart format on
