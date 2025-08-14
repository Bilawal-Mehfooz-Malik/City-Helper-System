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

 EntityId get id; CategoryId get categoryId; SubCategoryId get subCategoryId; String get coverImageUrl; String get name; String get cityName; String get sectorName;@_latLngJsonConverter LatLng get latLng; double get avgRating; int get totalReviews; bool get isPopular; List<OpeningHours>? get openingHours; OperationalStatus? get entityStatus; ApprovalStatus get status;@_timestampJsonConverter DateTime get createdAt; EntityType get type; GenderPreference? get genderPref;// Detail fields
 UserId get ownerId; String get description; List<String> get galleryImageUrls; String get streetAddress; List<RatingBreakdown> get ratingBreakdown; String? get phoneNumber; String? get messagingNumber;@_timestampJsonConverter DateTime get updatedAt; String? get websiteUrl; String? get instagramUrl; String? get facebookUrl; String? get email;
/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntityDetailCopyWith<EntityDetail> get copyWith => _$EntityDetailCopyWithImpl<EntityDetail>(this as EntityDetail, _$identity);

  /// Serializes this EntityDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntityDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other.openingHours, openingHours)&&(identical(other.entityStatus, entityStatus) || other.entityStatus == entityStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.galleryImageUrls, galleryImageUrls)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&const DeepCollectionEquality().equals(other.ratingBreakdown, ratingBreakdown)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.messagingNumber, messagingNumber) || other.messagingNumber == messagingNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(openingHours),entityStatus,status,createdAt,type,genderPref,ownerId,description,const DeepCollectionEquality().hash(galleryImageUrls),streetAddress,const DeepCollectionEquality().hash(ratingBreakdown),phoneNumber,messagingNumber,updatedAt,websiteUrl,instagramUrl,facebookUrl,email]);

@override
String toString() {
  return 'EntityDetail(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, entityStatus: $entityStatus, status: $status, createdAt: $createdAt, type: $type, genderPref: $genderPref, ownerId: $ownerId, description: $description, galleryImageUrls: $galleryImageUrls, streetAddress: $streetAddress, ratingBreakdown: $ratingBreakdown, phoneNumber: $phoneNumber, messagingNumber: $messagingNumber, updatedAt: $updatedAt, websiteUrl: $websiteUrl, instagramUrl: $instagramUrl, facebookUrl: $facebookUrl, email: $email)';
}


}

/// @nodoc
abstract mixin class $EntityDetailCopyWith<$Res>  {
  factory $EntityDetailCopyWith(EntityDetail value, $Res Function(EntityDetail) _then) = _$EntityDetailCopyWithImpl;
@useResult
$Res call({
 String id, int categoryId, int subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular, List<OpeningHours> openingHours, OperationalStatus entityStatus, ApprovalStatus status,@_timestampJsonConverter DateTime createdAt, EntityType type, GenderPreference genderPref, String ownerId, String description, List<String> galleryImageUrls, String streetAddress, List<RatingBreakdown> ratingBreakdown, String? phoneNumber, String? messagingNumber,@_timestampJsonConverter DateTime updatedAt, String? websiteUrl, String? instagramUrl, String? facebookUrl, String? email
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = null,Object? entityStatus = null,Object? status = null,Object? createdAt = null,Object? type = null,Object? genderPref = null,Object? ownerId = null,Object? description = null,Object? galleryImageUrls = null,Object? streetAddress = null,Object? ratingBreakdown = null,Object? phoneNumber = freezed,Object? messagingNumber = freezed,Object? updatedAt = null,Object? websiteUrl = freezed,Object? instagramUrl = freezed,Object? facebookUrl = freezed,Object? email = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,openingHours: null == openingHours ? _self.openingHours! : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,entityStatus: null == entityStatus ? _self.entityStatus! : entityStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntityType,genderPref: null == genderPref ? _self.genderPref! : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,galleryImageUrls: null == galleryImageUrls ? _self.galleryImageUrls : galleryImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,ratingBreakdown: null == ratingBreakdown ? _self.ratingBreakdown : ratingBreakdown // ignore: cast_nullable_to_non_nullable
as List<RatingBreakdown>,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,messagingNumber: freezed == messagingNumber ? _self.messagingNumber : messagingNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,facebookUrl: freezed == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours>? openingHours,  OperationalStatus? entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  double pricing,  bool isFurnished,  GenderPreference? genderPref,  ListingType listingType,  UserId ownerId,  String description,  List<String> galleryImageUrls,  String streetAddress,  List<RatingBreakdown> ratingBreakdown,  String? phoneNumber,  String? messagingNumber, @_timestampJsonConverter  DateTime updatedAt,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String? email)?  residence,TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  GenderPreference genderPref,  UserId ownerId,  String description,  List<String> galleryImageUrls,  String streetAddress,  List<RatingBreakdown> ratingBreakdown,  String? phoneNumber,  String? messagingNumber, @_timestampJsonConverter  DateTime updatedAt,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String? email)?  food,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ResidenceDetail() when residence != null:
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.pricing,_that.isFurnished,_that.genderPref,_that.listingType,_that.ownerId,_that.description,_that.galleryImageUrls,_that.streetAddress,_that.ratingBreakdown,_that.phoneNumber,_that.messagingNumber,_that.updatedAt,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.email);case FoodDetail() when food != null:
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.genderPref,_that.ownerId,_that.description,_that.galleryImageUrls,_that.streetAddress,_that.ratingBreakdown,_that.phoneNumber,_that.messagingNumber,_that.updatedAt,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours>? openingHours,  OperationalStatus? entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  double pricing,  bool isFurnished,  GenderPreference? genderPref,  ListingType listingType,  UserId ownerId,  String description,  List<String> galleryImageUrls,  String streetAddress,  List<RatingBreakdown> ratingBreakdown,  String? phoneNumber,  String? messagingNumber, @_timestampJsonConverter  DateTime updatedAt,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String? email)  residence,required TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  GenderPreference genderPref,  UserId ownerId,  String description,  List<String> galleryImageUrls,  String streetAddress,  List<RatingBreakdown> ratingBreakdown,  String? phoneNumber,  String? messagingNumber, @_timestampJsonConverter  DateTime updatedAt,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String? email)  food,}) {final _that = this;
switch (_that) {
case ResidenceDetail():
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.pricing,_that.isFurnished,_that.genderPref,_that.listingType,_that.ownerId,_that.description,_that.galleryImageUrls,_that.streetAddress,_that.ratingBreakdown,_that.phoneNumber,_that.messagingNumber,_that.updatedAt,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.email);case FoodDetail():
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.genderPref,_that.ownerId,_that.description,_that.galleryImageUrls,_that.streetAddress,_that.ratingBreakdown,_that.phoneNumber,_that.messagingNumber,_that.updatedAt,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.email);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours>? openingHours,  OperationalStatus? entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  double pricing,  bool isFurnished,  GenderPreference? genderPref,  ListingType listingType,  UserId ownerId,  String description,  List<String> galleryImageUrls,  String streetAddress,  List<RatingBreakdown> ratingBreakdown,  String? phoneNumber,  String? messagingNumber, @_timestampJsonConverter  DateTime updatedAt,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String? email)?  residence,TResult? Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  GenderPreference genderPref,  UserId ownerId,  String description,  List<String> galleryImageUrls,  String streetAddress,  List<RatingBreakdown> ratingBreakdown,  String? phoneNumber,  String? messagingNumber, @_timestampJsonConverter  DateTime updatedAt,  String? websiteUrl,  String? instagramUrl,  String? facebookUrl,  String? email)?  food,}) {final _that = this;
switch (_that) {
case ResidenceDetail() when residence != null:
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.pricing,_that.isFurnished,_that.genderPref,_that.listingType,_that.ownerId,_that.description,_that.galleryImageUrls,_that.streetAddress,_that.ratingBreakdown,_that.phoneNumber,_that.messagingNumber,_that.updatedAt,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.email);case FoodDetail() when food != null:
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.genderPref,_that.ownerId,_that.description,_that.galleryImageUrls,_that.streetAddress,_that.ratingBreakdown,_that.phoneNumber,_that.messagingNumber,_that.updatedAt,_that.websiteUrl,_that.instagramUrl,_that.facebookUrl,_that.email);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class ResidenceDetail extends EntityDetail {
  const ResidenceDetail({required this.id, required this.categoryId, required this.subCategoryId, required this.coverImageUrl, required this.name, required this.cityName, required this.sectorName, @_latLngJsonConverter required this.latLng, this.avgRating = 0.0, this.totalReviews = 0, this.isPopular = false, final  List<OpeningHours>? openingHours, this.entityStatus, this.status = ApprovalStatus.pending, @_timestampJsonConverter required this.createdAt, this.type = EntityType.residence, required this.pricing, this.isFurnished = false, this.genderPref, this.listingType = ListingType.forRent, required this.ownerId, required this.description, required final  List<String> galleryImageUrls, required this.streetAddress, final  List<RatingBreakdown> ratingBreakdown = const [], this.phoneNumber, this.messagingNumber, @_timestampJsonConverter required this.updatedAt, this.websiteUrl, this.instagramUrl, this.facebookUrl, this.email, final  String? $type}): _openingHours = openingHours,_galleryImageUrls = galleryImageUrls,_ratingBreakdown = ratingBreakdown,$type = $type ?? 'residence',super._();
  factory ResidenceDetail.fromJson(Map<String, dynamic> json) => _$ResidenceDetailFromJson(json);

@override final  EntityId id;
@override final  CategoryId categoryId;
@override final  SubCategoryId subCategoryId;
@override final  String coverImageUrl;
@override final  String name;
@override final  String cityName;
@override final  String sectorName;
@override@_latLngJsonConverter final  LatLng latLng;
@override@JsonKey() final  double avgRating;
@override@JsonKey() final  int totalReviews;
@override@JsonKey() final  bool isPopular;
 final  List<OpeningHours>? _openingHours;
@override List<OpeningHours>? get openingHours {
  final value = _openingHours;
  if (value == null) return null;
  if (_openingHours is EqualUnmodifiableListView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  OperationalStatus? entityStatus;
@override@JsonKey() final  ApprovalStatus status;
@override@_timestampJsonConverter final  DateTime createdAt;
@override@JsonKey() final  EntityType type;
 final  double pricing;
@JsonKey() final  bool isFurnished;
@override final  GenderPreference? genderPref;
@JsonKey() final  ListingType listingType;
// Detail fields
@override final  UserId ownerId;
@override final  String description;
 final  List<String> _galleryImageUrls;
@override List<String> get galleryImageUrls {
  if (_galleryImageUrls is EqualUnmodifiableListView) return _galleryImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImageUrls);
}

@override final  String streetAddress;
 final  List<RatingBreakdown> _ratingBreakdown;
@override@JsonKey() List<RatingBreakdown> get ratingBreakdown {
  if (_ratingBreakdown is EqualUnmodifiableListView) return _ratingBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratingBreakdown);
}

@override final  String? phoneNumber;
@override final  String? messagingNumber;
@override@_timestampJsonConverter final  DateTime updatedAt;
@override final  String? websiteUrl;
@override final  String? instagramUrl;
@override final  String? facebookUrl;
@override final  String? email;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidenceDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.entityStatus, entityStatus) || other.entityStatus == entityStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.pricing, pricing) || other.pricing == pricing)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&(identical(other.listingType, listingType) || other.listingType == listingType)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._galleryImageUrls, _galleryImageUrls)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&const DeepCollectionEquality().equals(other._ratingBreakdown, _ratingBreakdown)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.messagingNumber, messagingNumber) || other.messagingNumber == messagingNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(_openingHours),entityStatus,status,createdAt,type,pricing,isFurnished,genderPref,listingType,ownerId,description,const DeepCollectionEquality().hash(_galleryImageUrls),streetAddress,const DeepCollectionEquality().hash(_ratingBreakdown),phoneNumber,messagingNumber,updatedAt,websiteUrl,instagramUrl,facebookUrl,email]);

@override
String toString() {
  return 'EntityDetail.residence(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, entityStatus: $entityStatus, status: $status, createdAt: $createdAt, type: $type, pricing: $pricing, isFurnished: $isFurnished, genderPref: $genderPref, listingType: $listingType, ownerId: $ownerId, description: $description, galleryImageUrls: $galleryImageUrls, streetAddress: $streetAddress, ratingBreakdown: $ratingBreakdown, phoneNumber: $phoneNumber, messagingNumber: $messagingNumber, updatedAt: $updatedAt, websiteUrl: $websiteUrl, instagramUrl: $instagramUrl, facebookUrl: $facebookUrl, email: $email)';
}


}

/// @nodoc
abstract mixin class $ResidenceDetailCopyWith<$Res> implements $EntityDetailCopyWith<$Res> {
  factory $ResidenceDetailCopyWith(ResidenceDetail value, $Res Function(ResidenceDetail) _then) = _$ResidenceDetailCopyWithImpl;
@override @useResult
$Res call({
 EntityId id, CategoryId categoryId, SubCategoryId subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular, List<OpeningHours>? openingHours, OperationalStatus? entityStatus, ApprovalStatus status,@_timestampJsonConverter DateTime createdAt, EntityType type, double pricing, bool isFurnished, GenderPreference? genderPref, ListingType listingType, UserId ownerId, String description, List<String> galleryImageUrls, String streetAddress, List<RatingBreakdown> ratingBreakdown, String? phoneNumber, String? messagingNumber,@_timestampJsonConverter DateTime updatedAt, String? websiteUrl, String? instagramUrl, String? facebookUrl, String? email
});




}
/// @nodoc
class _$ResidenceDetailCopyWithImpl<$Res>
    implements $ResidenceDetailCopyWith<$Res> {
  _$ResidenceDetailCopyWithImpl(this._self, this._then);

  final ResidenceDetail _self;
  final $Res Function(ResidenceDetail) _then;

/// Create a copy of EntityDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = freezed,Object? entityStatus = freezed,Object? status = null,Object? createdAt = null,Object? type = null,Object? pricing = null,Object? isFurnished = null,Object? genderPref = freezed,Object? listingType = null,Object? ownerId = null,Object? description = null,Object? galleryImageUrls = null,Object? streetAddress = null,Object? ratingBreakdown = null,Object? phoneNumber = freezed,Object? messagingNumber = freezed,Object? updatedAt = null,Object? websiteUrl = freezed,Object? instagramUrl = freezed,Object? facebookUrl = freezed,Object? email = freezed,}) {
  return _then(ResidenceDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as EntityId,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as SubCategoryId,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,openingHours: freezed == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>?,entityStatus: freezed == entityStatus ? _self.entityStatus : entityStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntityType,pricing: null == pricing ? _self.pricing : pricing // ignore: cast_nullable_to_non_nullable
as double,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,genderPref: freezed == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference?,listingType: null == listingType ? _self.listingType : listingType // ignore: cast_nullable_to_non_nullable
as ListingType,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as UserId,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,galleryImageUrls: null == galleryImageUrls ? _self._galleryImageUrls : galleryImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,ratingBreakdown: null == ratingBreakdown ? _self._ratingBreakdown : ratingBreakdown // ignore: cast_nullable_to_non_nullable
as List<RatingBreakdown>,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,messagingNumber: freezed == messagingNumber ? _self.messagingNumber : messagingNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,facebookUrl: freezed == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class FoodDetail extends EntityDetail {
  const FoodDetail({required this.id, required this.categoryId, required this.subCategoryId, required this.coverImageUrl, required this.name, required this.cityName, required this.sectorName, @_latLngJsonConverter required this.latLng, this.avgRating = 0.0, this.totalReviews = 0, this.isPopular = false, required final  List<OpeningHours> openingHours, this.entityStatus = OperationalStatus.defaultStatus, this.status = ApprovalStatus.pending, @_timestampJsonConverter required this.createdAt, this.type = EntityType.food, this.genderPref = GenderPreference.any, required this.ownerId, required this.description, required final  List<String> galleryImageUrls, required this.streetAddress, final  List<RatingBreakdown> ratingBreakdown = const [], this.phoneNumber, this.messagingNumber, @_timestampJsonConverter required this.updatedAt, this.websiteUrl, this.instagramUrl, this.facebookUrl, this.email, final  String? $type}): _openingHours = openingHours,_galleryImageUrls = galleryImageUrls,_ratingBreakdown = ratingBreakdown,$type = $type ?? 'food',super._();
  factory FoodDetail.fromJson(Map<String, dynamic> json) => _$FoodDetailFromJson(json);

@override final  EntityId id;
@override final  CategoryId categoryId;
@override final  SubCategoryId subCategoryId;
@override final  String coverImageUrl;
@override final  String name;
@override final  String cityName;
@override final  String sectorName;
@override@_latLngJsonConverter final  LatLng latLng;
@override@JsonKey() final  double avgRating;
@override@JsonKey() final  int totalReviews;
@override@JsonKey() final  bool isPopular;
 final  List<OpeningHours> _openingHours;
@override List<OpeningHours> get openingHours {
  if (_openingHours is EqualUnmodifiableListView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_openingHours);
}

@override@JsonKey() final  OperationalStatus entityStatus;
@override@JsonKey() final  ApprovalStatus status;
@override@_timestampJsonConverter final  DateTime createdAt;
@override@JsonKey() final  EntityType type;
@override@JsonKey() final  GenderPreference genderPref;
// Detail fields
@override final  UserId ownerId;
@override final  String description;
 final  List<String> _galleryImageUrls;
@override List<String> get galleryImageUrls {
  if (_galleryImageUrls is EqualUnmodifiableListView) return _galleryImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImageUrls);
}

@override final  String streetAddress;
 final  List<RatingBreakdown> _ratingBreakdown;
@override@JsonKey() List<RatingBreakdown> get ratingBreakdown {
  if (_ratingBreakdown is EqualUnmodifiableListView) return _ratingBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratingBreakdown);
}

@override final  String? phoneNumber;
@override final  String? messagingNumber;
@override@_timestampJsonConverter final  DateTime updatedAt;
@override final  String? websiteUrl;
@override final  String? instagramUrl;
@override final  String? facebookUrl;
@override final  String? email;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.entityStatus, entityStatus) || other.entityStatus == entityStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._galleryImageUrls, _galleryImageUrls)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&const DeepCollectionEquality().equals(other._ratingBreakdown, _ratingBreakdown)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.messagingNumber, messagingNumber) || other.messagingNumber == messagingNumber)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(_openingHours),entityStatus,status,createdAt,type,genderPref,ownerId,description,const DeepCollectionEquality().hash(_galleryImageUrls),streetAddress,const DeepCollectionEquality().hash(_ratingBreakdown),phoneNumber,messagingNumber,updatedAt,websiteUrl,instagramUrl,facebookUrl,email]);

@override
String toString() {
  return 'EntityDetail.food(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, entityStatus: $entityStatus, status: $status, createdAt: $createdAt, type: $type, genderPref: $genderPref, ownerId: $ownerId, description: $description, galleryImageUrls: $galleryImageUrls, streetAddress: $streetAddress, ratingBreakdown: $ratingBreakdown, phoneNumber: $phoneNumber, messagingNumber: $messagingNumber, updatedAt: $updatedAt, websiteUrl: $websiteUrl, instagramUrl: $instagramUrl, facebookUrl: $facebookUrl, email: $email)';
}


}

/// @nodoc
abstract mixin class $FoodDetailCopyWith<$Res> implements $EntityDetailCopyWith<$Res> {
  factory $FoodDetailCopyWith(FoodDetail value, $Res Function(FoodDetail) _then) = _$FoodDetailCopyWithImpl;
@override @useResult
$Res call({
 EntityId id, CategoryId categoryId, SubCategoryId subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular, List<OpeningHours> openingHours, OperationalStatus entityStatus, ApprovalStatus status,@_timestampJsonConverter DateTime createdAt, EntityType type, GenderPreference genderPref, UserId ownerId, String description, List<String> galleryImageUrls, String streetAddress, List<RatingBreakdown> ratingBreakdown, String? phoneNumber, String? messagingNumber,@_timestampJsonConverter DateTime updatedAt, String? websiteUrl, String? instagramUrl, String? facebookUrl, String? email
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = null,Object? entityStatus = null,Object? status = null,Object? createdAt = null,Object? type = null,Object? genderPref = null,Object? ownerId = null,Object? description = null,Object? galleryImageUrls = null,Object? streetAddress = null,Object? ratingBreakdown = null,Object? phoneNumber = freezed,Object? messagingNumber = freezed,Object? updatedAt = null,Object? websiteUrl = freezed,Object? instagramUrl = freezed,Object? facebookUrl = freezed,Object? email = freezed,}) {
  return _then(FoodDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as EntityId,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as SubCategoryId,coverImageUrl: null == coverImageUrl ? _self.coverImageUrl : coverImageUrl // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,latLng: null == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng,avgRating: null == avgRating ? _self.avgRating : avgRating // ignore: cast_nullable_to_non_nullable
as double,totalReviews: null == totalReviews ? _self.totalReviews : totalReviews // ignore: cast_nullable_to_non_nullable
as int,isPopular: null == isPopular ? _self.isPopular : isPopular // ignore: cast_nullable_to_non_nullable
as bool,openingHours: null == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,entityStatus: null == entityStatus ? _self.entityStatus : entityStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntityType,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as UserId,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,galleryImageUrls: null == galleryImageUrls ? _self._galleryImageUrls : galleryImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,ratingBreakdown: null == ratingBreakdown ? _self._ratingBreakdown : ratingBreakdown // ignore: cast_nullable_to_non_nullable
as List<RatingBreakdown>,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,messagingNumber: freezed == messagingNumber ? _self.messagingNumber : messagingNumber // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,websiteUrl: freezed == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,facebookUrl: freezed == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
