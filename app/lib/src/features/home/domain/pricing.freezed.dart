// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pricing {

 double get cost; PricingUnit get unit; PricingPeriod get period;
/// Create a copy of Pricing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricingCopyWith<Pricing> get copyWith => _$PricingCopyWithImpl<Pricing>(this as Pricing, _$identity);

  /// Serializes this Pricing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pricing&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cost,unit,period);

@override
String toString() {
  return 'Pricing(cost: $cost, unit: $unit, period: $period)';
}


}

/// @nodoc
abstract mixin class $PricingCopyWith<$Res>  {
  factory $PricingCopyWith(Pricing value, $Res Function(Pricing) _then) = _$PricingCopyWithImpl;
@useResult
$Res call({
 double cost, PricingUnit unit, PricingPeriod period
});




}
/// @nodoc
class _$PricingCopyWithImpl<$Res>
    implements $PricingCopyWith<$Res> {
  _$PricingCopyWithImpl(this._self, this._then);

  final Pricing _self;
  final $Res Function(Pricing) _then;

/// Create a copy of Pricing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cost = null,Object? unit = null,Object? period = null,}) {
  return _then(_self.copyWith(
cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as PricingUnit,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PricingPeriod,
  ));
}

}


/// Adds pattern-matching-related methods to [Pricing].
extension PricingPatterns on Pricing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pricing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pricing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pricing value)  $default,){
final _that = this;
switch (_that) {
case _Pricing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pricing value)?  $default,){
final _that = this;
switch (_that) {
case _Pricing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double cost,  PricingUnit unit,  PricingPeriod period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pricing() when $default != null:
return $default(_that.cost,_that.unit,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double cost,  PricingUnit unit,  PricingPeriod period)  $default,) {final _that = this;
switch (_that) {
case _Pricing():
return $default(_that.cost,_that.unit,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double cost,  PricingUnit unit,  PricingPeriod period)?  $default,) {final _that = this;
switch (_that) {
case _Pricing() when $default != null:
return $default(_that.cost,_that.unit,_that.period);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pricing extends Pricing {
  const _Pricing({required this.cost, this.unit = PricingUnit.person, this.period = PricingPeriod.oneTime}): super._();
  factory _Pricing.fromJson(Map<String, dynamic> json) => _$PricingFromJson(json);

@override final  double cost;
@override@JsonKey() final  PricingUnit unit;
@override@JsonKey() final  PricingPeriod period;

/// Create a copy of Pricing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricingCopyWith<_Pricing> get copyWith => __$PricingCopyWithImpl<_Pricing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PricingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pricing&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cost,unit,period);

@override
String toString() {
  return 'Pricing(cost: $cost, unit: $unit, period: $period)';
}


}

/// @nodoc
abstract mixin class _$PricingCopyWith<$Res> implements $PricingCopyWith<$Res> {
  factory _$PricingCopyWith(_Pricing value, $Res Function(_Pricing) _then) = __$PricingCopyWithImpl;
@override @useResult
$Res call({
 double cost, PricingUnit unit, PricingPeriod period
});




}
/// @nodoc
class __$PricingCopyWithImpl<$Res>
    implements _$PricingCopyWith<$Res> {
  __$PricingCopyWithImpl(this._self, this._then);

  final _Pricing _self;
  final $Res Function(_Pricing) _then;

/// Create a copy of Pricing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cost = null,Object? unit = null,Object? period = null,}) {
  return _then(_Pricing(
cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as PricingUnit,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as PricingPeriod,
  ));
}


}

// dart format on
