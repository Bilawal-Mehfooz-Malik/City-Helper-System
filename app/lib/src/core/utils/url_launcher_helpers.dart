import 'package:app/src/core/common_widgets/alert_dialogs.dart';
import 'package:app/src/core/exceptions/app_logger.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

Future<void> launchGoogleMaps(LatLng latLng, BuildContext context) async {
  final uri = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=${latLng.latitude},${latLng.longitude}',
  );
  await _tryLaunch(uri, context, 'Google Maps');
}

Future<void> launchPhone(String phoneNumber, BuildContext context) async {
  final uri = Uri(scheme: 'tel', path: phoneNumber);
  await _tryLaunch(uri, context, 'Phone call');
}

Future<void> launchSms(String phoneNumber, BuildContext context) async {
  final uri = Uri(scheme: 'sms', path: phoneNumber);
  await _tryLaunch(uri, context, 'SMS');
}

Future<void> launchEmail(String emailAddress, BuildContext context) async {
  final uri = Uri(scheme: 'mailto', path: emailAddress);
  await _tryLaunch(uri, context, 'Email');
}

Future<void> launchInstagram(String username, BuildContext context) async {
  final uri = Uri.parse('https://instagram.com/$username');
  await _tryLaunch(uri, context, 'Instagram');
}

Future<void> launchFacebook(String profileId, BuildContext context) async {
  final uri = Uri.parse('https://facebook.com/$profileId');
  await _tryLaunch(uri, context, 'Facebook');
}

Future<void> launchWebUrl(String url, BuildContext context) async {
  final uri = Uri.parse(url);
  await _tryLaunch(uri, context, 'Web');
}

// Helper
Future<void> _tryLaunch(Uri uri, BuildContext context, String label) async {
  try {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Launch failed';
    }
  } catch (e, st) {
    if (context.mounted) {
      showAlertDialog(
        context: context,
        title: 'Error',
        content: 'Could not open $label',
      );
    }
    AppLogger.logError(
      error: e,
      stackTrace: st,
      'Could not launch $label with URI: $uri',
    );
  }
}
