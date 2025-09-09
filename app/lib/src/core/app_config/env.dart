import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
final class Env {
  @EnviedField(varName: 'GOOGLE_MAPS_KEY', obfuscate: true)
  static final String googleMapsKey = _Env.googleMapsKey;
  @EnviedField(varName: 'ALGOLIA_APP_ID', obfuscate: true)
  static final String algoliaAppId = _Env.algoliaAppId;
  @EnviedField(varName: 'ALGOLIA_SEARCH_KEY', obfuscate: true)
  static final String algoliaSearchKey = _Env.algoliaSearchKey;
  @EnviedField(varName: 'RECAPTCHA_V3_SITE_KEY', obfuscate: true)
  static final String recaptchaV3SiteKey = _Env.recaptchaV3SiteKey;
}
