import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTypeController extends Notifier<MapType> {
  @override
  MapType build() => .normal;

  set type(MapType type) => state = type;
}

final mapTypeControllerProvider = NotifierProvider<MapTypeController, MapType>(
  MapTypeController.new,
);
