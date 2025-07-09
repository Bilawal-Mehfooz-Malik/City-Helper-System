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
import 'package:app/src/features/my_shop/presentation/widgets/basic_info_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/category_selection_widget.dart';
import 'package:app/src/features/my_shop/presentation/widgets/location_and_media_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/residence_specific_section.dart';
import 'package:app/src/features/my_shop/presentation/widgets/social_media_section.dart';
import 'package:app/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  // Controllers
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messagingNumberController = TextEditingController();
  final _streetAddressController = TextEditingController();
  final _priceController = TextEditingController();
  final _emailController = TextEditingController();
  final _facebookController = TextEditingController();
  final _instagramController = TextEditingController();
  final _websiteController = TextEditingController();

  // Category selection
  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;

  // Other form fields
  LatLng? _pickedLatLng;
  String? _coverImagePath;
  List<String> _galleryImagePaths = [];
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
      _coverImagePath = shop.coverImageUrl;
      _galleryImagePaths = shop.galleryImageUrls;

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
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1)); // Monday

    _openingHours = List.generate(7, (index) {
      final dayDate = startOfWeek.add(Duration(days: index));
      final day = DateFormat('EEEE').format(dayDate);
      return OpeningHours(day: day, open: '09:00 AM', close: '21:00 PM');
    });
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Shop'.hardcoded : 'Register Shop'.hardcoded,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ResponsiveScrollable(
          child: Column(
            spacing: Sizes.p8,
            children: [
              CategorySelectionSection(
                selectedCategory: _selectedCategory,
                selectedSubCategory: _selectedSubCategory,
                onCategoryChanged: (category) {
                  setState(() {
                    _selectedCategory = category;
                    _selectedSubCategory = null;
                  });
                },
                onSubCategoryChanged: (subCategory) {
                  setState(() => _selectedSubCategory = subCategory);
                },
              ),
              BasicInfoSection(
                nameController: _nameController,
                descriptionController: _descriptionController,
                phoneController: _phoneController,
                messagingNumberController: _messagingNumberController,
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
                coverImagePath: _coverImagePath,
                galleryImagePaths: _galleryImagePaths,
                openingHours: _openingHours,
                onLocationPicked: (latLng) =>
                    setState(() => _pickedLatLng = latLng),
                onCoverImagePicked: (path) =>
                    setState(() => _coverImagePath = path),
                onGalleryImagesPicked: (paths) =>
                    setState(() => _galleryImagePaths = paths),
                onOpeningHoursChanged: (hours) =>
                    setState(() => _openingHours = hours),
              ),
              if (_selectedCategory?.id == 1)
                ResidenceSpecificSection(
                  priceController: _priceController,
                  isFurnished: _isFurnished,
                  genderPref: _genderPref,
                  onFurnishedChanged: (value) =>
                      setState(() => _isFurnished = value),
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
              gapH24,
              PrimaryButton(
                onPressed: () {}, // TODO: Save logic
                text: isEditing
                    ? 'Save Changes'.hardcoded
                    : 'Register Shop'.hardcoded,
              ),
              gapH8,
            ],
          ),
        ),
      ),
    );
  }
}
