// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_entitiy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchEntity {

@JsonKey(name: 'objectID') EntityId get id; String get name; String get cityName; String get sectorName;
/// Create a copy of SearchEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchEntityCopyWith<SearchEntity> get copyWith => _$SearchEntityCopyWithImpl<SearchEntity>(this as SearchEntity, _$identity);

  /// Serializes this SearchEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cityName,sectorName);

@override
String toString() {
  return 'SearchEntity(id: $id, name: $name, cityName: $cityName, sectorName: $sectorName)';
}


}

/// @nodoc
abstract mixin class $SearchEntityCopyWith<$Res>  {
  factory $SearchEntityCopyWith(SearchEntity value, $Res Function(SearchEntity) _then) = _$SearchEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'objectID') EntityId id, String name, String cityName, String sectorName
});




}
/// @nodoc
class _$SearchEntityCopyWithImpl<$Res>
    implements $SearchEntityCopyWith<$Res> {
  _$SearchEntityCopyWithImpl(this._self, this._then);

  final SearchEntity _self;
  final $Res Function(SearchEntity) _then;

/// Create a copy of SearchEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? cityName = null,Object? sectorName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as EntityId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchEntity].
extension SearchEntityPatterns on SearchEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchEntity value)  $default,){
final _that = this;
switch (_that) {
case _SearchEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SearchEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'objectID')  EntityId id,  String name,  String cityName,  String sectorName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchEntity() when $default != null:
return $default(_that.id,_that.name,_that.cityName,_that.sectorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'objectID')  EntityId id,  String name,  String cityName,  String sectorName)  $default,) {final _that = this;
switch (_that) {
case _SearchEntity():
return $default(_that.id,_that.name,_that.cityName,_that.sectorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'objectID')  EntityId id,  String name,  String cityName,  String sectorName)?  $default,) {final _that = this;
switch (_that) {
case _SearchEntity() when $default != null:
return $default(_that.id,_that.name,_that.cityName,_that.sectorName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchEntity implements SearchEntity {
  const _SearchEntity({@JsonKey(name: 'objectID') required this.id, required this.name, required this.cityName, required this.sectorName});
  factory _SearchEntity.fromJson(Map<String, dynamic> json) => _$SearchEntityFromJson(json);

@override@JsonKey(name: 'objectID') final  EntityId id;
@override final  String name;
@override final  String cityName;
@override final  String sectorName;

/// Create a copy of SearchEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchEntityCopyWith<_SearchEntity> get copyWith => __$SearchEntityCopyWithImpl<_SearchEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,cityName,sectorName);

@override
String toString() {
  return 'SearchEntity(id: $id, name: $name, cityName: $cityName, sectorName: $sectorName)';
}


}

/// @nodoc
abstract mixin class _$SearchEntityCopyWith<$Res> implements $SearchEntityCopyWith<$Res> {
  factory _$SearchEntityCopyWith(_SearchEntity value, $Res Function(_SearchEntity) _then) = __$SearchEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'objectID') EntityId id, String name, String cityName, String sectorName
});




}
/// @nodoc
class __$SearchEntityCopyWithImpl<$Res>
    implements _$SearchEntityCopyWith<$Res> {
  __$SearchEntityCopyWithImpl(this._self, this._then);

  final _SearchEntity _self;
  final $Res Function(_SearchEntity) _then;

/// Create a copy of SearchEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? cityName = null,Object? sectorName = null,}) {
  return _then(_SearchEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as EntityId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
