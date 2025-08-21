// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'opening_hours.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpeningHours {

 bool get isDayOff; bool get is24Hours; List<TimeSlot> get slots;
/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpeningHoursCopyWith<OpeningHours> get copyWith => _$OpeningHoursCopyWithImpl<OpeningHours>(this as OpeningHours, _$identity);

  /// Serializes this OpeningHours to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpeningHours&&(identical(other.isDayOff, isDayOff) || other.isDayOff == isDayOff)&&(identical(other.is24Hours, is24Hours) || other.is24Hours == is24Hours)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDayOff,is24Hours,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'OpeningHours(isDayOff: $isDayOff, is24Hours: $is24Hours, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $OpeningHoursCopyWith<$Res>  {
  factory $OpeningHoursCopyWith(OpeningHours value, $Res Function(OpeningHours) _then) = _$OpeningHoursCopyWithImpl;
@useResult
$Res call({
 bool isDayOff, bool is24Hours, List<TimeSlot> slots
});




}
/// @nodoc
class _$OpeningHoursCopyWithImpl<$Res>
    implements $OpeningHoursCopyWith<$Res> {
  _$OpeningHoursCopyWithImpl(this._self, this._then);

  final OpeningHours _self;
  final $Res Function(OpeningHours) _then;

/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDayOff = null,Object? is24Hours = null,Object? slots = null,}) {
  return _then(_self.copyWith(
isDayOff: null == isDayOff ? _self.isDayOff : isDayOff // ignore: cast_nullable_to_non_nullable
as bool,is24Hours: null == is24Hours ? _self.is24Hours : is24Hours // ignore: cast_nullable_to_non_nullable
as bool,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}

}


/// Adds pattern-matching-related methods to [OpeningHours].
extension OpeningHoursPatterns on OpeningHours {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpeningHours value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpeningHours value)  $default,){
final _that = this;
switch (_that) {
case _OpeningHours():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpeningHours value)?  $default,){
final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDayOff,  bool is24Hours,  List<TimeSlot> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that.isDayOff,_that.is24Hours,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDayOff,  bool is24Hours,  List<TimeSlot> slots)  $default,) {final _that = this;
switch (_that) {
case _OpeningHours():
return $default(_that.isDayOff,_that.is24Hours,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDayOff,  bool is24Hours,  List<TimeSlot> slots)?  $default,) {final _that = this;
switch (_that) {
case _OpeningHours() when $default != null:
return $default(_that.isDayOff,_that.is24Hours,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpeningHours implements OpeningHours {
  const _OpeningHours({this.isDayOff = false, this.is24Hours = false, required final  List<TimeSlot> slots}): _slots = slots;
  factory _OpeningHours.fromJson(Map<String, dynamic> json) => _$OpeningHoursFromJson(json);

@override@JsonKey() final  bool isDayOff;
@override@JsonKey() final  bool is24Hours;
 final  List<TimeSlot> _slots;
@override List<TimeSlot> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpeningHoursCopyWith<_OpeningHours> get copyWith => __$OpeningHoursCopyWithImpl<_OpeningHours>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpeningHoursToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpeningHours&&(identical(other.isDayOff, isDayOff) || other.isDayOff == isDayOff)&&(identical(other.is24Hours, is24Hours) || other.is24Hours == is24Hours)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isDayOff,is24Hours,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'OpeningHours(isDayOff: $isDayOff, is24Hours: $is24Hours, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$OpeningHoursCopyWith<$Res> implements $OpeningHoursCopyWith<$Res> {
  factory _$OpeningHoursCopyWith(_OpeningHours value, $Res Function(_OpeningHours) _then) = __$OpeningHoursCopyWithImpl;
@override @useResult
$Res call({
 bool isDayOff, bool is24Hours, List<TimeSlot> slots
});




}
/// @nodoc
class __$OpeningHoursCopyWithImpl<$Res>
    implements _$OpeningHoursCopyWith<$Res> {
  __$OpeningHoursCopyWithImpl(this._self, this._then);

  final _OpeningHours _self;
  final $Res Function(_OpeningHours) _then;

/// Create a copy of OpeningHours
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDayOff = null,Object? is24Hours = null,Object? slots = null,}) {
  return _then(_OpeningHours(
isDayOff: null == isDayOff ? _self.isDayOff : isDayOff // ignore: cast_nullable_to_non_nullable
as bool,is24Hours: null == is24Hours ? _self.is24Hours : is24Hours // ignore: cast_nullable_to_non_nullable
as bool,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<TimeSlot>,
  ));
}


}

// dart format on
