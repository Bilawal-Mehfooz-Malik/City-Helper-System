// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FindOut';

  @override
  String get startupHeadline => 'Discover Amazing Places';

  @override
  String get startupDescription => 'Easily find any place in Mirpur, any time and anywhere, using your smartphone.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get getLocDescription => 'Click on either \"Get Current\" button to get your current location or \"From Map\" button and pick your location using map in order to continue.';

  @override
  String get getCurrent => 'Get Current';

  @override
  String get fromMap => 'From Map';

  @override
  String get permissionDenied => 'Permission Denied';

  @override
  String get permissionDeniedHeadline => 'To use this app, you need to allow \"Location permission\". If you choose not to, you can exit the app. Click Allow Permission to \"continue\" or \"Exit\" to close the app.';

  @override
  String get allowPermission => 'Allow Permission';

  @override
  String get exit => 'Exit';

  @override
  String get noLocationSelected => 'No location selected';

  @override
  String get saveLocation => 'Save Location';

  @override
  String get searchLocation => 'Search Location';

  @override
  String get enterCityName => 'Enter City Name';

  @override
  String get noResultFound => 'No Result Found';

  @override
  String get error => 'Error';
}
