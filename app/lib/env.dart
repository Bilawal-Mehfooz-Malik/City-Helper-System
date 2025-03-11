import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
final class Env {
  @EnviedField(varName: 'GOOGLE_MAPS_KEY', obfuscate: true)
  static final String googleMapsKey = _Env.googleMapsKey;
}
