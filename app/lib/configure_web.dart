import 'package:web/web.dart' as web;
import 'package:app/env.dart';

void configureGoogleMapsWeb() {
  final apiKey = Env.googleMapsKey;
  final element = web.document.createElement("script") as web.HTMLScriptElement;
  element.src =
      "https://maps.googleapis.com/maps/api/js?key=$apiKey&loading=async";
  element.async = true;
  web.document.head?.append(element);
}
