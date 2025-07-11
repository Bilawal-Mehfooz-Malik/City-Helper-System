import 'dart:typed_data';

import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/common_widgets/async_value_widget.dart';
import 'package:app/src/core/common_widgets/primary_button.dart';
import 'package:app/src/core/common_widgets/responsive_scrollable.dart';
import 'package:app/src/core/constants/app_sizes.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/core/models/opening_hours.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';
import 'package:app/src/features/categories_list/data/categories_repository.dart';
import 'package:app/src/features/categories_list/domain/category.dart';
import 'package:app/src/features/home/data/real/sub_categories_repository.dart';
import 'package:app/src/features/home/domain/sub_category.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/home_detail/domain/food_detail.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:app/src/features/my_shop/application/shop_form_provider.dart';
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

// ShopFormScreen and its build methods remain unchanged
class ShopFormScreen extends ConsumerWidget {
  final EntityDetail? initialShop;

  const ShopFormScreen({super.key, this.initialShop});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = initialShop != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Shop'.hardcoded : 'Register Shop'.hardcoded,
        ),
      ),
      body: isEditing
          ? _buildEditModeBody(context, ref)
          : _buildCreateModeBody(context, ref),
    );
  }

  Widget _buildEditModeBody(BuildContext context, WidgetRef ref) {
    final initialDataAsync = ref.watch(
      initialShopCategoryDataProvider(
        categoryId: initialShop!.categoryId,
        subCategoryId: initialShop!.subCategoryId,
      ),
    );
    return AsyncValueWidget<ShopFormInitialData>(
      value: initialDataAsync,
      data: (initialData) => ShopFormContent(
        initialShop: initialShop,
        allCategories: initialData.allCategories,
        initialSubCategories: initialData.subCategoryOptions,
        initialData: initialData,
      ),
    );
  }

  Widget _buildCreateModeBody(BuildContext context, WidgetRef ref) {
    final allCategoriesAsync = ref.watch(categoriesListFutureProvider);
    return AsyncValueWidget<List<Category>>(
      value: allCategoriesAsync,
      data: (allCategories) => ShopFormContent(
        initialShop: null,
        allCategories: allCategories,
        initialSubCategories: const [],
      ),
    );
  }
}

class ShopFormContent extends ConsumerStatefulWidget {
  final EntityDetail? initialShop;
  final ShopFormInitialData? initialData;
  final List<Category> allCategories;
  final List<SubCategory> initialSubCategories;

  const ShopFormContent({
    super.key,
    required this.initialShop,
    required this.allCategories,
    required this.initialSubCategories,
    this.initialData,
  });

  @override
  ConsumerState<ShopFormContent> createState() => _ShopFormContentState();
}

class _ShopFormContentState extends ConsumerState<ShopFormContent> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
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

  // State variables
  Category? _selectedCategory;
  SubCategory? _selectedSubCategory;
  LatLng? _pickedLatLng;
  Uint8List? _coverImageBytes;
  List<Uint8List> _galleryImageBytes = [];
  final List<String> _galleryUrlsToDelete = [];
  List<OpeningHours> _openingHours = [];
  bool _isFurnished = false;
  GenderPreference _genderPref = GenderPreference.any;

  @override
  void initState() {
    super.initState();
    _initializeFromShop();
  }

  @override
  void dispose() {
    // Dispose all controllers
    _nameController.dispose();
    _descriptionController.dispose();
    _phoneController.dispose();
    _messagingNumberController.dispose();
    _cityNameController.dispose();
    _sectorNameController.dispose();
    _streetAddressController.dispose();
    _priceController.dispose();
    _emailController.dispose();
    _facebookController.dispose();
    _instagramController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  void _initializeFromShop() {
    final shop = widget.initialShop;
    if (shop != null) {
      _nameController.text = shop.name;
      _descriptionController.text = shop.description;
      _phoneController.text = shop.phoneNumber ?? '';
      _messagingNumberController.text = shop.messagingNumber ?? '';
      _cityNameController.text = shop.cityName;
      _sectorNameController.text = shop.sectorName;
      _streetAddressController.text = shop.streetAddress;
      _emailController.text = shop.email ?? '';
      _facebookController.text = shop.facebookUrl ?? '';
      _instagramController.text = shop.instagramUrl ?? '';
      _websiteController.text = shop.websiteUrl ?? '';
      _pickedLatLng = shop.latLng;
      _openingHours = shop.openingHours;

      _selectedCategory = widget.initialData!.selectedCategory;
      _selectedSubCategory = widget.initialData!.selectedSubCategory;

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

  // ##################################################################
  // ### FULLY REVISED AND CORRECTED _setShop METHOD ###
  // ##################################################################
  // ... inside _ShopFormContentState

  Future<void> _setShop() async {
    final isEditing = widget.initialShop != null;
    final coverImageRequired = !isEditing && _coverImageBytes == null;

    if (!_formKey.currentState!.validate() ||
        _selectedCategory == null ||
        _pickedLatLng == null ||
        coverImageRequired) {
      showSnackBar(
        context: context,
        message: 'Please fill all required fields, including the cover image.'
            .hardcoded,
      );
      return;
    }

    // 1. Consolidate all form data into your type-safe ShopForm object.
    //    This is much cleaner than managing many separate variables.
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
      openingHours: _openingHours,
      genderPref: _genderPref,
      // Safely parse price, which might not exist for all categories
      price: double.tryParse(_priceController.text.trim()),
      isFurnished: _isFurnished,
      // The image bytes are not part of the entity model,
      // so they are handled separately when calling the controller.
      coverImageBytes: _coverImageBytes ?? Uint8List(0), // Provide a default
      galleryImageBytes: _galleryImageBytes,
    );

    late EntityDetail shopToSave;

    // 2. Determine whether to create a new entity or update an existing one.
    if (isEditing) {
      // --- EDITING LOGIC ---
      // Use `copyWith` on the existing shop to preserve its ID, ratings, etc.
      final existingShop = widget.initialShop!;

      if (existingShop is ResidenceDetail) {
        shopToSave = existingShop.copyWith(
          name: formData.name,
          description: formData.description,
          phoneNumber: formData.phoneNumber,
          messagingNumber: formData.messagingNumber,
          cityName: formData.cityName,
          sectorName: formData.sectorName,
          streetAddress: formData.streetAddress,
          email: formData.email,
          facebookUrl: formData.facebookUrl,
          instagramUrl: formData.instagramUrl,
          websiteUrl: formData.websiteUrl,
          latLng: formData.latLng,
          openingHours: formData.openingHours,
          genderPref: formData.genderPref,
          // Residence-specific fields
          price: formData.price ?? existingShop.price,
          isFurnished: formData.isFurnished,
        );
      } else if (existingShop is FoodDetail) {
        shopToSave = existingShop.copyWith(
          name: formData.name,
          description: formData.description,
          phoneNumber: formData.phoneNumber,
          messagingNumber: formData.messagingNumber,
          cityName: formData.cityName,
          sectorName: formData.sectorName,
          streetAddress: formData.streetAddress,
          email: formData.email,
          facebookUrl: formData.facebookUrl,
          instagramUrl: formData.instagramUrl,
          websiteUrl: formData.websiteUrl,
          latLng: formData.latLng,
          openingHours: formData.openingHours,
          genderPref: formData.genderPref,
        );
      } else {
        // Fallback for safety, though this case should not happen in your flow
        shopToSave = widget.initialShop!;
      }
    } else {
      // --- CREATION LOGIC ---
      // Your `toEntityDetail` extension is perfect for creating a new shop.
      shopToSave = formData.toEntityDetail();
    }

    // 3. Call the controller with the prepared entity and image data.
    await ref
        .read(shopControllerProvider.notifier)
        .setShop(
          shop: shopToSave,
          categoryId: _selectedCategory!.id,
          coverImageBytes: _coverImageBytes,
          galleryImagesBytes: _galleryImageBytes,
          galleryUrlsToDelete: _galleryUrlsToDelete,
        );

    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    // This build method remains the same as the previous correct version
    AsyncValue<List<SubCategory>>? subCategoryOptionsAsync;
    final isEditing = widget.initialShop != null;
    final controllerState = ref.watch(shopControllerProvider);

    if (_selectedCategory != null) {
      subCategoryOptionsAsync = ref.watch(
        subCategoriesListFutureProvider(_selectedCategory!.id),
      );
    }

    final currentGalleryUrls = isEditing
        ? widget.initialShop!.galleryImageUrls
              .where((url) => !_galleryUrlsToDelete.contains(url))
              .toList()
        : <String>[];

    ref.listen(shopControllerProvider, (prev, next) {
      next.whenOrNull(
        error: (err, _) => ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to save shop: $err'))),
        data: (_) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Shop saved successfully')),
        ),
      );
    });

    return Form(
      key: _formKey,
      child: ResponsiveScrollable(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p16,
          vertical: Sizes.p8,
        ),
        child: Column(
          spacing: Sizes.p12,
          children: [
            CategorySection(
              allCategories: widget.allCategories,
              subCategoryOptions:
                  subCategoryOptionsAsync?.valueOrNull ??
                  widget.initialSubCategories,
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
              coverImageUrl: widget.initialShop?.coverImageUrl,
              galleryImageUrls: currentGalleryUrls,
              openingHours: _openingHours,
              onLocationPicked: (latLng) =>
                  setState(() => _pickedLatLng = latLng),
              onCoverImagePicked: (bytes) =>
                  setState(() => _coverImageBytes = bytes),
              onGalleryImagesPicked: (bytesList) =>
                  setState(() => _galleryImageBytes = bytesList),
              onOpeningHoursChanged: (hours) =>
                  setState(() => _openingHours = hours),
              onExistingGalleryImageDeleted: (imageUrl) {
                setState(() {
                  _galleryUrlsToDelete.add(imageUrl);
                });
              },
            ),
            if (_selectedCategory?.id == 1)
              ResidenceSpecificSection(
                priceController: _priceController,
                isFurnished: _isFurnished,
                genderPref: _genderPref,
                onFurnishedChanged: (val) => setState(() => _isFurnished = val),
              ),
            if (_selectedCategory?.id == 1 || _selectedCategory?.id == 2)
              DropdownButtonFormField<GenderPreference>(
                value: _genderPref,
                decoration: InputDecoration(
                  labelText: 'Gender Preference'.hardcoded,
                ),
                items: GenderPreference.values
                    .map(
                      (gp) => DropdownMenuItem(value: gp, child: Text(gp.name)),
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
    );
  }
}
