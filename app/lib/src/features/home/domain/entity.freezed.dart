// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
Entity _$EntityFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'residence':
          return Residence.fromJson(
            json
          );
                case 'food':
          return Food.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'Entity',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$Entity {

 EntityId get id; CategoryId get categoryId; SubCategoryId get subCategoryId; String get coverImageUrl; String get name; String get cityName; String get sectorName;@_latLngJsonConverter LatLng get latLng; double get avgRating; int get totalReviews; bool get isPopular;@_openingHoursConverter Map<DayOfWeek, OpeningHours>? get openingHours; ApprovalStatus get approvalStatus; GenderPreference get genderPref;@_timestampJsonConverter DateTime get updatedAt;
/// Create a copy of Entity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntityCopyWith<Entity> get copyWith => _$EntityCopyWithImpl<Entity>(this as Entity, _$identity);

  /// Serializes this Entity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Entity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other.openingHours, openingHours)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(openingHours),approvalStatus,genderPref,updatedAt);

@override
String toString() {
  return 'Entity(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, approvalStatus: $approvalStatus, genderPref: $genderPref, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EntityCopyWith<$Res>  {
  factory $EntityCopyWith(Entity value, $Res Function(Entity) _then) = _$EntityCopyWithImpl;
@useResult
$Res call({
 String id, int categoryId, int subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular,@_openingHoursConverter Map<DayOfWeek, OpeningHours> openingHours, ApprovalStatus approvalStatus, GenderPreference genderPref,@_timestampJsonConverter DateTime updatedAt
});




}
/// @nodoc
class _$EntityCopyWithImpl<$Res>
    implements $EntityCopyWith<$Res> {
  _$EntityCopyWithImpl(this._self, this._then);

  final Entity _self;
  final $Res Function(Entity) _then;

/// Create a copy of Entity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = null,Object? approvalStatus = null,Object? genderPref = null,Object? updatedAt = null,}) {
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
as Map<DayOfWeek, OpeningHours>,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Entity].
extension EntityPatterns on Entity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Residence value)?  residence,TResult Function( Food value)?  food,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Residence() when residence != null:
return residence(_that);case Food() when food != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Residence value)  residence,required TResult Function( Food value)  food,}){
final _that = this;
switch (_that) {
case Residence():
return residence(_that);case Food():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Residence value)?  residence,TResult? Function( Food value)?  food,}){
final _that = this;
switch (_that) {
case Residence() when residence != null:
return residence(_that);case Food() when food != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular, @_openingHoursConverter  Map<DayOfWeek, OpeningHours>? openingHours,  ApprovalStatus approvalStatus,  Pricing pricing,  bool isFurnished,  GenderPreference genderPref,  ListingType listingType,  bool isRoomAvailable, @_timestampJsonConverter  DateTime updatedAt)?  residence,TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular, @_openingHoursConverter  Map<DayOfWeek, OpeningHours> openingHours,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus,  GenderPreference genderPref, @_timestampJsonConverter  DateTime updatedAt)?  food,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Residence() when residence != null:
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.approvalStatus,_that.pricing,_that.isFurnished,_that.genderPref,_that.listingType,_that.isRoomAvailable,_that.updatedAt);case Food() when food != null:
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.operationalStatus,_that.approvalStatus,_that.genderPref,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular, @_openingHoursConverter  Map<DayOfWeek, OpeningHours>? openingHours,  ApprovalStatus approvalStatus,  Pricing pricing,  bool isFurnished,  GenderPreference genderPref,  ListingType listingType,  bool isRoomAvailable, @_timestampJsonConverter  DateTime updatedAt)  residence,required TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular, @_openingHoursConverter  Map<DayOfWeek, OpeningHours> openingHours,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus,  GenderPreference genderPref, @_timestampJsonConverter  DateTime updatedAt)  food,}) {final _that = this;
switch (_that) {
case Residence():
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.approvalStatus,_that.pricing,_that.isFurnished,_that.genderPref,_that.listingType,_that.isRoomAvailable,_that.updatedAt);case Food():
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.operationalStatus,_that.approvalStatus,_that.genderPref,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular, @_openingHoursConverter  Map<DayOfWeek, OpeningHours>? openingHours,  ApprovalStatus approvalStatus,  Pricing pricing,  bool isFurnished,  GenderPreference genderPref,  ListingType listingType,  bool isRoomAvailable, @_timestampJsonConverter  DateTime updatedAt)?  residence,TResult? Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular, @_openingHoursConverter  Map<DayOfWeek, OpeningHours> openingHours,  OperationalStatus operationalStatus,  ApprovalStatus approvalStatus,  GenderPreference genderPref, @_timestampJsonConverter  DateTime updatedAt)?  food,}) {final _that = this;
switch (_that) {
case Residence() when residence != null:
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.approvalStatus,_that.pricing,_that.isFurnished,_that.genderPref,_that.listingType,_that.isRoomAvailable,_that.updatedAt);case Food() when food != null:
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.operationalStatus,_that.approvalStatus,_that.genderPref,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class Residence extends Entity {
  const Residence({required this.id, required this.categoryId, required this.subCategoryId, required this.coverImageUrl, required this.name, required this.cityName, required this.sectorName, @_latLngJsonConverter required this.latLng, this.avgRating = 0.0, this.totalReviews = 0, this.isPopular = false, @_openingHoursConverter final  Map<DayOfWeek, OpeningHours>? openingHours, this.approvalStatus = ApprovalStatus.pending, required this.pricing, this.isFurnished = false, this.genderPref = GenderPreference.familyFriendly, this.listingType = ListingType.forRent, this.isRoomAvailable = true, @_timestampJsonConverter required this.updatedAt, final  String? $type}): _openingHours = openingHours,$type = $type ?? 'residence',super._();
  factory Residence.fromJson(Map<String, dynamic> json) => _$ResidenceFromJson(json);

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
 final  Map<DayOfWeek, OpeningHours>? _openingHours;
@override@_openingHoursConverter Map<DayOfWeek, OpeningHours>? get openingHours {
  final value = _openingHours;
  if (value == null) return null;
  if (_openingHours is EqualUnmodifiableMapView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  ApprovalStatus approvalStatus;
 final  Pricing pricing;
@JsonKey() final  bool isFurnished;
@override@JsonKey() final  GenderPreference genderPref;
@JsonKey() final  ListingType listingType;
@JsonKey() final  bool isRoomAvailable;
@override@_timestampJsonConverter final  DateTime updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Entity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidenceCopyWith<Residence> get copyWith => _$ResidenceCopyWithImpl<Residence>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidenceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Residence&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.pricing, pricing) || other.pricing == pricing)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&(identical(other.listingType, listingType) || other.listingType == listingType)&&(identical(other.isRoomAvailable, isRoomAvailable) || other.isRoomAvailable == isRoomAvailable)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(_openingHours),approvalStatus,pricing,isFurnished,genderPref,listingType,isRoomAvailable,updatedAt]);

@override
String toString() {
  return 'Entity.residence(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, approvalStatus: $approvalStatus, pricing: $pricing, isFurnished: $isFurnished, genderPref: $genderPref, listingType: $listingType, isRoomAvailable: $isRoomAvailable, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ResidenceCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory $ResidenceCopyWith(Residence value, $Res Function(Residence) _then) = _$ResidenceCopyWithImpl;
@override @useResult
$Res call({
 EntityId id, CategoryId categoryId, SubCategoryId subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular,@_openingHoursConverter Map<DayOfWeek, OpeningHours>? openingHours, ApprovalStatus approvalStatus, Pricing pricing, bool isFurnished, GenderPreference genderPref, ListingType listingType, bool isRoomAvailable,@_timestampJsonConverter DateTime updatedAt
});


$PricingCopyWith<$Res> get pricing;

}
/// @nodoc
class _$ResidenceCopyWithImpl<$Res>
    implements $ResidenceCopyWith<$Res> {
  _$ResidenceCopyWithImpl(this._self, this._then);

  final Residence _self;
  final $Res Function(Residence) _then;

/// Create a copy of Entity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = freezed,Object? approvalStatus = null,Object? pricing = null,Object? isFurnished = null,Object? genderPref = null,Object? listingType = null,Object? isRoomAvailable = null,Object? updatedAt = null,}) {
  return _then(Residence(
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
as Map<DayOfWeek, OpeningHours>?,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,pricing: null == pricing ? _self.pricing : pricing // ignore: cast_nullable_to_non_nullable
as Pricing,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,listingType: null == listingType ? _self.listingType : listingType // ignore: cast_nullable_to_non_nullable
as ListingType,isRoomAvailable: null == isRoomAvailable ? _self.isRoomAvailable : isRoomAvailable // ignore: cast_nullable_to_non_nullable
as bool,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Entity
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
class Food extends Entity {
  const Food({required this.id, required this.categoryId, required this.subCategoryId, required this.coverImageUrl, required this.name, required this.cityName, required this.sectorName, @_latLngJsonConverter required this.latLng, this.avgRating = 0.0, this.totalReviews = 0, this.isPopular = false, @_openingHoursConverter required final  Map<DayOfWeek, OpeningHours> openingHours, this.operationalStatus = OperationalStatus.defaultStatus, this.approvalStatus = ApprovalStatus.pending, this.genderPref = GenderPreference.any, @_timestampJsonConverter required this.updatedAt, final  String? $type}): _openingHours = openingHours,$type = $type ?? 'food',super._();
  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

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
 final  Map<DayOfWeek, OpeningHours> _openingHours;
@override@_openingHoursConverter Map<DayOfWeek, OpeningHours> get openingHours {
  if (_openingHours is EqualUnmodifiableMapView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_openingHours);
}

@JsonKey() final  OperationalStatus operationalStatus;
@override@JsonKey() final  ApprovalStatus approvalStatus;
@override@JsonKey() final  GenderPreference genderPref;
@override@_timestampJsonConverter final  DateTime updatedAt;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of Entity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodCopyWith<Food> get copyWith => _$FoodCopyWithImpl<Food>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Food&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.operationalStatus, operationalStatus) || other.operationalStatus == operationalStatus)&&(identical(other.approvalStatus, approvalStatus) || other.approvalStatus == approvalStatus)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(_openingHours),operationalStatus,approvalStatus,genderPref,updatedAt);

@override
String toString() {
  return 'Entity.food(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, operationalStatus: $operationalStatus, approvalStatus: $approvalStatus, genderPref: $genderPref, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FoodCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) _then) = _$FoodCopyWithImpl;
@override @useResult
$Res call({
 EntityId id, CategoryId categoryId, SubCategoryId subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular,@_openingHoursConverter Map<DayOfWeek, OpeningHours> openingHours, OperationalStatus operationalStatus, ApprovalStatus approvalStatus, GenderPreference genderPref,@_timestampJsonConverter DateTime updatedAt
});




}
/// @nodoc
class _$FoodCopyWithImpl<$Res>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._self, this._then);

  final Food _self;
  final $Res Function(Food) _then;

/// Create a copy of Entity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = null,Object? operationalStatus = null,Object? approvalStatus = null,Object? genderPref = null,Object? updatedAt = null,}) {
  return _then(Food(
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
as Map<DayOfWeek, OpeningHours>,operationalStatus: null == operationalStatus ? _self.operationalStatus : operationalStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,approvalStatus: null == approvalStatus ? _self.approvalStatus : approvalStatus // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
