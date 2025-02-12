import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
final class Env {
  @EnviedField(varName: 'GOOGLE_MAPS_KEY', obfuscate: true)
  static final String googleMapsKey = _Env.googleMapsKey;

  @EnviedField(varName: 'SUPABASE_API_URL', obfuscate: true)
  static final String supabaseApiUrl = _Env.supabaseApiUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY', obfuscate: true)
  static final String supabaseAnonKey = _Env.supabaseAnonKey;
  @EnviedField(varName: 'SUPABASE_LOCAL_API_URL', obfuscate: true)
  static final String supabaseLocalApiUrl = _Env.supabaseApiUrl;

  @EnviedField(varName: 'SUPABASE_LOCAL_ANON_KEY', obfuscate: true)
  static final String supabaseLocalAnonKey = _Env.supabaseAnonKey;
}
