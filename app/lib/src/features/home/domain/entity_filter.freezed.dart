// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EntityFilter {

 SortBy get sortBy; SortOrder get sortOrder;
/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntityFilterCopyWith<EntityFilter> get copyWith => _$EntityFilterCopyWithImpl<EntityFilter>(this as EntityFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntityFilter&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,sortBy,sortOrder);

@override
String toString() {
  return 'EntityFilter(sortBy: $sortBy, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $EntityFilterCopyWith<$Res>  {
  factory $EntityFilterCopyWith(EntityFilter value, $Res Function(EntityFilter) _then) = _$EntityFilterCopyWithImpl;
@useResult
$Res call({
 SortBy sortBy, SortOrder sortOrder
});




}
/// @nodoc
class _$EntityFilterCopyWithImpl<$Res>
    implements $EntityFilterCopyWith<$Res> {
  _$EntityFilterCopyWithImpl(this._self, this._then);

  final EntityFilter _self;
  final $Res Function(EntityFilter) _then;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sortBy = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortBy,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,
  ));
}

}


/// Adds pattern-matching-related methods to [EntityFilter].
extension EntityFilterPatterns on EntityFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FoodFilter value)?  food,TResult Function( ResidenceFilter value)?  residence,TResult Function( BasicFilter value)?  basic,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FoodFilter() when food != null:
return food(_that);case ResidenceFilter() when residence != null:
return residence(_that);case BasicFilter() when basic != null:
return basic(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FoodFilter value)  food,required TResult Function( ResidenceFilter value)  residence,required TResult Function( BasicFilter value)  basic,}){
final _that = this;
switch (_that) {
case FoodFilter():
return food(_that);case ResidenceFilter():
return residence(_that);case BasicFilter():
return basic(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FoodFilter value)?  food,TResult? Function( ResidenceFilter value)?  residence,TResult? Function( BasicFilter value)?  basic,}){
final _that = this;
switch (_that) {
case FoodFilter() when food != null:
return food(_that);case ResidenceFilter() when residence != null:
return residence(_that);case BasicFilter() when basic != null:
return basic(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( SortBy sortBy,  SortOrder sortOrder,  GenderPreference? genderPref)?  food,TResult Function( SortBy sortBy,  SortOrder sortOrder,  bool isFurnished,  bool isRoomAvailable,  GenderPreference? genderPref)?  residence,TResult Function( SortBy sortBy,  SortOrder sortOrder)?  basic,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FoodFilter() when food != null:
return food(_that.sortBy,_that.sortOrder,_that.genderPref);case ResidenceFilter() when residence != null:
return residence(_that.sortBy,_that.sortOrder,_that.isFurnished,_that.isRoomAvailable,_that.genderPref);case BasicFilter() when basic != null:
return basic(_that.sortBy,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( SortBy sortBy,  SortOrder sortOrder,  GenderPreference? genderPref)  food,required TResult Function( SortBy sortBy,  SortOrder sortOrder,  bool isFurnished,  bool isRoomAvailable,  GenderPreference? genderPref)  residence,required TResult Function( SortBy sortBy,  SortOrder sortOrder)  basic,}) {final _that = this;
switch (_that) {
case FoodFilter():
return food(_that.sortBy,_that.sortOrder,_that.genderPref);case ResidenceFilter():
return residence(_that.sortBy,_that.sortOrder,_that.isFurnished,_that.isRoomAvailable,_that.genderPref);case BasicFilter():
return basic(_that.sortBy,_that.sortOrder);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( SortBy sortBy,  SortOrder sortOrder,  GenderPreference? genderPref)?  food,TResult? Function( SortBy sortBy,  SortOrder sortOrder,  bool isFurnished,  bool isRoomAvailable,  GenderPreference? genderPref)?  residence,TResult? Function( SortBy sortBy,  SortOrder sortOrder)?  basic,}) {final _that = this;
switch (_that) {
case FoodFilter() when food != null:
return food(_that.sortBy,_that.sortOrder,_that.genderPref);case ResidenceFilter() when residence != null:
return residence(_that.sortBy,_that.sortOrder,_that.isFurnished,_that.isRoomAvailable,_that.genderPref);case BasicFilter() when basic != null:
return basic(_that.sortBy,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc


class FoodFilter extends EntityFilter {
  const FoodFilter({this.sortBy = SortBy.updatedAt, this.sortOrder = SortOrder.highToLow, this.genderPref}): super._();
  

@override@JsonKey() final  SortBy sortBy;
@override@JsonKey() final  SortOrder sortOrder;
 final  GenderPreference? genderPref;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodFilterCopyWith<FoodFilter> get copyWith => _$FoodFilterCopyWithImpl<FoodFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodFilter&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref));
}


@override
int get hashCode => Object.hash(runtimeType,sortBy,sortOrder,genderPref);

@override
String toString() {
  return 'EntityFilter.food(sortBy: $sortBy, sortOrder: $sortOrder, genderPref: $genderPref)';
}


}

/// @nodoc
abstract mixin class $FoodFilterCopyWith<$Res> implements $EntityFilterCopyWith<$Res> {
  factory $FoodFilterCopyWith(FoodFilter value, $Res Function(FoodFilter) _then) = _$FoodFilterCopyWithImpl;
@override @useResult
$Res call({
 SortBy sortBy, SortOrder sortOrder, GenderPreference? genderPref
});




}
/// @nodoc
class _$FoodFilterCopyWithImpl<$Res>
    implements $FoodFilterCopyWith<$Res> {
  _$FoodFilterCopyWithImpl(this._self, this._then);

  final FoodFilter _self;
  final $Res Function(FoodFilter) _then;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sortBy = null,Object? sortOrder = null,Object? genderPref = freezed,}) {
  return _then(FoodFilter(
sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortBy,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,genderPref: freezed == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference?,
  ));
}


}

/// @nodoc


class ResidenceFilter extends EntityFilter {
  const ResidenceFilter({this.sortBy = SortBy.updatedAt, this.sortOrder = SortOrder.highToLow, this.isFurnished = false, this.isRoomAvailable = false, this.genderPref}): super._();
  

@override@JsonKey() final  SortBy sortBy;
@override@JsonKey() final  SortOrder sortOrder;
@JsonKey() final  bool isFurnished;
@JsonKey() final  bool isRoomAvailable;
 final  GenderPreference? genderPref;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidenceFilterCopyWith<ResidenceFilter> get copyWith => _$ResidenceFilterCopyWithImpl<ResidenceFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidenceFilter&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished)&&(identical(other.isRoomAvailable, isRoomAvailable) || other.isRoomAvailable == isRoomAvailable)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref));
}


@override
int get hashCode => Object.hash(runtimeType,sortBy,sortOrder,isFurnished,isRoomAvailable,genderPref);

@override
String toString() {
  return 'EntityFilter.residence(sortBy: $sortBy, sortOrder: $sortOrder, isFurnished: $isFurnished, isRoomAvailable: $isRoomAvailable, genderPref: $genderPref)';
}


}

/// @nodoc
abstract mixin class $ResidenceFilterCopyWith<$Res> implements $EntityFilterCopyWith<$Res> {
  factory $ResidenceFilterCopyWith(ResidenceFilter value, $Res Function(ResidenceFilter) _then) = _$ResidenceFilterCopyWithImpl;
@override @useResult
$Res call({
 SortBy sortBy, SortOrder sortOrder, bool isFurnished, bool isRoomAvailable, GenderPreference? genderPref
});




}
/// @nodoc
class _$ResidenceFilterCopyWithImpl<$Res>
    implements $ResidenceFilterCopyWith<$Res> {
  _$ResidenceFilterCopyWithImpl(this._self, this._then);

  final ResidenceFilter _self;
  final $Res Function(ResidenceFilter) _then;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sortBy = null,Object? sortOrder = null,Object? isFurnished = null,Object? isRoomAvailable = null,Object? genderPref = freezed,}) {
  return _then(ResidenceFilter(
sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortBy,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,isRoomAvailable: null == isRoomAvailable ? _self.isRoomAvailable : isRoomAvailable // ignore: cast_nullable_to_non_nullable
as bool,genderPref: freezed == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference?,
  ));
}


}

/// @nodoc


class BasicFilter extends EntityFilter {
  const BasicFilter({this.sortBy = SortBy.rating, this.sortOrder = SortOrder.highToLow}): super._();
  

@override@JsonKey() final  SortBy sortBy;
@override@JsonKey() final  SortOrder sortOrder;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicFilterCopyWith<BasicFilter> get copyWith => _$BasicFilterCopyWithImpl<BasicFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicFilter&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,sortBy,sortOrder);

@override
String toString() {
  return 'EntityFilter.basic(sortBy: $sortBy, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $BasicFilterCopyWith<$Res> implements $EntityFilterCopyWith<$Res> {
  factory $BasicFilterCopyWith(BasicFilter value, $Res Function(BasicFilter) _then) = _$BasicFilterCopyWithImpl;
@override @useResult
$Res call({
 SortBy sortBy, SortOrder sortOrder
});




}
/// @nodoc
class _$BasicFilterCopyWithImpl<$Res>
    implements $BasicFilterCopyWith<$Res> {
  _$BasicFilterCopyWithImpl(this._self, this._then);

  final BasicFilter _self;
  final $Res Function(BasicFilter) _then;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sortBy = null,Object? sortOrder = null,}) {
  return _then(BasicFilter(
sortBy: null == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as SortBy,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as SortOrder,
  ));
}


}

// dart format on
