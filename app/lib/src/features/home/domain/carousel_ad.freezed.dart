// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel_ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CarouselAd {

 CategoryId get categoryId; SubCategoryId get subCategoryId; CarouselAdId get id; String get imageUrl; String get targetUrl; DateTime get validFrom; DateTime get validUntil; AdStatus get status;
/// Create a copy of CarouselAd
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarouselAdCopyWith<CarouselAd> get copyWith => _$CarouselAdCopyWithImpl<CarouselAd>(this as CarouselAd, _$identity);

  /// Serializes this CarouselAd to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CarouselAd&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.targetUrl, targetUrl) || other.targetUrl == targetUrl)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,subCategoryId,id,imageUrl,targetUrl,validFrom,validUntil,status);

@override
String toString() {
  return 'CarouselAd(categoryId: $categoryId, subCategoryId: $subCategoryId, id: $id, imageUrl: $imageUrl, targetUrl: $targetUrl, validFrom: $validFrom, validUntil: $validUntil, status: $status)';
}


}

/// @nodoc
abstract mixin class $CarouselAdCopyWith<$Res>  {
  factory $CarouselAdCopyWith(CarouselAd value, $Res Function(CarouselAd) _then) = _$CarouselAdCopyWithImpl;
@useResult
$Res call({
 CategoryId categoryId, SubCategoryId subCategoryId, CarouselAdId id, String imageUrl, String targetUrl, DateTime validFrom, DateTime validUntil, AdStatus status
});




}
/// @nodoc
class _$CarouselAdCopyWithImpl<$Res>
    implements $CarouselAdCopyWith<$Res> {
  _$CarouselAdCopyWithImpl(this._self, this._then);

  final CarouselAd _self;
  final $Res Function(CarouselAd) _then;

/// Create a copy of CarouselAd
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? subCategoryId = null,Object? id = null,Object? imageUrl = null,Object? targetUrl = null,Object? validFrom = null,Object? validUntil = null,Object? status = null,}) {
  return _then(_self.copyWith(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as SubCategoryId,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CarouselAdId,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,targetUrl: null == targetUrl ? _self.targetUrl : targetUrl // ignore: cast_nullable_to_non_nullable
as String,validFrom: null == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as DateTime,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [CarouselAd].
extension CarouselAdPatterns on CarouselAd {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CarouselAd value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CarouselAd() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CarouselAd value)  $default,){
final _that = this;
switch (_that) {
case _CarouselAd():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CarouselAd value)?  $default,){
final _that = this;
switch (_that) {
case _CarouselAd() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryId categoryId,  SubCategoryId subCategoryId,  CarouselAdId id,  String imageUrl,  String targetUrl,  DateTime validFrom,  DateTime validUntil,  AdStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CarouselAd() when $default != null:
return $default(_that.categoryId,_that.subCategoryId,_that.id,_that.imageUrl,_that.targetUrl,_that.validFrom,_that.validUntil,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryId categoryId,  SubCategoryId subCategoryId,  CarouselAdId id,  String imageUrl,  String targetUrl,  DateTime validFrom,  DateTime validUntil,  AdStatus status)  $default,) {final _that = this;
switch (_that) {
case _CarouselAd():
return $default(_that.categoryId,_that.subCategoryId,_that.id,_that.imageUrl,_that.targetUrl,_that.validFrom,_that.validUntil,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryId categoryId,  SubCategoryId subCategoryId,  CarouselAdId id,  String imageUrl,  String targetUrl,  DateTime validFrom,  DateTime validUntil,  AdStatus status)?  $default,) {final _that = this;
switch (_that) {
case _CarouselAd() when $default != null:
return $default(_that.categoryId,_that.subCategoryId,_that.id,_that.imageUrl,_that.targetUrl,_that.validFrom,_that.validUntil,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CarouselAd implements CarouselAd {
  const _CarouselAd({required this.categoryId, required this.subCategoryId, required this.id, required this.imageUrl, required this.targetUrl, required this.validFrom, required this.validUntil, this.status = AdStatus.active});
  factory _CarouselAd.fromJson(Map<String, dynamic> json) => _$CarouselAdFromJson(json);

@override final  CategoryId categoryId;
@override final  SubCategoryId subCategoryId;
@override final  CarouselAdId id;
@override final  String imageUrl;
@override final  String targetUrl;
@override final  DateTime validFrom;
@override final  DateTime validUntil;
@override@JsonKey() final  AdStatus status;

/// Create a copy of CarouselAd
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarouselAdCopyWith<_CarouselAd> get copyWith => __$CarouselAdCopyWithImpl<_CarouselAd>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarouselAdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CarouselAd&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.id, id) || other.id == id)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.targetUrl, targetUrl) || other.targetUrl == targetUrl)&&(identical(other.validFrom, validFrom) || other.validFrom == validFrom)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,subCategoryId,id,imageUrl,targetUrl,validFrom,validUntil,status);

@override
String toString() {
  return 'CarouselAd(categoryId: $categoryId, subCategoryId: $subCategoryId, id: $id, imageUrl: $imageUrl, targetUrl: $targetUrl, validFrom: $validFrom, validUntil: $validUntil, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CarouselAdCopyWith<$Res> implements $CarouselAdCopyWith<$Res> {
  factory _$CarouselAdCopyWith(_CarouselAd value, $Res Function(_CarouselAd) _then) = __$CarouselAdCopyWithImpl;
@override @useResult
$Res call({
 CategoryId categoryId, SubCategoryId subCategoryId, CarouselAdId id, String imageUrl, String targetUrl, DateTime validFrom, DateTime validUntil, AdStatus status
});




}
/// @nodoc
class __$CarouselAdCopyWithImpl<$Res>
    implements _$CarouselAdCopyWith<$Res> {
  __$CarouselAdCopyWithImpl(this._self, this._then);

  final _CarouselAd _self;
  final $Res Function(_CarouselAd) _then;

/// Create a copy of CarouselAd
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = null,Object? subCategoryId = null,Object? id = null,Object? imageUrl = null,Object? targetUrl = null,Object? validFrom = null,Object? validUntil = null,Object? status = null,}) {
  return _then(_CarouselAd(
categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as CategoryId,subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as SubCategoryId,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as CarouselAdId,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,targetUrl: null == targetUrl ? _self.targetUrl : targetUrl // ignore: cast_nullable_to_non_nullable
as String,validFrom: null == validFrom ? _self.validFrom : validFrom // ignore: cast_nullable_to_non_nullable
as DateTime,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AdStatus,
  ));
}


}

// dart format on
