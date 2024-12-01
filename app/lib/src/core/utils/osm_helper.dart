import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'osm_helper.g.dart';

@riverpod
String osmTileUrl(Ref ref) {
  final url = dotenv.env['OSM_TILE_URL'] ??
      'https://tile.openstreetmap.org/{z}/{x}/{y}.png';
  return url;
}

@riverpod
String userAgentPackageName(Ref ref) {
  final name = dotenv.env['USER_AGENT_PACKAGE_NAME'] ?? 'com.example.app';
  return name;
}
