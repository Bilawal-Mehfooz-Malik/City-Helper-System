// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_form_wizard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShopFormWizardState {

 int get currentPage; ShopForm get formData;
/// Create a copy of ShopFormWizardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopFormWizardStateCopyWith<ShopFormWizardState> get copyWith => _$ShopFormWizardStateCopyWithImpl<ShopFormWizardState>(this as ShopFormWizardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopFormWizardState&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.formData, formData) || other.formData == formData));
}


@override
int get hashCode => Object.hash(runtimeType,currentPage,formData);

@override
String toString() {
  return 'ShopFormWizardState(currentPage: $currentPage, formData: $formData)';
}


}

/// @nodoc
abstract mixin class $ShopFormWizardStateCopyWith<$Res>  {
  factory $ShopFormWizardStateCopyWith(ShopFormWizardState value, $Res Function(ShopFormWizardState) _then) = _$ShopFormWizardStateCopyWithImpl;
@useResult
$Res call({
 int currentPage, ShopForm formData
});


$ShopFormCopyWith<$Res> get formData;

}
/// @nodoc
class _$ShopFormWizardStateCopyWithImpl<$Res>
    implements $ShopFormWizardStateCopyWith<$Res> {
  _$ShopFormWizardStateCopyWithImpl(this._self, this._then);

  final ShopFormWizardState _self;
  final $Res Function(ShopFormWizardState) _then;

/// Create a copy of ShopFormWizardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentPage = null,Object? formData = null,}) {
  return _then(_self.copyWith(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ShopForm,
  ));
}
/// Create a copy of ShopFormWizardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShopFormCopyWith<$Res> get formData {
  
  return $ShopFormCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShopFormWizardState].
extension ShopFormWizardStatePatterns on ShopFormWizardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopFormWizardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopFormWizardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopFormWizardState value)  $default,){
final _that = this;
switch (_that) {
case _ShopFormWizardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopFormWizardState value)?  $default,){
final _that = this;
switch (_that) {
case _ShopFormWizardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentPage,  ShopForm formData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopFormWizardState() when $default != null:
return $default(_that.currentPage,_that.formData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentPage,  ShopForm formData)  $default,) {final _that = this;
switch (_that) {
case _ShopFormWizardState():
return $default(_that.currentPage,_that.formData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentPage,  ShopForm formData)?  $default,) {final _that = this;
switch (_that) {
case _ShopFormWizardState() when $default != null:
return $default(_that.currentPage,_that.formData);case _:
  return null;

}
}

}

/// @nodoc


class _ShopFormWizardState implements ShopFormWizardState {
  const _ShopFormWizardState({this.currentPage = 0, required this.formData});
  

@override@JsonKey() final  int currentPage;
@override final  ShopForm formData;

/// Create a copy of ShopFormWizardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopFormWizardStateCopyWith<_ShopFormWizardState> get copyWith => __$ShopFormWizardStateCopyWithImpl<_ShopFormWizardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopFormWizardState&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.formData, formData) || other.formData == formData));
}


@override
int get hashCode => Object.hash(runtimeType,currentPage,formData);

@override
String toString() {
  return 'ShopFormWizardState(currentPage: $currentPage, formData: $formData)';
}


}

/// @nodoc
abstract mixin class _$ShopFormWizardStateCopyWith<$Res> implements $ShopFormWizardStateCopyWith<$Res> {
  factory _$ShopFormWizardStateCopyWith(_ShopFormWizardState value, $Res Function(_ShopFormWizardState) _then) = __$ShopFormWizardStateCopyWithImpl;
@override @useResult
$Res call({
 int currentPage, ShopForm formData
});


@override $ShopFormCopyWith<$Res> get formData;

}
/// @nodoc
class __$ShopFormWizardStateCopyWithImpl<$Res>
    implements _$ShopFormWizardStateCopyWith<$Res> {
  __$ShopFormWizardStateCopyWithImpl(this._self, this._then);

  final _ShopFormWizardState _self;
  final $Res Function(_ShopFormWizardState) _then;

/// Create a copy of ShopFormWizardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentPage = null,Object? formData = null,}) {
  return _then(_ShopFormWizardState(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,formData: null == formData ? _self.formData : formData // ignore: cast_nullable_to_non_nullable
as ShopForm,
  ));
}

/// Create a copy of ShopFormWizardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShopFormCopyWith<$Res> get formData {
  
  return $ShopFormCopyWith<$Res>(_self.formData, (value) {
    return _then(_self.copyWith(formData: value));
  });
}
}

// dart format on
