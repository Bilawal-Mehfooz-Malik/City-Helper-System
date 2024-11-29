// import 'package:flutter/foundation.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sembast/sembast_io.dart';
// import 'package:sembast_web/sembast_web.dart';

// import '../domain/app_user.dart';
// import '../domain/user_repository.dart';

// class SembastUserRepository implements UserRepository {
//   SembastUserRepository(this.db);

//   final Database db;
//   final store = StoreRef.main();

//   static Future<Database> createDatabase(String filename) async {
//     if (!kIsWeb) {
//       final appDocDir = await getApplicationDocumentsDirectory();
//       return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
//     } else {
//       return databaseFactoryWeb.openDatabase(filename);
//     }
//   }

//   static Future<UserRepository> makeDefault() async {
//     return SembastUserRepository(await createDatabase('default.db'));
//   }

//   static const userLocationKey = 'userLocation';

//   @override
//   Future<AppUser?> fetchUser() async {
//     final json = await store.record(userLocationKey).get(db) as String?;
//     if (json != null) {
//       return AppUser.fromJson(json);
//     } else {
//       return null;
//     }
//   }

//   @override
//   Future<void> setUser(AppUser user) async {
//     await store.record(userLocationKey).put(db, user.toJson());
//   }

//   @override
//   Stream<AppUser?> watchUser() {
//     final record = store.record(userLocationKey);
//     return record.onSnapshot(db).map((snapshot) {
//       return snapshot != null
//           ? AppUser.fromJson(snapshot.value as String)
//           : null;
//     });
//   }
// }
