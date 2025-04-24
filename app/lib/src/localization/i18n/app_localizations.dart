import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'FindOut'**
  String get appTitle;

  /// No description provided for @startupHeadline.
  ///
  /// In en, this message translates to:
  /// **'Discover Amazing Places'**
  String get startupHeadline;

  /// No description provided for @startupDescription.
  ///
  /// In en, this message translates to:
  /// **'Explore your city with ease, everything you need, right from your phone.'**
  String get startupDescription;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @getLocDescription.
  ///
  /// In en, this message translates to:
  /// **'Click \"Get Current\" to get your location or \"From Map\" to select it manually.'**
  String get getLocDescription;

  /// No description provided for @getCurrent.
  ///
  /// In en, this message translates to:
  /// **'Get Current'**
  String get getCurrent;

  /// No description provided for @fromMap.
  ///
  /// In en, this message translates to:
  /// **'From Map'**
  String get fromMap;

  /// No description provided for @permissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Permission Denied'**
  String get permissionDenied;

  /// No description provided for @allowPermission.
  ///
  /// In en, this message translates to:
  /// **'Allow Permission'**
  String get allowPermission;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @noLocationSelected.
  ///
  /// In en, this message translates to:
  /// **'No location selected'**
  String get noLocationSelected;

  /// No description provided for @saveLocation.
  ///
  /// In en, this message translates to:
  /// **'Save Location'**
  String get saveLocation;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @pickYourLocation.
  ///
  /// In en, this message translates to:
  /// **'Pick your location'**
  String get pickYourLocation;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @selectCategoryBody.
  ///
  /// In en, this message translates to:
  /// **'Select a category'**
  String get selectCategoryBody;

  /// No description provided for @popular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @startsFrom.
  ///
  /// In en, this message translates to:
  /// **'Starts from'**
  String get startsFrom;

  /// No description provided for @sector.
  ///
  /// In en, this message translates to:
  /// **'Sector'**
  String get sector;

  /// No description provided for @sortOrderNone.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get sortOrderNone;

  /// No description provided for @sortOrderLowToHigh.
  ///
  /// In en, this message translates to:
  /// **'Low to High'**
  String get sortOrderLowToHigh;

  /// No description provided for @sortOrderHighToLow.
  ///
  /// In en, this message translates to:
  /// **'High to Low'**
  String get sortOrderHighToLow;

  /// No description provided for @highestRatedFirst.
  ///
  /// In en, this message translates to:
  /// **'High rated first'**
  String get highestRatedFirst;

  /// No description provided for @lowestRatedFirst.
  ///
  /// In en, this message translates to:
  /// **'Low rated first'**
  String get lowestRatedFirst;

  /// No description provided for @genderPreferenceAny.
  ///
  /// In en, this message translates to:
  /// **'Any'**
  String get genderPreferenceAny;

  /// No description provided for @genderPreferenceMaleOnly.
  ///
  /// In en, this message translates to:
  /// **'Male Only'**
  String get genderPreferenceMaleOnly;

  /// No description provided for @genderPreferenceFemaleOnly.
  ///
  /// In en, this message translates to:
  /// **'Female Only'**
  String get genderPreferenceFemaleOnly;

  /// No description provided for @genderPreferenceFamilyFriendly.
  ///
  /// In en, this message translates to:
  /// **'Family Friendly'**
  String get genderPreferenceFamilyFriendly;

  /// No description provided for @filtersTitle.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filtersTitle;

  /// No description provided for @sortByPrice.
  ///
  /// In en, this message translates to:
  /// **'Sort by Price'**
  String get sortByPrice;

  /// No description provided for @sortByRating.
  ///
  /// In en, this message translates to:
  /// **'Sort by Rating'**
  String get sortByRating;

  /// No description provided for @showOpenOnly.
  ///
  /// In en, this message translates to:
  /// **'Show open only'**
  String get showOpenOnly;

  /// No description provided for @showFurnishedOnly.
  ///
  /// In en, this message translates to:
  /// **'Show furnished only'**
  String get showFurnishedOnly;

  /// No description provided for @genderPreferenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Gender Preference'**
  String get genderPreferenceLabel;

  /// No description provided for @resetButton.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetButton;

  /// No description provided for @applyFiltersButton.
  ///
  /// In en, this message translates to:
  /// **'Apply Filters'**
  String get applyFiltersButton;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'open'**
  String get open;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'close'**
  String get close;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
