import 'dart:convert';

import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/features/startup/domain/geolocation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  static Future<Database> _createDatabase(String filename) async {
    if (!kIsWeb) {
      final appDocDir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
    } else {
      return databaseFactoryWeb.openDatabase(filename);
    }
  }

  static Future<UserLocationRepository> makeDefault() async {
    return UserLocationRepository(await _createDatabase('default.db'));
  }

  static const userLocationKey = 'userLocation';

  Future<void> setUserLocation(GeoLocation location) async {
    await checkTimeOut(_timeOut, () async {
      final json = jsonEncode(location.toJson());
      await _store.record(userLocationKey).put(_db, json);
    });
  }

  Future<GeoLocation?> fetchUserLocation() {
    return checkTimeOut(_timeOut, () async {
      final json = await _store.record(userLocationKey).get(_db) as String?;
      if (json != null) {
        final map = jsonDecode(json) as Map<String, dynamic>;
        return GeoLocation.fromJson(map);
      } else {
        return null;
      }
    });
  }

  Stream<GeoLocation?> watchUserLocation() {
    final record = _store.record(userLocationKey);
    return record.onSnapshot(_db).map((snapshot) {
      if (snapshot != null && snapshot.value != null) {
        final map =
            jsonDecode(snapshot.value as String) as Map<String, dynamic>;
        return GeoLocation.fromJson(map);
      }
      return null;
    });
  }
}

@Riverpod(keepAlive: true)
UserLocationRepository userLocationRepository(Ref ref) {
  throw UnimplementedError;
}

@Riverpod(keepAlive: true)
Stream<GeoLocation?> watchUserLocation(Ref ref) {
  final authRepository = ref.watch(userLocationRepositoryProvider);
  return authRepository.watchUserLocation();
}
