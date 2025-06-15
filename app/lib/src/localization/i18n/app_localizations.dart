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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

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

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong!'**
  String get somethingWentWrong;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

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
  /// **'Open'**
  String get open;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @somethingWentWrongTryAgain.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again'**
  String get somethingWentWrongTryAgain;

  /// No description provided for @contactOptions.
  ///
  /// In en, this message translates to:
  /// **'Contact Options'**
  String get contactOptions;

  /// No description provided for @locateONMap.
  ///
  /// In en, this message translates to:
  /// **'Locate on Map'**
  String get locateONMap;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @furnished.
  ///
  /// In en, this message translates to:
  /// **'Furnished'**
  String get furnished;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get call;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get facebook;

  /// No description provided for @instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get instagram;

  /// No description provided for @website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get website;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @opensAt.
  ///
  /// In en, this message translates to:
  /// **'Opens at'**
  String get opensAt;

  /// No description provided for @closed.
  ///
  /// In en, this message translates to:
  /// **'Closed'**
  String get closed;

  /// No description provided for @closes.
  ///
  /// In en, this message translates to:
  /// **'Closes'**
  String get closes;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @seeLess.
  ///
  /// In en, this message translates to:
  /// **'See less'**
  String get seeLess;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// No description provided for @ratingAndReviews.
  ///
  /// In en, this message translates to:
  /// **'Rating & Reviews'**
  String get ratingAndReviews;

  /// No description provided for @latest.
  ///
  /// In en, this message translates to:
  /// **'Latest'**
  String get latest;

  /// No description provided for @oldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get oldest;

  /// No description provided for @highest_rating.
  ///
  /// In en, this message translates to:
  /// **'Highest Rating'**
  String get highest_rating;

  /// No description provided for @lowest_rating.
  ///
  /// In en, this message translates to:
  /// **'Lowest Rating'**
  String get lowest_rating;

  /// No description provided for @no_reviews_found.
  ///
  /// In en, this message translates to:
  /// **'No reviews found for this rating'**
  String get no_reviews_found;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @writeAReview.
  ///
  /// In en, this message translates to:
  /// **'Write a review'**
  String get writeAReview;

  /// No description provided for @loginRequired.
  ///
  /// In en, this message translates to:
  /// **'Login Required'**
  String get loginRequired;

  /// No description provided for @loginRequiredContent.
  ///
  /// In en, this message translates to:
  /// **'You need to be logged in to write a review.'**
  String get loginRequiredContent;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get logIn;

  /// No description provided for @reviewedBeforeContent.
  ///
  /// In en, this message translates to:
  /// **'You reviewed this before. Submit again to edit.'**
  String get reviewedBeforeContent;

  /// No description provided for @yourReview.
  ///
  /// In en, this message translates to:
  /// **'Your review (optional)'**
  String get yourReview;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @leaveAREview.
  ///
  /// In en, this message translates to:
  /// **'Leave a Review'**
  String get leaveAREview;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
