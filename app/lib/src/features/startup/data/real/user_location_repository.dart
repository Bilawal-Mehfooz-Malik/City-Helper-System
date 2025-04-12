import 'package:app/src/core/utils/delay.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

part 'user_location_repository.g.dart';

class UserLocationRepository {
  UserLocationRepository(this._db, {int timeOut = 30}) : _timeOut = timeOut;

  final int _timeOut;
  final Database _db;
  final _store = StoreRef.main();

  static const String userLocationKey = 'userLocation';

  // Database creation logic (Web vs Mobile)
  static Future<Database> _createDatabase(String filename) async {
    if (kIsWeb) {
      return databaseFactoryWeb.openDatabase(filename);
    } else {
      final appDocDir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
    }
  }

  static Future<UserLocationRepository> makeDefault() async {
    final db = await _createDatabase('default.db');
    return UserLocationRepository(db);
  }

  Future<void> setUserLocation(LatLng latLng) async {
    await checkTimeOut(_timeOut, () async {
      await _store.record(userLocationKey).put(_db, latLng.toJson());
    });
  }

  Future<LatLng?> fetchUserLocation() async {
    return checkTimeOut(_timeOut, () async {
      final json = await _store.record(userLocationKey).get(_db);
      return json != null ? LatLng.fromJson(json) : null;
    });
  }

  Stream<LatLng?> watchUserLocation() {
    final record = _store.record(userLocationKey);
    return record.onSnapshot(_db).map((snapshot) {
      final json = snapshot?.value;
      return json != null ? LatLng.fromJson(json) : null;
    });
  }
}

@Riverpod(keepAlive: true)
UserLocationRepository userLocationRepository(Ref ref) {
  throw UnimplementedError();
}

@Riverpod(keepAlive: true)
Stream<LatLng?> watchUserLocation(Ref ref) {
  final locationRepo = ref.watch(userLocationRepositoryProvider);
  return locationRepo.watchUserLocation();
}
