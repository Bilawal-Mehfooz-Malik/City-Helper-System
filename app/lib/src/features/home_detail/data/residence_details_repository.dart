import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/residence_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'residence_details_repository.g.dart';

class ResidenceDetailsRepository {
  ResidenceDetailsRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get residenceKey => 'residence_listings';

  DocumentReference<Map<String, dynamic>> _docRef(EntityId id) {
    return _firestore.collection(residenceKey).doc(id);
  }

  /// ✅ Save or update a ResidenceDetail
  Future<void> setResidenceDetail(ResidenceDetail updated) async {
    await _docRef(updated.id).set(updated.toJson());
  }

  /// ✅ Real-time updates
  Stream<ResidenceDetail?> watchResidenceDetails(EntityId id) {
    return _docRef(id).snapshots().map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return ResidenceDetail.fromJson(snapshot.data()!);
      }
      return null;
    });
  }

  /// ✅ One-time fetch
  Future<ResidenceDetail?> fetchResidenceDetails(EntityId id) async {
    final doc = await _docRef(id).get();
    if (doc.exists && doc.data() != null) {
      return ResidenceDetail.fromJson(doc.data()!);
    }
    return null;
  }
}

@Riverpod(keepAlive: true)
ResidenceDetailsRepository residenceDetailsRepository(Ref ref) {
  return ResidenceDetailsRepository(FirebaseFirestore.instance);
}
