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

 SortOrder get ratingSort;
/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EntityFilterCopyWith<EntityFilter> get copyWith => _$EntityFilterCopyWithImpl<EntityFilter>(this as EntityFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EntityFilter&&(identical(other.ratingSort, ratingSort) || other.ratingSort == ratingSort));
}


@override
int get hashCode => Object.hash(runtimeType,ratingSort);

@override
String toString() {
  return 'EntityFilter(ratingSort: $ratingSort)';
}


}

/// @nodoc
abstract mixin class $EntityFilterCopyWith<$Res>  {
  factory $EntityFilterCopyWith(EntityFilter value, $Res Function(EntityFilter) _then) = _$EntityFilterCopyWithImpl;
@useResult
$Res call({
 SortOrder ratingSort
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
@pragma('vm:prefer-inline') @override $Res call({Object? ratingSort = null,}) {
  return _then(_self.copyWith(
ratingSort: null == ratingSort ? _self.ratingSort : ratingSort // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isOpen,  SortOrder ratingSort,  GenderPreference genderPref)?  food,TResult Function( SortOrder ratingSort,  bool isFurnished,  bool isRoomAvailable,  SortOrder priceSort,  GenderPreference genderPref)?  residence,TResult Function( bool isOpen,  SortOrder ratingSort)?  basic,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FoodFilter() when food != null:
return food(_that.isOpen,_that.ratingSort,_that.genderPref);case ResidenceFilter() when residence != null:
return residence(_that.ratingSort,_that.isFurnished,_that.isRoomAvailable,_that.priceSort,_that.genderPref);case BasicFilter() when basic != null:
return basic(_that.isOpen,_that.ratingSort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isOpen,  SortOrder ratingSort,  GenderPreference genderPref)  food,required TResult Function( SortOrder ratingSort,  bool isFurnished,  bool isRoomAvailable,  SortOrder priceSort,  GenderPreference genderPref)  residence,required TResult Function( bool isOpen,  SortOrder ratingSort)  basic,}) {final _that = this;
switch (_that) {
case FoodFilter():
return food(_that.isOpen,_that.ratingSort,_that.genderPref);case ResidenceFilter():
return residence(_that.ratingSort,_that.isFurnished,_that.isRoomAvailable,_that.priceSort,_that.genderPref);case BasicFilter():
return basic(_that.isOpen,_that.ratingSort);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isOpen,  SortOrder ratingSort,  GenderPreference genderPref)?  food,TResult? Function( SortOrder ratingSort,  bool isFurnished,  bool isRoomAvailable,  SortOrder priceSort,  GenderPreference genderPref)?  residence,TResult? Function( bool isOpen,  SortOrder ratingSort)?  basic,}) {final _that = this;
switch (_that) {
case FoodFilter() when food != null:
return food(_that.isOpen,_that.ratingSort,_that.genderPref);case ResidenceFilter() when residence != null:
return residence(_that.ratingSort,_that.isFurnished,_that.isRoomAvailable,_that.priceSort,_that.genderPref);case BasicFilter() when basic != null:
return basic(_that.isOpen,_that.ratingSort);case _:
  return null;

}
}

}

/// @nodoc


class FoodFilter extends EntityFilter {
  const FoodFilter({this.isOpen = false, this.ratingSort = SortOrder.none, this.genderPref = GenderPreference.any}): super._();
  

@JsonKey() final  bool isOpen;
@override@JsonKey() final  SortOrder ratingSort;
@JsonKey() final  GenderPreference genderPref;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodFilterCopyWith<FoodFilter> get copyWith => _$FoodFilterCopyWithImpl<FoodFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodFilter&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.ratingSort, ratingSort) || other.ratingSort == ratingSort)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref));
}


@override
int get hashCode => Object.hash(runtimeType,isOpen,ratingSort,genderPref);

@override
String toString() {
  return 'EntityFilter.food(isOpen: $isOpen, ratingSort: $ratingSort, genderPref: $genderPref)';
}


}

/// @nodoc
abstract mixin class $FoodFilterCopyWith<$Res> implements $EntityFilterCopyWith<$Res> {
  factory $FoodFilterCopyWith(FoodFilter value, $Res Function(FoodFilter) _then) = _$FoodFilterCopyWithImpl;
@override @useResult
$Res call({
 bool isOpen, SortOrder ratingSort, GenderPreference genderPref
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
@override @pragma('vm:prefer-inline') $Res call({Object? isOpen = null,Object? ratingSort = null,Object? genderPref = null,}) {
  return _then(FoodFilter(
isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,ratingSort: null == ratingSort ? _self.ratingSort : ratingSort // ignore: cast_nullable_to_non_nullable
as SortOrder,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,
  ));
}


}

/// @nodoc


class ResidenceFilter extends EntityFilter {
  const ResidenceFilter({this.ratingSort = SortOrder.none, this.isFurnished = false, this.isRoomAvailable = false, this.priceSort = SortOrder.none, this.genderPref = GenderPreference.any}): super._();
  

@override@JsonKey() final  SortOrder ratingSort;
@JsonKey() final  bool isFurnished;
@JsonKey() final  bool isRoomAvailable;
// Default to false (filter off)
@JsonKey() final  SortOrder priceSort;
@JsonKey() final  GenderPreference genderPref;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidenceFilterCopyWith<ResidenceFilter> get copyWith => _$ResidenceFilterCopyWithImpl<ResidenceFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidenceFilter&&(identical(other.ratingSort, ratingSort) || other.ratingSort == ratingSort)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished)&&(identical(other.isRoomAvailable, isRoomAvailable) || other.isRoomAvailable == isRoomAvailable)&&(identical(other.priceSort, priceSort) || other.priceSort == priceSort)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref));
}


@override
int get hashCode => Object.hash(runtimeType,ratingSort,isFurnished,isRoomAvailable,priceSort,genderPref);

@override
String toString() {
  return 'EntityFilter.residence(ratingSort: $ratingSort, isFurnished: $isFurnished, isRoomAvailable: $isRoomAvailable, priceSort: $priceSort, genderPref: $genderPref)';
}


}

/// @nodoc
abstract mixin class $ResidenceFilterCopyWith<$Res> implements $EntityFilterCopyWith<$Res> {
  factory $ResidenceFilterCopyWith(ResidenceFilter value, $Res Function(ResidenceFilter) _then) = _$ResidenceFilterCopyWithImpl;
@override @useResult
$Res call({
 SortOrder ratingSort, bool isFurnished, bool isRoomAvailable, SortOrder priceSort, GenderPreference genderPref
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
@override @pragma('vm:prefer-inline') $Res call({Object? ratingSort = null,Object? isFurnished = null,Object? isRoomAvailable = null,Object? priceSort = null,Object? genderPref = null,}) {
  return _then(ResidenceFilter(
ratingSort: null == ratingSort ? _self.ratingSort : ratingSort // ignore: cast_nullable_to_non_nullable
as SortOrder,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,isRoomAvailable: null == isRoomAvailable ? _self.isRoomAvailable : isRoomAvailable // ignore: cast_nullable_to_non_nullable
as bool,priceSort: null == priceSort ? _self.priceSort : priceSort // ignore: cast_nullable_to_non_nullable
as SortOrder,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,
  ));
}


}

/// @nodoc


class BasicFilter extends EntityFilter {
  const BasicFilter({this.isOpen = false, this.ratingSort = SortOrder.none}): super._();
  

@JsonKey() final  bool isOpen;
@override@JsonKey() final  SortOrder ratingSort;

/// Create a copy of EntityFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BasicFilterCopyWith<BasicFilter> get copyWith => _$BasicFilterCopyWithImpl<BasicFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BasicFilter&&(identical(other.isOpen, isOpen) || other.isOpen == isOpen)&&(identical(other.ratingSort, ratingSort) || other.ratingSort == ratingSort));
}


@override
int get hashCode => Object.hash(runtimeType,isOpen,ratingSort);

@override
String toString() {
  return 'EntityFilter.basic(isOpen: $isOpen, ratingSort: $ratingSort)';
}


}

/// @nodoc
abstract mixin class $BasicFilterCopyWith<$Res> implements $EntityFilterCopyWith<$Res> {
  factory $BasicFilterCopyWith(BasicFilter value, $Res Function(BasicFilter) _then) = _$BasicFilterCopyWithImpl;
@override @useResult
$Res call({
 bool isOpen, SortOrder ratingSort
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
@override @pragma('vm:prefer-inline') $Res call({Object? isOpen = null,Object? ratingSort = null,}) {
  return _then(BasicFilter(
isOpen: null == isOpen ? _self.isOpen : isOpen // ignore: cast_nullable_to_non_nullable
as bool,ratingSort: null == ratingSort ? _self.ratingSort : ratingSort // ignore: cast_nullable_to_non_nullable
as SortOrder,
  ));
}


}

// dart format on
