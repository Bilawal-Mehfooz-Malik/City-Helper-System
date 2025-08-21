import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/entity.dart';

extension EntityExtensions on Entity {

  bool matchGenderPref(GenderPreference preference) {
    if (preference == GenderPreference.any) return true;
    if (this is Residence) {
      final residence = this as Residence;
      if (residence.listingType == ListingType.forSale) {
        return false; // Not applicable for properties for sale
      }
      // If genderPref is null, it means no preference is set, so it matches 'any'.
      // Otherwise, it must match the exact preference.
      return residence.genderPref == GenderPreference.any ||
          residence.genderPref == preference;
    } else if (this is Food) {
      final food = this as Food;
      return food.genderPref == preference;
    }
    return false; // Should not happen
  }

  bool checkFurnished(bool furnished) {
    if (this is Residence) {
      final residence = this as Residence;
      if (residence.listingType == ListingType.forSale) {
        return false; // Not applicable for properties for sale
      }
      return residence.isFurnished == furnished;
    } else if (this is Food) {
      // Not applicable for food, always return true as per original logic
      return true;
    }
    return false; // Should not happen
  }
}
