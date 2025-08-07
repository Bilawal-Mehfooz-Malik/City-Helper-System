// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubCategory {

 CategoryId get categoryId; CategoryId get id; String get name; int get sortOrder;
/// Create a copy of SubCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubCategoryCopyWith<SubCategory> get copyWith => _$SubCategoryCopyWithImpl<SubCategory>(this as SubCategory, _$identity);

  /// Serializes this SubCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,id,name,sortOrder);

@override
String toString() {
  return 'SubCategory(categoryId: $categoryId, id: $id, name: $name, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $SubCategoryCopyWith<$Res>  {
  factory $SubCategoryCopyWith(SubCategory value, $Res Function(SubCategory) _then) = _$SubCategoryCopyWithImpl;
@useResult
$Res call({
 CategoryId categoryId, CategoryId id, String name, int sortOrder
});




}
/// @nodoc
class _$SubCategoryCopyWithImpl<$Res>
    implements $SubCategoryCopyWith<$Res> {
  _$SubCategoryCopyWithImpl(this._self, this._then);

  final SubCategory _self;
  final $Res Function(SubCategory) _then;

/// Create a copy of SubCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? id = null,Object? name = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CategoryId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SubCategory].
extension SubCategoryPatterns on SubCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubCategory value)  $default,){
final _that = this;
switch (_that) {
case _SubCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubCategory value)?  $default,){
final _that = this;
switch (_that) {
case _SubCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryId categoryId,  CategoryId id,  String name,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubCategory() when $default != null:
return $default(_that.categoryId,_that.id,_that.name,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryId categoryId,  CategoryId id,  String name,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _SubCategory():
return $default(_that.categoryId,_that.id,_that.name,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryId categoryId,  CategoryId id,  String name,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _SubCategory() when $default != null:
return $default(_that.categoryId,_that.id,_that.name,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubCategory implements SubCategory {
  const _SubCategory({required this.categoryId, required this.id, required this.name, required this.sortOrder});
  factory _SubCategory.fromJson(Map<String, dynamic> json) => _$SubCategoryFromJson(json);

@override final  CategoryId categoryId;
@override final  CategoryId id;
@override final  String name;
@override final  int sortOrder;

/// Create a copy of SubCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubCategoryCopyWith<_SubCategory> get copyWith => __$SubCategoryCopyWithImpl<_SubCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubCategory&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,id,name,sortOrder);

@override
String toString() {
  return 'SubCategory(categoryId: $categoryId, id: $id, name: $name, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$SubCategoryCopyWith<$Res> implements $SubCategoryCopyWith<$Res> {
  factory _$SubCategoryCopyWith(_SubCategory value, $Res Function(_SubCategory) _then) = __$SubCategoryCopyWithImpl;
@override @useResult
$Res call({
 CategoryId categoryId, CategoryId id, String name, int sortOrder
});




}
/// @nodoc
class __$SubCategoryCopyWithImpl<$Res>
    implements _$SubCategoryCopyWith<$Res> {
  __$SubCategoryCopyWithImpl(this._self, this._then);

  final _SubCategory _self;
  final $Res Function(_SubCategory) _then;

/// Create a copy of SubCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? id = null,Object? name = null,Object? sortOrder = null,}) {
  return _then(_SubCategory(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CategoryId,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
