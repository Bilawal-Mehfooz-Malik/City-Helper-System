// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'popular_entities_paginated_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PopularEntitiesPaginatedState {

 List<Entity> get entities; bool get hasMore; Object? get paginationError; bool get isLoadingNextPage;
/// Create a copy of PopularEntitiesPaginatedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PopularEntitiesPaginatedStateCopyWith<PopularEntitiesPaginatedState> get copyWith => _$PopularEntitiesPaginatedStateCopyWithImpl<PopularEntitiesPaginatedState>(this as PopularEntitiesPaginatedState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PopularEntitiesPaginatedState&&const DeepCollectionEquality().equals(other.entities, entities)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.paginationError, paginationError)&&(identical(other.isLoadingNextPage, isLoadingNextPage) || other.isLoadingNextPage == isLoadingNextPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(entities),hasMore,const DeepCollectionEquality().hash(paginationError),isLoadingNextPage);

@override
String toString() {
  return 'PopularEntitiesPaginatedState(entities: $entities, hasMore: $hasMore, paginationError: $paginationError, isLoadingNextPage: $isLoadingNextPage)';
}


}

/// @nodoc
abstract mixin class $PopularEntitiesPaginatedStateCopyWith<$Res>  {
  factory $PopularEntitiesPaginatedStateCopyWith(PopularEntitiesPaginatedState value, $Res Function(PopularEntitiesPaginatedState) _then) = _$PopularEntitiesPaginatedStateCopyWithImpl;
@useResult
$Res call({
 List<Entity> entities, bool hasMore, Object? paginationError, bool isLoadingNextPage
});




}
/// @nodoc
class _$PopularEntitiesPaginatedStateCopyWithImpl<$Res>
    implements $PopularEntitiesPaginatedStateCopyWith<$Res> {
  _$PopularEntitiesPaginatedStateCopyWithImpl(this._self, this._then);

  final PopularEntitiesPaginatedState _self;
  final $Res Function(PopularEntitiesPaginatedState) _then;

/// Create a copy of PopularEntitiesPaginatedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entities = null,Object? hasMore = null,Object? paginationError = freezed,Object? isLoadingNextPage = null,}) {
  return _then(_self.copyWith(
entities: null == entities ? _self.entities : entities // ignore: cast_nullable_to_non_nullable
as List<Entity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,paginationError: freezed == paginationError ? _self.paginationError : paginationError ,isLoadingNextPage: null == isLoadingNextPage ? _self.isLoadingNextPage : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PopularEntitiesPaginatedState].
extension PopularEntitiesPaginatedStatePatterns on PopularEntitiesPaginatedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PopularEntitiesPaginatedState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PopularEntitiesPaginatedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PopularEntitiesPaginatedState value)  $default,){
final _that = this;
switch (_that) {
case _PopularEntitiesPaginatedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PopularEntitiesPaginatedState value)?  $default,){
final _that = this;
switch (_that) {
case _PopularEntitiesPaginatedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Entity> entities,  bool hasMore,  Object? paginationError,  bool isLoadingNextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PopularEntitiesPaginatedState() when $default != null:
return $default(_that.entities,_that.hasMore,_that.paginationError,_that.isLoadingNextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Entity> entities,  bool hasMore,  Object? paginationError,  bool isLoadingNextPage)  $default,) {final _that = this;
switch (_that) {
case _PopularEntitiesPaginatedState():
return $default(_that.entities,_that.hasMore,_that.paginationError,_that.isLoadingNextPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Entity> entities,  bool hasMore,  Object? paginationError,  bool isLoadingNextPage)?  $default,) {final _that = this;
switch (_that) {
case _PopularEntitiesPaginatedState() when $default != null:
return $default(_that.entities,_that.hasMore,_that.paginationError,_that.isLoadingNextPage);case _:
  return null;

}
}

}

/// @nodoc


class _PopularEntitiesPaginatedState implements PopularEntitiesPaginatedState {
  const _PopularEntitiesPaginatedState({final  List<Entity> entities = const [], this.hasMore = true, this.paginationError, this.isLoadingNextPage = false}): _entities = entities;
  

 final  List<Entity> _entities;
@override@JsonKey() List<Entity> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}

@override@JsonKey() final  bool hasMore;
@override final  Object? paginationError;
@override@JsonKey() final  bool isLoadingNextPage;

/// Create a copy of PopularEntitiesPaginatedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PopularEntitiesPaginatedStateCopyWith<_PopularEntitiesPaginatedState> get copyWith => __$PopularEntitiesPaginatedStateCopyWithImpl<_PopularEntitiesPaginatedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PopularEntitiesPaginatedState&&const DeepCollectionEquality().equals(other._entities, _entities)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.paginationError, paginationError)&&(identical(other.isLoadingNextPage, isLoadingNextPage) || other.isLoadingNextPage == isLoadingNextPage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entities),hasMore,const DeepCollectionEquality().hash(paginationError),isLoadingNextPage);

@override
String toString() {
  return 'PopularEntitiesPaginatedState(entities: $entities, hasMore: $hasMore, paginationError: $paginationError, isLoadingNextPage: $isLoadingNextPage)';
}


}

/// @nodoc
abstract mixin class _$PopularEntitiesPaginatedStateCopyWith<$Res> implements $PopularEntitiesPaginatedStateCopyWith<$Res> {
  factory _$PopularEntitiesPaginatedStateCopyWith(_PopularEntitiesPaginatedState value, $Res Function(_PopularEntitiesPaginatedState) _then) = __$PopularEntitiesPaginatedStateCopyWithImpl;
@override @useResult
$Res call({
 List<Entity> entities, bool hasMore, Object? paginationError, bool isLoadingNextPage
});




}
/// @nodoc
class __$PopularEntitiesPaginatedStateCopyWithImpl<$Res>
    implements _$PopularEntitiesPaginatedStateCopyWith<$Res> {
  __$PopularEntitiesPaginatedStateCopyWithImpl(this._self, this._then);

  final _PopularEntitiesPaginatedState _self;
  final $Res Function(_PopularEntitiesPaginatedState) _then;

/// Create a copy of PopularEntitiesPaginatedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entities = null,Object? hasMore = null,Object? paginationError = freezed,Object? isLoadingNextPage = null,}) {
  return _then(_PopularEntitiesPaginatedState(
entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<Entity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,paginationError: freezed == paginationError ? _self.paginationError : paginationError ,isLoadingNextPage: null == isLoadingNextPage ? _self.isLoadingNextPage : isLoadingNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
