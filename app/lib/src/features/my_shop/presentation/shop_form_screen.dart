import 'dart:typed_data';

import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/my_shop/presentation/shop_controller.dart';
import 'package:app/src/features/my_shop/presentation/widgets/basic_info_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/category_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_and_media_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/residence_specific_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/social_media_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class ShopFormScreen extends ConsumerStatefulWidget {
  final EntityDetail? initialShop;

  const ShopFormScreen({super.key, this.initialShop});

  @override
  ConsumerState<ShopFormScreen> createState() => _ShopFormScreenState();
}

class _ShopFormScreenState extends ConsumerState<ShopFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messagingNumberController = TextEditingController();
  final _cityNameController = TextEditingController();
  final _sectorNameController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _priceController = TextEditingController();
  final _emailController = TextEditingController();
  final _facebookController = TextEditingController();
  final _instagramController = TextEditingController();
  final _websiteController = TextEditingController();

  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;

  LatLng? _pickedLatLng;
  Uint8List? _coverImageBytes;
  List<Uint8List> _galleryImageBytes = [];
  List<OpeningHours> _openingHours = [];
  bool _isFurnished = false;
  GenderPreference _genderPref = GenderPreference.any;

  @override
  void initState() {
    super.initState();
    _initializeFromShop();
  }

  void _initializeFromShop() {
    final shop = widget.initialShop;
    if (shop != null) {
      _nameController.text = shop.name;
      _descriptionController.text = shop.description;
      _phoneController.text = shop.phoneNumber ?? '';
      _messagingNumberController.text = shop.messagingNumber ?? '';
      _streetAddressController.text = shop.streetAddress;
      _emailController.text = shop.email ?? '';
      _facebookController.text = shop.facebookUrl ?? '';
      _instagramController.text = shop.instagramUrl ?? '';
      _websiteController.text = shop.websiteUrl ?? '';
      _pickedLatLng = shop.latLng;
      _openingHours = shop.openingHours;

      if (shop is ResidenceDetail) {
        _priceController.text = shop.price.toString();
        _isFurnished = shop.isFurnished;
        _genderPref = shop.genderPref;
      } else if (shop is FoodDetail) {
        _genderPref = shop.genderPref;
      }
    } else {
      _setDefaultOpeningHours();
    }
  }

  void _setDefaultOpeningHours() {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    _openingHours = List.generate(7, (index) {
      final dayDate = startOfWeek.add(Duration(days: index));
      final day = DateFormat('EEEE').format(dayDate);
      return OpeningHours(day: day, open: '09:00 AM', close: '21:00 PM');
    });
  }

  Future<void> _setShop() async {
    if (!_formKey.currentState!.validate() ||
        _selectedCategory == null ||
        _pickedLatLng == null ||
        _coverImageBytes == null ||
        _galleryImageBytes.isEmpty) {
      showSnackBar(
        context: context,
        message: 'Please fill all required fields'.hardcoded,
      );
      return;
    }

    final formData = ShopForm(
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      phoneNumber: _phoneController.text.trim(),
      messagingNumber: _messagingNumberController.text.trim(),
      cityName: _cityNameController.text.trim(),
      sectorName: _sectorNameController.text.trim(),
      streetAddress: _streetAddressController.text.trim(),
      email: _emailController.text.trim(),
      facebookUrl: _facebookController.text.trim(),
      instagramUrl: _instagramController.text.trim(),
      websiteUrl: _websiteController.text.trim(),
      category: _selectedCategory!,
      subCategory: _selectedSubCategory,
      latLng: _pickedLatLng!,
      coverImageBytes: _coverImageBytes!,
      galleryImageBytes: _galleryImageBytes,
      openingHours: _openingHours,
      genderPref: _genderPref,
      price: double.tryParse(_priceController.text.trim()),
      isFurnished: _isFurnished,
    );

    final shop = formData.toEntityDetail();

    await ref
        .read(shopControllerProvider.notifier)
        .setShop(
          categoryId: formData.category.id,
          shop: shop,
          coverImageBytes: formData.coverImageBytes,
          galleryImagesBytes: formData.galleryImageBytes,
        );
    if (mounted) {
      context.pop();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _messagingNumberController.dispose();
    _streetAddressController.dispose();
    _priceController.dispose();
    _emailController.dispose();
    _facebookController.dispose();
    _instagramController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.initialShop != null;
    final controllerState = ref.watch(shopControllerProvider);
    ref.listen(shopControllerProvider, (prev, next) {
      next.whenOrNull(
        error: (err, _) => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to add shop: $err'))),
        data: (_) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Shop added successfully')),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Shop'.hardcoded : 'Register Shop'.hardcoded,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ResponsiveScrollable(
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.p16,
            vertical: Sizes.p8,
          ),
          child: Column(
            spacing: Sizes.p12,
            children: [
              CategorySection(
                selectedCategory: _selectedCategory,
                selectedSubCategory: _selectedSubCategory,
                onCategoryChanged: (category) {
                  setState(() {
                    _selectedCategory = category;
                    _selectedSubCategory = null;
                  });
                },
                onSubCategoryChanged: (subCategory) =>
                    setState(() => _selectedSubCategory = subCategory),
              ),
              BasicInfoSection(
                nameController: _nameController,
                descriptionController: _descriptionController,
                phoneController: _phoneController,
                messagingNumberController: _messagingNumberController,
                cityNameController: _cityNameController,
                sectorNameController: _sectorNameController,
                streetAddressController: _streetAddressController,
                emailController: _emailController,
              ),
              SocialMediaSection(
                facebookController: _facebookController,
                instagramController: _instagramController,
                websiteController: _websiteController,
              ),
              LocationAndMediaSection(
                pickedLatLng: _pickedLatLng,
                coverImageBytes: _coverImageBytes,
                galleryImagesBytes: _galleryImageBytes,
                openingHours: _openingHours,
                onLocationPicked: (latLng) =>
                    setState(() => _pickedLatLng = latLng),
                onCoverImagePicked: (bytes) =>
                    setState(() => _coverImageBytes = bytes),
                onGalleryImagesPicked: (bytesList) =>
                    setState(() => _galleryImageBytes = bytesList),
                onOpeningHoursChanged: (hours) =>
                    setState(() => _openingHours = hours),
              ),
              if (_selectedCategory?.id == 1)
                ResidenceSpecificSection(
                  priceController: _priceController,
                  isFurnished: _isFurnished,
                  genderPref: _genderPref,
                  onFurnishedChanged: (val) =>
                      setState(() => _isFurnished = val),
                ),
              if (_selectedCategory?.id == 1 || _selectedCategory?.id == 2)
                DropdownButtonFormField<GenderPreference>(
                  value: _genderPref,
                  decoration: InputDecoration(
                    labelText: 'Gender Preference'.hardcoded,
                  ),
                  items: GenderPreference.values
                      .map(
                        (gp) =>
                            DropdownMenuItem(value: gp, child: Text(gp.name)),
                      )
                      .toList(),
                  onChanged: (val) => setState(() => _genderPref = val!),
                ),
              gapH8,
              PrimaryButton(
                isLoading: controllerState.isLoading,
                isDisabled: controllerState.isLoading,

                onPressed: _setShop,
                text: isEditing
                    ? 'Save Changes'.hardcoded
                    : 'Register Shop'.hardcoded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
