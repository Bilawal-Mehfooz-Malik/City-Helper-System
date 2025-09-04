import 'package:app/src/localization/string_hardcoded.dart';

class ShopFormValidator {
  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Name cannot be empty'.hardcoded;
    }
    return null;
  }

  static String? validateCity(String? city) {
    if (city == null || city.isEmpty) {
      return 'City cannot be empty'.hardcoded;
    }
    return null;
  }

  static String? validateSector(String? sector) {
    if (sector == null || sector.isEmpty) {
      return 'Sector cannot be empty'.hardcoded;
    }
    return null;
  }

  static String? validateStreetAddress(String? streetAddress) {
    if (streetAddress == null || streetAddress.isEmpty) {
      return 'Street Address cannot be empty'.hardcoded;
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone Number cannot be empty'.hardcoded;
    }
    // Add more sophisticated phone number validation if needed
    return null;
  }

  static String? validateMessagingNumber(String? messagingNumber) {
    // Messaging number is optional, so no validation if empty
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return null; // Email is optional
    }
    // Basic email format validation
    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return 'Enter a valid email'.hardcoded;
    }
    return null;
  }
}
