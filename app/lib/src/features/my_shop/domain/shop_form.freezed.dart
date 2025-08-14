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

// Step 1: Basic Details
 Category? get category; SubCategory? get subCategory; String get name; String get description;// Step 2: Location Info
 String get cityName; String get sectorName; String get streetAddress; LatLng? get latLng;// Step 3: Contact & Social Links
 String get phoneNumber; String get messagingNumber; String get email; String get facebookUrl; String get instagramUrl; String get websiteUrl;// Step 4: Business Specific Info
 List<OpeningHours> get openingHours; double? get pricing; bool get isFurnished; GenderPreference get genderPref;// Step 5: Media Uploads
 Uint8List? get coverImageBytes; List<Uint8List> get galleryImageBytes; List<String> get galleryUrlsToDelete;
/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShopFormCopyWith<ShopForm> get copyWith => _$ShopFormCopyWithImpl<ShopForm>(this as ShopForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShopForm&&(identical(other.category, category) || other.category == category)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.messagingNumber, messagingNumber) || other.messagingNumber == messagingNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&const DeepCollectionEquality().equals(other.openingHours, openingHours)&&(identical(other.pricing, pricing) || other.pricing == pricing)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&const DeepCollectionEquality().equals(other.coverImageBytes, coverImageBytes)&&const DeepCollectionEquality().equals(other.galleryImageBytes, galleryImageBytes)&&const DeepCollectionEquality().equals(other.galleryUrlsToDelete, galleryUrlsToDelete));
}


@override
int get hashCode => Object.hashAll([runtimeType,category,subCategory,name,description,cityName,sectorName,streetAddress,latLng,phoneNumber,messagingNumber,email,facebookUrl,instagramUrl,websiteUrl,const DeepCollectionEquality().hash(openingHours),pricing,isFurnished,genderPref,const DeepCollectionEquality().hash(coverImageBytes),const DeepCollectionEquality().hash(galleryImageBytes),const DeepCollectionEquality().hash(galleryUrlsToDelete)]);

@override
String toString() {
  return 'ShopForm(category: $category, subCategory: $subCategory, name: $name, description: $description, cityName: $cityName, sectorName: $sectorName, streetAddress: $streetAddress, latLng: $latLng, phoneNumber: $phoneNumber, messagingNumber: $messagingNumber, email: $email, facebookUrl: $facebookUrl, instagramUrl: $instagramUrl, websiteUrl: $websiteUrl, openingHours: $openingHours, price: $pricing, isFurnished: $isFurnished, genderPref: $genderPref, coverImageBytes: $coverImageBytes, galleryImageBytes: $galleryImageBytes, galleryUrlsToDelete: $galleryUrlsToDelete)';
}


}

/// @nodoc
abstract mixin class $ShopFormCopyWith<$Res>  {
  factory $ShopFormCopyWith(ShopForm value, $Res Function(ShopForm) _then) = _$ShopFormCopyWithImpl;
@useResult
$Res call({
 Category? category, SubCategory? subCategory, String name, String description, String cityName, String sectorName, String streetAddress, LatLng? latLng, String phoneNumber, String messagingNumber, String email, String facebookUrl, String instagramUrl, String websiteUrl, List<OpeningHours> openingHours, double? price, bool isFurnished, GenderPreference genderPref, Uint8List? coverImageBytes, List<Uint8List> galleryImageBytes, List<String> galleryUrlsToDelete
});


$CategoryCopyWith<$Res>? get category;$SubCategoryCopyWith<$Res>? get subCategory;

}
/// @nodoc
class _$ShopFormCopyWithImpl<$Res>
    implements $ShopFormCopyWith<$Res> {
  _$ShopFormCopyWithImpl(this._self, this._then);

  final ShopForm _self;
  final $Res Function(ShopForm) _then;

/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? subCategory = freezed,Object? name = null,Object? description = null,Object? cityName = null,Object? sectorName = null,Object? streetAddress = null,Object? latLng = freezed,Object? phoneNumber = null,Object? messagingNumber = null,Object? email = null,Object? facebookUrl = null,Object? instagramUrl = null,Object? websiteUrl = null,Object? openingHours = null,Object? price = freezed,Object? isFurnished = null,Object? genderPref = null,Object? coverImageBytes = freezed,Object? galleryImageBytes = null,Object? galleryUrlsToDelete = null,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as SubCategory?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,latLng: freezed == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng?,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,messagingNumber: null == messagingNumber ? _self.messagingNumber : messagingNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,facebookUrl: null == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: null == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,openingHours: null == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,price: freezed == price ? _self.pricing : price // ignore: cast_nullable_to_non_nullable
as double?,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,coverImageBytes: freezed == coverImageBytes ? _self.coverImageBytes : coverImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,galleryImageBytes: null == galleryImageBytes ? _self.galleryImageBytes : galleryImageBytes // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,galleryUrlsToDelete: null == galleryUrlsToDelete ? _self.galleryUrlsToDelete : galleryUrlsToDelete // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubCategoryCopyWith<$Res>? get subCategory {
    if (_self.subCategory == null) {
    return null;
  }

  return $SubCategoryCopyWith<$Res>(_self.subCategory!, (value) {
    return _then(_self.copyWith(subCategory: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Category? category,  SubCategory? subCategory,  String name,  String description,  String cityName,  String sectorName,  String streetAddress,  LatLng? latLng,  String phoneNumber,  String messagingNumber,  String email,  String facebookUrl,  String instagramUrl,  String websiteUrl,  List<OpeningHours> openingHours,  double? price,  bool isFurnished,  GenderPreference genderPref,  Uint8List? coverImageBytes,  List<Uint8List> galleryImageBytes,  List<String> galleryUrlsToDelete)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShopForm() when $default != null:
return $default(_that.category,_that.subCategory,_that.name,_that.description,_that.cityName,_that.sectorName,_that.streetAddress,_that.latLng,_that.phoneNumber,_that.messagingNumber,_that.email,_that.facebookUrl,_that.instagramUrl,_that.websiteUrl,_that.openingHours,_that.pricing,_that.isFurnished,_that.genderPref,_that.coverImageBytes,_that.galleryImageBytes,_that.galleryUrlsToDelete);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Category? category,  SubCategory? subCategory,  String name,  String description,  String cityName,  String sectorName,  String streetAddress,  LatLng? latLng,  String phoneNumber,  String messagingNumber,  String email,  String facebookUrl,  String instagramUrl,  String websiteUrl,  List<OpeningHours> openingHours,  double? price,  bool isFurnished,  GenderPreference genderPref,  Uint8List? coverImageBytes,  List<Uint8List> galleryImageBytes,  List<String> galleryUrlsToDelete)  $default,) {final _that = this;
switch (_that) {
case _ShopForm():
return $default(_that.category,_that.subCategory,_that.name,_that.description,_that.cityName,_that.sectorName,_that.streetAddress,_that.latLng,_that.phoneNumber,_that.messagingNumber,_that.email,_that.facebookUrl,_that.instagramUrl,_that.websiteUrl,_that.openingHours,_that.pricing,_that.isFurnished,_that.genderPref,_that.coverImageBytes,_that.galleryImageBytes,_that.galleryUrlsToDelete);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Category? category,  SubCategory? subCategory,  String name,  String description,  String cityName,  String sectorName,  String streetAddress,  LatLng? latLng,  String phoneNumber,  String messagingNumber,  String email,  String facebookUrl,  String instagramUrl,  String websiteUrl,  List<OpeningHours> openingHours,  double? price,  bool isFurnished,  GenderPreference genderPref,  Uint8List? coverImageBytes,  List<Uint8List> galleryImageBytes,  List<String> galleryUrlsToDelete)?  $default,) {final _that = this;
switch (_that) {
case _ShopForm() when $default != null:
return $default(_that.category,_that.subCategory,_that.name,_that.description,_that.cityName,_that.sectorName,_that.streetAddress,_that.latLng,_that.phoneNumber,_that.messagingNumber,_that.email,_that.facebookUrl,_that.instagramUrl,_that.websiteUrl,_that.openingHours,_that.pricing,_that.isFurnished,_that.genderPref,_that.coverImageBytes,_that.galleryImageBytes,_that.galleryUrlsToDelete);case _:
  return null;

}
}

}

/// @nodoc


class _ShopForm implements ShopForm {
  const _ShopForm({this.category, this.subCategory, required this.name, required this.description, required this.cityName, required this.sectorName, required this.streetAddress, required this.latLng, required this.phoneNumber, required this.messagingNumber, required this.email, required this.facebookUrl, required this.instagramUrl, required this.websiteUrl, required final  List<OpeningHours> openingHours, this.pricing, required this.isFurnished, required this.genderPref, this.coverImageBytes, final  List<Uint8List> galleryImageBytes = const [], final  List<String> galleryUrlsToDelete = const []}): _openingHours = openingHours,_galleryImageBytes = galleryImageBytes,_galleryUrlsToDelete = galleryUrlsToDelete;
  

// Step 1: Basic Details
@override final  Category? category;
@override final  SubCategory? subCategory;
@override final  String name;
@override final  String description;
// Step 2: Location Info
@override final  String cityName;
@override final  String sectorName;
@override final  String streetAddress;
@override final  LatLng? latLng;
// Step 3: Contact & Social Links
@override final  String phoneNumber;
@override final  String messagingNumber;
@override final  String email;
@override final  String facebookUrl;
@override final  String instagramUrl;
@override final  String websiteUrl;
// Step 4: Business Specific Info
 final  List<OpeningHours> _openingHours;
// Step 4: Business Specific Info
@override List<OpeningHours> get openingHours {
  if (_openingHours is EqualUnmodifiableListView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_openingHours);
}

@override final  double? pricing;
@override final  bool isFurnished;
@override final  GenderPreference genderPref;
// Step 5: Media Uploads
@override final  Uint8List? coverImageBytes;
 final  List<Uint8List> _galleryImageBytes;
@override@JsonKey() List<Uint8List> get galleryImageBytes {
  if (_galleryImageBytes is EqualUnmodifiableListView) return _galleryImageBytes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryImageBytes);
}

 final  List<String> _galleryUrlsToDelete;
@override@JsonKey() List<String> get galleryUrlsToDelete {
  if (_galleryUrlsToDelete is EqualUnmodifiableListView) return _galleryUrlsToDelete;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_galleryUrlsToDelete);
}


/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShopFormCopyWith<_ShopForm> get copyWith => __$ShopFormCopyWithImpl<_ShopForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShopForm&&(identical(other.category, category) || other.category == category)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.sectorName, sectorName) || other.sectorName == sectorName)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.latLng, latLng) || other.latLng == latLng)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.messagingNumber, messagingNumber) || other.messagingNumber == messagingNumber)&&(identical(other.email, email) || other.email == email)&&(identical(other.facebookUrl, facebookUrl) || other.facebookUrl == facebookUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.websiteUrl, websiteUrl) || other.websiteUrl == websiteUrl)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.pricing, pricing) || other.pricing == pricing)&&(identical(other.isFurnished, isFurnished) || other.isFurnished == isFurnished)&&(identical(other.genderPref, genderPref) || other.genderPref == genderPref)&&const DeepCollectionEquality().equals(other.coverImageBytes, coverImageBytes)&&const DeepCollectionEquality().equals(other._galleryImageBytes, _galleryImageBytes)&&const DeepCollectionEquality().equals(other._galleryUrlsToDelete, _galleryUrlsToDelete));
}


@override
int get hashCode => Object.hashAll([runtimeType,category,subCategory,name,description,cityName,sectorName,streetAddress,latLng,phoneNumber,messagingNumber,email,facebookUrl,instagramUrl,websiteUrl,const DeepCollectionEquality().hash(_openingHours),pricing,isFurnished,genderPref,const DeepCollectionEquality().hash(coverImageBytes),const DeepCollectionEquality().hash(_galleryImageBytes),const DeepCollectionEquality().hash(_galleryUrlsToDelete)]);

@override
String toString() {
  return 'ShopForm(category: $category, subCategory: $subCategory, name: $name, description: $description, cityName: $cityName, sectorName: $sectorName, streetAddress: $streetAddress, latLng: $latLng, phoneNumber: $phoneNumber, messagingNumber: $messagingNumber, email: $email, facebookUrl: $facebookUrl, instagramUrl: $instagramUrl, websiteUrl: $websiteUrl, openingHours: $openingHours, price: $pricing, isFurnished: $isFurnished, genderPref: $genderPref, coverImageBytes: $coverImageBytes, galleryImageBytes: $galleryImageBytes, galleryUrlsToDelete: $galleryUrlsToDelete)';
}


}

/// @nodoc
abstract mixin class _$ShopFormCopyWith<$Res> implements $ShopFormCopyWith<$Res> {
  factory _$ShopFormCopyWith(_ShopForm value, $Res Function(_ShopForm) _then) = __$ShopFormCopyWithImpl;
@override @useResult
$Res call({
 Category? category, SubCategory? subCategory, String name, String description, String cityName, String sectorName, String streetAddress, LatLng? latLng, String phoneNumber, String messagingNumber, String email, String facebookUrl, String instagramUrl, String websiteUrl, List<OpeningHours> openingHours, double? price, bool isFurnished, GenderPreference genderPref, Uint8List? coverImageBytes, List<Uint8List> galleryImageBytes, List<String> galleryUrlsToDelete
});


@override $CategoryCopyWith<$Res>? get category;@override $SubCategoryCopyWith<$Res>? get subCategory;

}
/// @nodoc
class __$ShopFormCopyWithImpl<$Res>
    implements _$ShopFormCopyWith<$Res> {
  __$ShopFormCopyWithImpl(this._self, this._then);

  final _ShopForm _self;
  final $Res Function(_ShopForm) _then;

/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? subCategory = freezed,Object? name = null,Object? description = null,Object? cityName = null,Object? sectorName = null,Object? streetAddress = null,Object? latLng = freezed,Object? phoneNumber = null,Object? messagingNumber = null,Object? email = null,Object? facebookUrl = null,Object? instagramUrl = null,Object? websiteUrl = null,Object? openingHours = null,Object? price = freezed,Object? isFurnished = null,Object? genderPref = null,Object? coverImageBytes = freezed,Object? galleryImageBytes = null,Object? galleryUrlsToDelete = null,}) {
  return _then(_ShopForm(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as SubCategory?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,sectorName: null == sectorName ? _self.sectorName : sectorName // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,latLng: freezed == latLng ? _self.latLng : latLng // ignore: cast_nullable_to_non_nullable
as LatLng?,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,messagingNumber: null == messagingNumber ? _self.messagingNumber : messagingNumber // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,facebookUrl: null == facebookUrl ? _self.facebookUrl : facebookUrl // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: null == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String,websiteUrl: null == websiteUrl ? _self.websiteUrl : websiteUrl // ignore: cast_nullable_to_non_nullable
as String,openingHours: null == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as List<OpeningHours>,pricing: freezed == price ? _self.pricing : price // ignore: cast_nullable_to_non_nullable
as double?,isFurnished: null == isFurnished ? _self.isFurnished : isFurnished // ignore: cast_nullable_to_non_nullable
as bool,genderPref: null == genderPref ? _self.genderPref : genderPref // ignore: cast_nullable_to_non_nullable
as GenderPreference,coverImageBytes: freezed == coverImageBytes ? _self.coverImageBytes : coverImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,galleryImageBytes: null == galleryImageBytes ? _self._galleryImageBytes : galleryImageBytes // ignore: cast_nullable_to_non_nullable
as List<Uint8List>,galleryUrlsToDelete: null == galleryUrlsToDelete ? _self._galleryUrlsToDelete : galleryUrlsToDelete // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ShopForm
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubCategoryCopyWith<$Res>? get subCategory {
    if (_self.subCategory == null) {
    return null;
  }

  return $SubCategoryCopyWith<$Res>(_self.subCategory!, (value) {
    return _then(_self.copyWith(subCategory: value));
  });
}
}

// dart format on
