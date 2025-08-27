import 'package:app/src/core/constants/default_opening_hours.dart';
import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:app/src/features/my_shop/domain/shop_form.dart';

extension ShopFormX on ShopForm {
  EntityDetail toEntityDetail(EntityDetail? existingShop) {
    final now = DateTime.now();

    if (existingShop != null) {
      if (existingShop is ResidenceDetail) {
        return existingShop.copyWith(
          subCategoryId: subCategory?.id ?? -1,
          name: name,
          description: description,
          phoneNumber: phoneNumber,
          messagingNumber: messagingNumber,
          cityName: cityName,
          sectorName: sectorName,
          streetAddress: streetAddress,
          email: email,
          facebookUrl: facebookUrl,
          instagramUrl: instagramUrl,
          websiteUrl: websiteUrl,
          latLng: latLng!,
          openingHours: openingHours,
          genderPref: genderPref,
          pricing: pricing ?? existingShop.pricing,
          isFurnished: isFurnished,
        );
      } else if (existingShop is FoodDetail) {
        return existingShop.copyWith(
          subCategoryId: subCategory?.id ?? -1,
          name: name,
          description: description,
          phoneNumber: phoneNumber,
          messagingNumber: messagingNumber,
          cityName: cityName,
          sectorName: sectorName,
          streetAddress: streetAddress,
          email: email,
          facebookUrl: facebookUrl,
          instagramUrl: instagramUrl,
          websiteUrl: websiteUrl,
          latLng: latLng!,
          openingHours: openingHours ?? defaultOpeningHours,
          genderPref: genderPref,
        );
      }
      return existingShop;
    } else {
      if (category!.id == 1) {
        return ResidenceDetail(
          id: '',
          ownerId: '',
          categoryId: category!.id,
          subCategoryId: subCategory?.id ?? -1,
          coverImageUrl: '',
          galleryImageUrls: [],
          latLng: latLng!,
          name: name,
          description: description,
          cityName: cityName,
          sectorName: sectorName,
          streetAddress: streetAddress,
          avgRating: 0,
          totalReviews: 0,
          ratingBreakdown: const [],
          isPopular: false,
          status: ApprovalStatus.pending,
          entityStatus: OperationalStatus.defaultStatus,
          openingHours: openingHours,
          updatedAt: now,
          createdAt: now,
          phoneNumber: phoneNumber,
          messagingNumber: messagingNumber,
          email: email,
          facebookUrl: facebookUrl,
          instagramUrl: instagramUrl,
          websiteUrl: websiteUrl,
          genderPref: genderPref,
          pricing: pricing ?? 0,
          isFurnished: isFurnished,
        );
      } else {
        return FoodDetail(
          id: '',
          ownerId: '',
          categoryId: category!.id,
          subCategoryId: subCategory?.id ?? -1,
          coverImageUrl: '',
          galleryImageUrls: [],
          menuImageUrls: [],
          latLng: latLng!,
          name: name,
          description: description,
          cityName: cityName,
          sectorName: sectorName,
          streetAddress: streetAddress,
          avgRating: 0,
          totalReviews: 0,
          ratingBreakdown: const [],
          isPopular: false,
          status: ApprovalStatus.pending,
          entityStatus: OperationalStatus.defaultStatus,
          openingHours: openingHours ?? defaultOpeningHours,
          updatedAt: now,
          createdAt: now,
          phoneNumber: phoneNumber,
          messagingNumber: messagingNumber,
          email: email,
          facebookUrl: facebookUrl,
          instagramUrl: instagramUrl,
          websiteUrl: websiteUrl,
          genderPref: genderPref,
        );
      }
    }
  }
}
