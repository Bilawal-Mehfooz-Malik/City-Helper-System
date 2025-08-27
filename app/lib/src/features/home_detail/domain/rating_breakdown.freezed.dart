// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_breakdown.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingBreakdown {

 int get stars; int get count;
/// Create a copy of RatingBreakdown
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingBreakdownCopyWith<RatingBreakdown> get copyWith => _$RatingBreakdownCopyWithImpl<RatingBreakdown>(this as RatingBreakdown, _$identity);

  /// Serializes this RatingBreakdown to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingBreakdown&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stars,count);

@override
String toString() {
  return 'RatingBreakdown(stars: $stars, count: $count)';
}


}

/// @nodoc
abstract mixin class $RatingBreakdownCopyWith<$Res>  {
  factory $RatingBreakdownCopyWith(RatingBreakdown value, $Res Function(RatingBreakdown) _then) = _$RatingBreakdownCopyWithImpl;
@useResult
$Res call({
 int stars, int count
});




}
/// @nodoc
class _$RatingBreakdownCopyWithImpl<$Res>
    implements $RatingBreakdownCopyWith<$Res> {
  _$RatingBreakdownCopyWithImpl(this._self, this._then);

  final RatingBreakdown _self;
  final $Res Function(RatingBreakdown) _then;

/// Create a copy of RatingBreakdown
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stars = null,Object? count = null,}) {
  return _then(_self.copyWith(
stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingBreakdown].
extension RatingBreakdownPatterns on RatingBreakdown {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingBreakdown value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingBreakdown() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingBreakdown value)  $default,){
final _that = this;
switch (_that) {
case _RatingBreakdown():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingBreakdown value)?  $default,){
final _that = this;
switch (_that) {
case _RatingBreakdown() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int stars,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingBreakdown() when $default != null:
return $default(_that.stars,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int stars,  int count)  $default,) {final _that = this;
switch (_that) {
case _RatingBreakdown():
return $default(_that.stars,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int stars,  int count)?  $default,) {final _that = this;
switch (_that) {
case _RatingBreakdown() when $default != null:
return $default(_that.stars,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingBreakdown extends RatingBreakdown {
  const _RatingBreakdown({required this.stars, required this.count}): super._();
  factory _RatingBreakdown.fromJson(Map<String, dynamic> json) => _$RatingBreakdownFromJson(json);

@override final  int stars;
@override final  int count;

/// Create a copy of RatingBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingBreakdownCopyWith<_RatingBreakdown> get copyWith => __$RatingBreakdownCopyWithImpl<_RatingBreakdown>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingBreakdownToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingBreakdown&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,stars,count);

@override
String toString() {
  return 'RatingBreakdown(stars: $stars, count: $count)';
}


}

/// @nodoc
abstract mixin class _$RatingBreakdownCopyWith<$Res> implements $RatingBreakdownCopyWith<$Res> {
  factory _$RatingBreakdownCopyWith(_RatingBreakdown value, $Res Function(_RatingBreakdown) _then) = __$RatingBreakdownCopyWithImpl;
@override @useResult
$Res call({
 int stars, int count
});




}
/// @nodoc
class __$RatingBreakdownCopyWithImpl<$Res>
    implements _$RatingBreakdownCopyWith<$Res> {
  __$RatingBreakdownCopyWithImpl(this._self, this._then);

  final _RatingBreakdown _self;
  final $Res Function(_RatingBreakdown) _then;

/// Create a copy of RatingBreakdown
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stars = null,Object? count = null,}) {
  return _then(_RatingBreakdown(
stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
