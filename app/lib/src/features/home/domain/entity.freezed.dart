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

 EntityId get id; CategoryId get categoryId; SubCategoryId get subCategoryId; String get coverImageUrl; String get name; String get cityName; String get sectorName;@_latLngJsonConverter LatLng get latLng; double get avgRating; int get totalReviews; bool get isPopular; List<OpeningHours> get openingHours; OperationalStatus get entityStatus; ApprovalStatus get status;@_timestampJsonConverter DateTime get createdAt; EntityType get type; GenderPreference get genderPref;
/// Create a copy of Entity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntityCopyWith<Entity> get copyWith => _$EntityCopyWithImpl<Entity>(this as Entity, _$identity);

  /// Serializes this Entity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Entity&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other.openingHours, openingHours)&&(identical(other.entityStatus, entityStatus) || other.entityStatus == entityStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(openingHours),entityStatus,status,createdAt,type,genderPref);

@override
String toString() {
  return 'Entity(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, entityStatus: $entityStatus, status: $status, createdAt: $createdAt, type: $type, genderPref: $genderPref)';
}


}

/// @nodoc
abstract mixin class $EntityCopyWith<$Res>  {
  factory $EntityCopyWith(Entity value, $Res Function(Entity) _then) = _$EntityCopyWithImpl;
@useResult
$Res call({
 String id, int categoryId, int subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular, List<OpeningHours> openingHours, OperationalStatus entityStatus, ApprovalStatus status,@_timestampJsonConverter DateTime createdAt, EntityType type, GenderPreference genderPref
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = null,Object? entityStatus = null,Object? status = null,Object? createdAt = null,Object? type = null,Object? genderPref = null,}) {
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
as bool,openingHours: null == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,entityStatus: null == entityStatus ? _self.entityStatus : entityStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntityType,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  double price,  bool isFurnished,  GenderPreference genderPref)?  residence,TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  GenderPreference genderPref)?  food,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Residence() when residence != null:
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.price,_that.isFurnished,_that.genderPref);case Food() when food != null:
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.genderPref);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  double price,  bool isFurnished,  GenderPreference genderPref)  residence,required TResult Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  GenderPreference genderPref)  food,}) {final _that = this;
switch (_that) {
case Residence():
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.price,_that.isFurnished,_that.genderPref);case Food():
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.genderPref);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  double price,  bool isFurnished,  GenderPreference genderPref)?  residence,TResult? Function( EntityId id,  CategoryId categoryId,  SubCategoryId subCategoryId,  String coverImageUrl,  String name,  String cityName,  String sectorName, @_latLngJsonConverter  LatLng latLng,  double avgRating,  int totalReviews,  bool isPopular,  List<OpeningHours> openingHours,  OperationalStatus entityStatus,  ApprovalStatus status, @_timestampJsonConverter  DateTime createdAt,  EntityType type,  GenderPreference genderPref)?  food,}) {final _that = this;
switch (_that) {
case Residence() when residence != null:
return residence(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.price,_that.isFurnished,_that.genderPref);case Food() when food != null:
return food(_that.id,_that.categoryId,_that.subCategoryId,_that.coverImageUrl,_that.name,_that.cityName,_that.sectorName,_that.latLng,_that.avgRating,_that.totalReviews,_that.isPopular,_that.openingHours,_that.entityStatus,_that.status,_that.createdAt,_that.type,_that.genderPref);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class Residence extends Entity {
  const Residence({required this.id, required this.categoryId, required this.subCategoryId, required this.coverImageUrl, required this.name, required this.cityName, required this.sectorName, @_latLngJsonConverter required this.latLng, this.avgRating = 0.0, this.totalReviews = 0, this.isPopular = false, required final  List<OpeningHours> openingHours, this.entityStatus = OperationalStatus.defaultStatus, this.status = ApprovalStatus.pending, @_timestampJsonConverter required this.createdAt, this.type = EntityType.residence, this.price = 0.0, this.isFurnished = false, this.genderPref = GenderPreference.any, final  String? $type}): _openingHours = openingHours,$type = $type ?? 'residence',super._();
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
@JsonKey() final  double price;
@JsonKey() final  bool isFurnished;
@override@JsonKey() final  GenderPreference genderPref;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Residence&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.entityStatus, entityStatus) || other.entityStatus == entityStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(_openingHours),entityStatus,status,createdAt,type,price,isFurnished,genderPref]);

@override
String toString() {
  return 'Entity.residence(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, entityStatus: $entityStatus, status: $status, createdAt: $createdAt, type: $type, price: $price, isFurnished: $isFurnished, genderPref: $genderPref)';
}


}

/// @nodoc
abstract mixin class $ResidenceCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory $ResidenceCopyWith(Residence value, $Res Function(Residence) _then) = _$ResidenceCopyWithImpl;
@override @useResult
$Res call({
 EntityId id, CategoryId categoryId, SubCategoryId subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular, List<OpeningHours> openingHours, OperationalStatus entityStatus, ApprovalStatus status,@_timestampJsonConverter DateTime createdAt, EntityType type, double price, bool isFurnished, GenderPreference genderPref
});




}
/// @nodoc
class _$ResidenceCopyWithImpl<$Res>
    implements $ResidenceCopyWith<$Res> {
  _$ResidenceCopyWithImpl(this._self, this._then);

  final Residence _self;
  final $Res Function(Residence) _then;

/// Create a copy of Entity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = null,Object? entityStatus = null,Object? status = null,Object? createdAt = null,Object? type = null,Object? price = null,Object? isFurnished = null,Object? genderPref = null,}) {
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
as bool,openingHours: null == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,entityStatus: null == entityStatus ? _self.entityStatus : entityStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntityType,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,
  ));
}


}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class Food extends Entity {
  const Food({required this.id, required this.categoryId, required this.subCategoryId, required this.coverImageUrl, required this.name, required this.cityName, required this.sectorName, @_latLngJsonConverter required this.latLng, this.avgRating = 0.0, this.totalReviews = 0, this.isPopular = false, required final  List<OpeningHours> openingHours, this.entityStatus = OperationalStatus.defaultStatus, this.status = ApprovalStatus.pending, @_timestampJsonConverter required this.createdAt, this.type = EntityType.food, this.genderPref = GenderPreference.any, final  String? $type}): _openingHours = openingHours,$type = $type ?? 'food',super._();
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Food&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.coverImageUrl, coverImageUrl) || other.coverImageUrl == coverImageUrl)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.avgRating, avgRating) || other.avgRating == avgRating)&&(identical(other.totalReviews, totalReviews) || other.totalReviews == totalReviews)&&(identical(other.isPopular, isPopular) || other.isPopular == isPopular)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.entityStatus, entityStatus) || other.entityStatus == entityStatus)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.type, type) || other.type == type)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,categoryId,subCategoryId,coverImageUrl,name,cityName,sectorName,latLng,avgRating,totalReviews,isPopular,const DeepCollectionEquality().hash(_openingHours),entityStatus,status,createdAt,type,genderPref);

@override
String toString() {
  return 'Entity.food(id: $id, categoryId: $categoryId, subCategoryId: $subCategoryId, coverImageUrl: $coverImageUrl, name: $name, cityName: $cityName, sectorName: $sectorName, latLng: $latLng, avgRating: $avgRating, totalReviews: $totalReviews, isPopular: $isPopular, openingHours: $openingHours, entityStatus: $entityStatus, status: $status, createdAt: $createdAt, type: $type, genderPref: $genderPref)';
}


}

/// @nodoc
abstract mixin class $FoodCopyWith<$Res> implements $EntityCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) _then) = _$FoodCopyWithImpl;
@override @useResult
$Res call({
 EntityId id, CategoryId categoryId, SubCategoryId subCategoryId, String coverImageUrl, String name, String cityName, String sectorName,@_latLngJsonConverter LatLng latLng, double avgRating, int totalReviews, bool isPopular, List<OpeningHours> openingHours, OperationalStatus entityStatus, ApprovalStatus status,@_timestampJsonConverter DateTime createdAt, EntityType type, GenderPreference genderPref
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? subCategoryId = null,Object? coverImageUrl = null,Object? name = null,Object? cityName = null,Object? sectorName = null,Object? latLng = null,Object? avgRating = null,Object? totalReviews = null,Object? isPopular = null,Object? openingHours = null,Object? entityStatus = null,Object? status = null,Object? createdAt = null,Object? type = null,Object? genderPref = null,}) {
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
as List<OpeningHours>,entityStatus: null == entityStatus ? _self.entityStatus : entityStatus // ignore: cast_nullable_to_non_nullable
as OperationalStatus,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ApprovalStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EntityType,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,
  ));
}


}

// dart format on
