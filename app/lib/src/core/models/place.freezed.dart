// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Place {

 EntityId get id; String get name; GeoLocation? get geoLocation; String? get streetAddress;
/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceCopyWith<Place> get copyWith => _$PlaceCopyWithImpl<Place>(this as Place, _$identity);

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Place&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.geoLocation, geoLocation) || other.geoLocation == geoLocation)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,geoLocation,streetAddress);

@override
String toString() {
  return 'Place(id: $id, name: $name, geoLocation: $geoLocation, streetAddress: $streetAddress)';
}


}

/// @nodoc
abstract mixin class $PlaceCopyWith<$Res>  {
  factory $PlaceCopyWith(Place value, $Res Function(Place) _then) = _$PlaceCopyWithImpl;
@useResult
$Res call({
 String id, String name, GeoLocation? geoLocation, String? streetAddress
});


$GeoLocationCopyWith<$Res>? get geoLocation;

}
/// @nodoc
class _$PlaceCopyWithImpl<$Res>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._self, this._then);

  final Place _self;
  final $Res Function(Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? geoLocation = freezed,Object? streetAddress = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id! : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,geoLocation: freezed == geoLocation ? _self.geoLocation : geoLocation // ignore: cast_nullable_to_non_nullable
as GeoLocation?,streetAddress: freezed == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<$Res>? get geoLocation {
    if (_self.geoLocation == null) {
    return null;
  }

  return $GeoLocationCopyWith<$Res>(_self.geoLocation!, (value) {
    return _then(_self.copyWith(geoLocation: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Place implements Place {
  const _Place({required this.id, required this.name, this.geoLocation, this.streetAddress});
  factory _Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

@override final  String id;
@override final  String name;
@override final  GeoLocation? geoLocation;
@override final  String? streetAddress;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceCopyWith<_Place> get copyWith => __$PlaceCopyWithImpl<_Place>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Place&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.geoLocation, geoLocation) || other.geoLocation == geoLocation)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,geoLocation,streetAddress);

@override
String toString() {
  return 'Place(id: $id, name: $name, geoLocation: $geoLocation, streetAddress: $streetAddress)';
}


}

/// @nodoc
abstract mixin class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) _then) = __$PlaceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, GeoLocation? geoLocation, String? streetAddress
});


@override $GeoLocationCopyWith<$Res>? get geoLocation;

}
/// @nodoc
class __$PlaceCopyWithImpl<$Res>
    implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(this._self, this._then);

  final _Place _self;
  final $Res Function(_Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? geoLocation = freezed,Object? streetAddress = freezed,}) {
  return _then(_Place(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,geoLocation: freezed == geoLocation ? _self.geoLocation : geoLocation // ignore: cast_nullable_to_non_nullable
as GeoLocation?,streetAddress: freezed == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeoLocationCopyWith<$Res>? get geoLocation {
    if (_self.geoLocation == null) {
    return null;
  }

  return $GeoLocationCopyWith<$Res>(_self.geoLocation!, (value) {
    return _then(_self.copyWith(geoLocation: value));
  });
}
}

// dart format on
