import 'package:app/src/core/utils/delay.dart';
import 'package:app/src/features/startup/domain/user_location.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

part 'user_location_repository.g.dart';

class UserLocationRepository {
  UserLocationRepository(this.db, {this.timeOut = 15});

  final int timeOut;
  final Database db;
  final store = StoreRef.main();

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

  Future<UserLocation?> fetchUserLocation() async {
    return checkTimeOut(timeOut, () async {
      final json = await store.record(userLocationKey).get(db) as String?;
      if (json != null) {
        return UserLocation.fromJson(json);
      } else {
        return null;
      }
    });
  }

  Future<void> setUserLocation(UserLocation location) async {
    await checkTimeOut(timeOut, () async {
      final json = location.toJson();
      await store.record(userLocationKey).put(db, json);
    });
  }

  Stream<UserLocation?> watchUserLocation() {
    final record = store.record(userLocationKey);
    return record.onSnapshot(db).map((snapshot) {
      if (snapshot != null && snapshot.value != null) {
        return UserLocation.fromJson(snapshot.value as String);
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
Stream<UserLocation?> watchUserLocation(Ref ref) {
  final authRepository = ref.watch(userLocationRepositoryProvider);
  return authRepository.watchUserLocation();
}
