import 'package:web/web.dart' as web;
import 'package:app/src/core/app_config/env.dart';

void configureGoogleMapsWeb() {
  const scriptId = 'google-maps-script';

  // Prevent duplicate script injection
  final existingScript = web.document.getElementById(scriptId);
  if (existingScript != null) return;

  final apiKey = Env.googleMapsKey;

  final script =
      web.document.createElement("script") as web.HTMLScriptElement
        ..id = scriptId
        ..src =
            "https://maps.googleapis.com/maps/api/js?key=$apiKey&loading=async"
        ..async = true;

  web.document.head?.append(script);
}
