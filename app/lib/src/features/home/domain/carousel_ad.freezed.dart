// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carousel_ad.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarouselAd _$CarouselAdFromJson(Map<String, dynamic> json) {
  return _CarouselAd.fromJson(json);
}

/// @nodoc
mixin _$CarouselAd {
  int get categoryId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get targetUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CarouselAd to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarouselAd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarouselAdCopyWith<CarouselAd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarouselAdCopyWith<$Res> {
  factory $CarouselAdCopyWith(
          CarouselAd value, $Res Function(CarouselAd) then) =
      _$CarouselAdCopyWithImpl<$Res, CarouselAd>;
  @useResult
  $Res call(
      {int categoryId,
      String id,
      String title,
      String imageUrl,
      String targetUrl,
      DateTime createdAt});
}

/// @nodoc
class _$CarouselAdCopyWithImpl<$Res, $Val extends CarouselAd>
    implements $CarouselAdCopyWith<$Res> {
  _$CarouselAdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarouselAd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? targetUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      targetUrl: null == targetUrl
          ? _value.targetUrl
          : targetUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarouselAdImplCopyWith<$Res>
    implements $CarouselAdCopyWith<$Res> {
  factory _$$CarouselAdImplCopyWith(
          _$CarouselAdImpl value, $Res Function(_$CarouselAdImpl) then) =
      __$$CarouselAdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId,
      String id,
      String title,
      String imageUrl,
      String targetUrl,
      DateTime createdAt});
}

/// @nodoc
class __$$CarouselAdImplCopyWithImpl<$Res>
    extends _$CarouselAdCopyWithImpl<$Res, _$CarouselAdImpl>
    implements _$$CarouselAdImplCopyWith<$Res> {
  __$$CarouselAdImplCopyWithImpl(
      _$CarouselAdImpl _value, $Res Function(_$CarouselAdImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarouselAd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? id = null,
    Object? title = null,
    Object? imageUrl = null,
    Object? targetUrl = null,
    Object? createdAt = null,
  }) {
    return _then(_$CarouselAdImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      targetUrl: null == targetUrl
          ? _value.targetUrl
          : targetUrl // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarouselAdImpl implements _CarouselAd {
  const _$CarouselAdImpl(
      {required this.categoryId,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.targetUrl,
      required this.createdAt});

  factory _$CarouselAdImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarouselAdImplFromJson(json);

  @override
  final int categoryId;
  @override
  final String id;
  @override
  final String title;
  @override
  final String imageUrl;
  @override
  final String targetUrl;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'CarouselAd(categoryId: $categoryId, id: $id, title: $title, imageUrl: $imageUrl, targetUrl: $targetUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarouselAdImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.targetUrl, targetUrl) ||
                other.targetUrl == targetUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryId, id, title, imageUrl, targetUrl, createdAt);

  /// Create a copy of CarouselAd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarouselAdImplCopyWith<_$CarouselAdImpl> get copyWith =>
      __$$CarouselAdImplCopyWithImpl<_$CarouselAdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarouselAdImplToJson(
      this,
    );
  }
}

abstract class _CarouselAd implements CarouselAd {
  const factory _CarouselAd(
      {required final int categoryId,
      required final String id,
      required final String title,
      required final String imageUrl,
      required final String targetUrl,
      required final DateTime createdAt}) = _$CarouselAdImpl;

  factory _CarouselAd.fromJson(Map<String, dynamic> json) =
      _$CarouselAdImpl.fromJson;

  @override
  int get categoryId;
  @override
  String get id;
  @override
  String get title;
  @override
  String get imageUrl;
  @override
  String get targetUrl;
  @override
  DateTime get createdAt;

  /// Create a copy of CarouselAd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarouselAdImplCopyWith<_$CarouselAdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
