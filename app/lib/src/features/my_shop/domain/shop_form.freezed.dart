// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShopForm {

// --- Enhanced Image State ---
 String? get existingCoverImageUrl; List<String> get existingGalleryImageUrls; Uint8List? get newCoverImageBytes; List<Uint8List> get newGalleryImageBytes; List<String> get galleryImageUrlsToDelete; bool get isCoverImageDeleted;// --- Other Form Fields ---
 Category? get category; SubCategory? get subCategory; LatLng? get latLng; String get name; String get description; String get phoneNumber; String get messagingNumber; String get cityName; String get sectorName; String get streetAddress; String get email; String get facebookUrl; String get instagramUrl; String get websiteUrl; List<OpeningHours> get openingHours; GenderPreference get genderPref; double? get price; bool get isFurnished;
/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopFormCopyWith<ShopForm> get copyWith => _$ShopFormCopyWithImpl<ShopForm>(this as ShopForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopForm&&(identical(other.existingCoverImageUrl, existingCoverImageUrl) || other.existingCoverImageUrl == existingCoverImageUrl)&&const DeepCollectionEquality().equals(other.existingGalleryImageUrls, existingGalleryImageUrls)&&const DeepCollectionEquality().equals(other.newCoverImageBytes, newCoverImageBytes)&&const DeepCollectionEquality().equals(other.newGalleryImageBytes, newGalleryImageBytes)&&const DeepCollectionEquality().equals(other.galleryImageUrlsToDelete, galleryImageUrlsToDelete)&&(identical(other.isCoverImageDeleted, isCoverImageDeleted) || other.isCoverImageDeleted == isCoverImageDeleted)&&(identical(other.category, category) || other.category == category)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.messagingNumber, messagingNumber) || other.messagingNumber == messagingNumber)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.email, email) || other.email == email)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&const DeepCollectionEquality().equals(other.openingHours, openingHours)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished));
}


@override
int get hashCode => Object.hashAll([runtimeType,existingCoverImageUrl,const DeepCollectionEquality().hash(existingGalleryImageUrls),const DeepCollectionEquality().hash(newCoverImageBytes),const DeepCollectionEquality().hash(newGalleryImageBytes),const DeepCollectionEquality().hash(galleryImageUrlsToDelete),isCoverImageDeleted,category,subCategory,latLng,name,description,phoneNumber,messagingNumber,cityName,sectorName,streetAddress,email,facebookUrl,instagramUrl,websiteUrl,const DeepCollectionEquality().hash(openingHours),genderPref,price,isFurnished]);

@override
String toString() {
  return 'ShopForm(existingCoverImageUrl: $existingCoverImageUrl, existingGalleryImageUrls: $existingGalleryImageUrls, newCoverImageBytes: $newCoverImageBytes, newGalleryImageBytes: $newGalleryImageBytes, galleryImageUrlsToDelete: $galleryImageUrlsToDelete, isCoverImageDeleted: $isCoverImageDeleted, category: $category, subCategory: $subCategory, latLng: $latLng, name: $name, description: $description, phoneNumber: $phoneNumber, messagingNumber: $messagingNumber, cityName: $cityName, sectorName: $sectorName, streetAddress: $streetAddress, email: $email, facebookUrl: $facebookUrl, instagramUrl: $instagramUrl, websiteUrl: $websiteUrl, openingHours: $openingHours, genderPref: $genderPref, price: $price, isFurnished: $isFurnished)';
}


}

/// @nodoc
abstract mixin class $ShopFormCopyWith<$Res>  {
  factory $ShopFormCopyWith(ShopForm value, $Res Function(ShopForm) _then) = _$ShopFormCopyWithImpl;
@useResult
$Res call({
 String? existingCoverImageUrl, List<String> existingGalleryImageUrls, Uint8List? newCoverImageBytes, List<Uint8List> newGalleryImageBytes, List<String> galleryImageUrlsToDelete, bool isCoverImageDeleted, Category? category, SubCategory? subCategory, LatLng? latLng, String name, String description, String phoneNumber, String messagingNumber, String cityName, String sectorName, String streetAddress, String email, String facebookUrl, String instagramUrl, String websiteUrl, List<OpeningHours> openingHours, GenderPreference genderPref, double? price, bool isFurnished
});




}
/// @nodoc
class _$ShopFormCopyWithImpl<$Res>
    implements $ShopFormCopyWith<$Res> {
  _$ShopFormCopyWithImpl(this._self, this._then);

  final ShopForm _self;
  final $Res Function(ShopForm) _then;

/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? existingCoverImageUrl = freezed,Object? existingGalleryImageUrls = null,Object? newCoverImageBytes = freezed,Object? newGalleryImageBytes = null,Object? galleryImageUrlsToDelete = null,Object? isCoverImageDeleted = null,Object? category = freezed,Object? subCategory = freezed,Object? latLng = freezed,Object? name = null,Object? description = null,Object? phoneNumber = null,Object? messagingNumber = null,Object? cityName = null,Object? sectorName = null,Object? streetAddress = null,Object? email = null,Object? facebookUrl = null,Object? instagramUrl = null,Object? websiteUrl = null,Object? openingHours = null,Object? genderPref = null,Object? price = freezed,Object? isFurnished = null,}) {
  return _then(_self.copyWith(
existingCoverImageUrl: freezed == existingCoverImageUrl ? _self.existingCoverImageUrl : existingCoverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,existingGalleryImageUrls: null == existingGalleryImageUrls ? _self.existingGalleryImageUrls : existingGalleryImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,newCoverImageBytes: freezed == newCoverImageBytes ? _self.newCoverImageBytes : newCoverImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,newGalleryImageBytes: null == newGalleryImageBytes ? _self.newGalleryImageBytes : newGalleryImageBytes // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,galleryImageUrlsToDelete: null == galleryImageUrlsToDelete ? _self.galleryImageUrlsToDelete : galleryImageUrlsToDelete // ignore: cast_nullable_to_non_nullable
as List<String>,isCoverImageDeleted: null == isCoverImageDeleted ? _self.isCoverImageDeleted : isCoverImageDeleted // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as SubCategory?,latLng: freezed == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,messagingNumber: null == messagingNumber ? _self.messagingNumber : messagingNumber // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,facebookUrl: null == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: null == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,openingHours: null == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ShopForm].
extension ShopFormPatterns on ShopForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShopForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShopForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShopForm value)  $default,){
final _that = this;
switch (_that) {
case _ShopForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShopForm value)?  $default,){
final _that = this;
switch (_that) {
case _ShopForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? existingCoverImageUrl,  List<String> existingGalleryImageUrls,  Uint8List? newCoverImageBytes,  List<Uint8List> newGalleryImageBytes,  List<String> galleryImageUrlsToDelete,  bool isCoverImageDeleted,  Category? category,  SubCategory? subCategory,  LatLng? latLng,  String name,  String description,  String phoneNumber,  String messagingNumber,  String cityName,  String sectorName,  String streetAddress,  String email,  String facebookUrl,  String instagramUrl,  String websiteUrl,  List<OpeningHours> openingHours,  GenderPreference genderPref,  double? price,  bool isFurnished)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopForm() when $default != null:
return $default(_that.existingCoverImageUrl,_that.existingGalleryImageUrls,_that.newCoverImageBytes,_that.newGalleryImageBytes,_that.galleryImageUrlsToDelete,_that.isCoverImageDeleted,_that.category,_that.subCategory,_that.latLng,_that.name,_that.description,_that.phoneNumber,_that.messagingNumber,_that.cityName,_that.sectorName,_that.streetAddress,_that.email,_that.facebookUrl,_that.instagramUrl,_that.websiteUrl,_that.openingHours,_that.genderPref,_that.price,_that.isFurnished);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? existingCoverImageUrl,  List<String> existingGalleryImageUrls,  Uint8List? newCoverImageBytes,  List<Uint8List> newGalleryImageBytes,  List<String> galleryImageUrlsToDelete,  bool isCoverImageDeleted,  Category? category,  SubCategory? subCategory,  LatLng? latLng,  String name,  String description,  String phoneNumber,  String messagingNumber,  String cityName,  String sectorName,  String streetAddress,  String email,  String facebookUrl,  String instagramUrl,  String websiteUrl,  List<OpeningHours> openingHours,  GenderPreference genderPref,  double? price,  bool isFurnished)  $default,) {final _that = this;
switch (_that) {
case _ShopForm():
return $default(_that.existingCoverImageUrl,_that.existingGalleryImageUrls,_that.newCoverImageBytes,_that.newGalleryImageBytes,_that.galleryImageUrlsToDelete,_that.isCoverImageDeleted,_that.category,_that.subCategory,_that.latLng,_that.name,_that.description,_that.phoneNumber,_that.messagingNumber,_that.cityName,_that.sectorName,_that.streetAddress,_that.email,_that.facebookUrl,_that.instagramUrl,_that.websiteUrl,_that.openingHours,_that.genderPref,_that.price,_that.isFurnished);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? existingCoverImageUrl,  List<String> existingGalleryImageUrls,  Uint8List? newCoverImageBytes,  List<Uint8List> newGalleryImageBytes,  List<String> galleryImageUrlsToDelete,  bool isCoverImageDeleted,  Category? category,  SubCategory? subCategory,  LatLng? latLng,  String name,  String description,  String phoneNumber,  String messagingNumber,  String cityName,  String sectorName,  String streetAddress,  String email,  String facebookUrl,  String instagramUrl,  String websiteUrl,  List<OpeningHours> openingHours,  GenderPreference genderPref,  double? price,  bool isFurnished)?  $default,) {final _that = this;
switch (_that) {
case _ShopForm() when $default != null:
return $default(_that.existingCoverImageUrl,_that.existingGalleryImageUrls,_that.newCoverImageBytes,_that.newGalleryImageBytes,_that.galleryImageUrlsToDelete,_that.isCoverImageDeleted,_that.category,_that.subCategory,_that.latLng,_that.name,_that.description,_that.phoneNumber,_that.messagingNumber,_that.cityName,_that.sectorName,_that.streetAddress,_that.email,_that.facebookUrl,_that.instagramUrl,_that.websiteUrl,_that.openingHours,_that.genderPref,_that.price,_that.isFurnished);case _:
  return null;

}
}

}

/// @nodoc


class _ShopForm extends ShopForm {
  const _ShopForm({this.existingCoverImageUrl, final  List<String> existingGalleryImageUrls = const [], this.newCoverImageBytes, final  List<Uint8List> newGalleryImageBytes = const [], final  List<String> galleryImageUrlsToDelete = const [], this.isCoverImageDeleted = false, required this.category, this.subCategory, required this.latLng, required this.name, required this.description, required this.phoneNumber, required this.messagingNumber, required this.cityName, required this.sectorName, required this.streetAddress, required this.email, required this.facebookUrl, required this.instagramUrl, required this.websiteUrl, required final  List<OpeningHours> openingHours, required this.genderPref, this.price, required this.isFurnished}): _existingGalleryImageUrls = existingGalleryImageUrls,_newGalleryImageBytes = newGalleryImageBytes,_galleryImageUrlsToDelete = galleryImageUrlsToDelete,_openingHours = openingHours,super._();
  

// --- Enhanced Image State ---
@override final  String? existingCoverImageUrl;
 final  List<String> _existingGalleryImageUrls;
@override@JsonKey() List<String> get existingGalleryImageUrls {
  if (_existingGalleryImageUrls is EqualUnmodifiableListView) return _existingGalleryImageUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_existingGalleryImageUrls);
}

@override final  Uint8List? newCoverImageBytes;
 final  List<Uint8List> _newGalleryImageBytes;
@override@JsonKey() List<Uint8List> get newGalleryImageBytes {
  if (_newGalleryImageBytes is EqualUnmodifiableListView) return _newGalleryImageBytes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newGalleryImageBytes);
}

 final  List<String> _galleryImageUrlsToDelete;
@override@JsonKey() List<String> get galleryImageUrlsToDelete {
  if (_galleryImageUrlsToDelete is EqualUnmodifiableListView) return _galleryImageUrlsToDelete;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImageUrlsToDelete);
}

@override@JsonKey() final  bool isCoverImageDeleted;
// --- Other Form Fields ---
@override final  Category? category;
@override final  SubCategory? subCategory;
@override final  LatLng? latLng;
@override final  String name;
@override final  String description;
@override final  String phoneNumber;
@override final  String messagingNumber;
@override final  String cityName;
@override final  String sectorName;
@override final  String streetAddress;
@override final  String email;
@override final  String facebookUrl;
@override final  String instagramUrl;
@override final  String websiteUrl;
 final  List<OpeningHours> _openingHours;
@override List<OpeningHours> get openingHours {
  if (_openingHours is EqualUnmodifiableListView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_openingHours);
}

@override final  GenderPreference genderPref;
@override final  double? price;
@override final  bool isFurnished;

/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopFormCopyWith<_ShopForm> get copyWith => __$ShopFormCopyWithImpl<_ShopForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopForm&&(identical(other.existingCoverImageUrl, existingCoverImageUrl) || other.existingCoverImageUrl == existingCoverImageUrl)&&const DeepCollectionEquality().equals(other._existingGalleryImageUrls, _existingGalleryImageUrls)&&const DeepCollectionEquality().equals(other.newCoverImageBytes, newCoverImageBytes)&&const DeepCollectionEquality().equals(other._newGalleryImageBytes, _newGalleryImageBytes)&&const DeepCollectionEquality().equals(other._galleryImageUrlsToDelete, _galleryImageUrlsToDelete)&&(identical(other.isCoverImageDeleted, isCoverImageDeleted) || other.isCoverImageDeleted == isCoverImageDeleted)&&(identical(other.category, category) || other.category == category)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.messagingNumber, messagingNumber) || other.messagingNumber == messagingNumber)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.email, email) || other.email == email)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&(identical(other.price, price) || other.price == price)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished));
}


@override
int get hashCode => Object.hashAll([runtimeType,existingCoverImageUrl,const DeepCollectionEquality().hash(_existingGalleryImageUrls),const DeepCollectionEquality().hash(newCoverImageBytes),const DeepCollectionEquality().hash(_newGalleryImageBytes),const DeepCollectionEquality().hash(_galleryImageUrlsToDelete),isCoverImageDeleted,category,subCategory,latLng,name,description,phoneNumber,messagingNumber,cityName,sectorName,streetAddress,email,facebookUrl,instagramUrl,websiteUrl,const DeepCollectionEquality().hash(_openingHours),genderPref,price,isFurnished]);

@override
String toString() {
  return 'ShopForm(existingCoverImageUrl: $existingCoverImageUrl, existingGalleryImageUrls: $existingGalleryImageUrls, newCoverImageBytes: $newCoverImageBytes, newGalleryImageBytes: $newGalleryImageBytes, galleryImageUrlsToDelete: $galleryImageUrlsToDelete, isCoverImageDeleted: $isCoverImageDeleted, category: $category, subCategory: $subCategory, latLng: $latLng, name: $name, description: $description, phoneNumber: $phoneNumber, messagingNumber: $messagingNumber, cityName: $cityName, sectorName: $sectorName, streetAddress: $streetAddress, email: $email, facebookUrl: $facebookUrl, instagramUrl: $instagramUrl, websiteUrl: $websiteUrl, openingHours: $openingHours, genderPref: $genderPref, price: $price, isFurnished: $isFurnished)';
}


}

/// @nodoc
abstract mixin class _$ShopFormCopyWith<$Res> implements $ShopFormCopyWith<$Res> {
  factory _$ShopFormCopyWith(_ShopForm value, $Res Function(_ShopForm) _then) = __$ShopFormCopyWithImpl;
@override @useResult
$Res call({
 String? existingCoverImageUrl, List<String> existingGalleryImageUrls, Uint8List? newCoverImageBytes, List<Uint8List> newGalleryImageBytes, List<String> galleryImageUrlsToDelete, bool isCoverImageDeleted, Category? category, SubCategory? subCategory, LatLng? latLng, String name, String description, String phoneNumber, String messagingNumber, String cityName, String sectorName, String streetAddress, String email, String facebookUrl, String instagramUrl, String websiteUrl, List<OpeningHours> openingHours, GenderPreference genderPref, double? price, bool isFurnished
});




}
/// @nodoc
class __$ShopFormCopyWithImpl<$Res>
    implements _$ShopFormCopyWith<$Res> {
  __$ShopFormCopyWithImpl(this._self, this._then);

  final _ShopForm _self;
  final $Res Function(_ShopForm) _then;

/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? existingCoverImageUrl = freezed,Object? existingGalleryImageUrls = null,Object? newCoverImageBytes = freezed,Object? newGalleryImageBytes = null,Object? galleryImageUrlsToDelete = null,Object? isCoverImageDeleted = null,Object? category = freezed,Object? subCategory = freezed,Object? latLng = freezed,Object? name = null,Object? description = null,Object? phoneNumber = null,Object? messagingNumber = null,Object? cityName = null,Object? sectorName = null,Object? streetAddress = null,Object? email = null,Object? facebookUrl = null,Object? instagramUrl = null,Object? websiteUrl = null,Object? openingHours = null,Object? genderPref = null,Object? price = freezed,Object? isFurnished = null,}) {
  return _then(_ShopForm(
existingCoverImageUrl: freezed == existingCoverImageUrl ? _self.existingCoverImageUrl : existingCoverImageUrl // ignore: cast_nullable_to_non_nullable
as String?,existingGalleryImageUrls: null == existingGalleryImageUrls ? _self._existingGalleryImageUrls : existingGalleryImageUrls // ignore: cast_nullable_to_non_nullable
as List<String>,newCoverImageBytes: freezed == newCoverImageBytes ? _self.newCoverImageBytes : newCoverImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,newGalleryImageBytes: null == newGalleryImageBytes ? _self._newGalleryImageBytes : newGalleryImageBytes // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,galleryImageUrlsToDelete: null == galleryImageUrlsToDelete ? _self._galleryImageUrlsToDelete : galleryImageUrlsToDelete // ignore: cast_nullable_to_non_nullable
as List<String>,isCoverImageDeleted: null == isCoverImageDeleted ? _self.isCoverImageDeleted : isCoverImageDeleted // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as SubCategory?,latLng: freezed == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,messagingNumber: null == messagingNumber ? _self.messagingNumber : messagingNumber // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,facebookUrl: null == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: null == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,openingHours: null == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double?,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
