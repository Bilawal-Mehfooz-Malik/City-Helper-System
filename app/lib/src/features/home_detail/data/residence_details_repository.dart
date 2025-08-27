import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home_detail/domain/entity_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'residence_details_repository.g.dart';

class ResidenceDetailsRepository {
  ResidenceDetailsRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get residenceKey => 'residence_listings';

  DocumentReference getNewResidenceDocRef() {
    return _firestore.collection(residenceKey).doc();
  }

  Future<void> updateResidenceStatus(
    EntityId id,
    OperationalStatus status,
  ) async {
    await _docRef(id).update({'entityStatus': status.name});
  }

  /// ✅ Save or update a ResidenceDetail
  Future<void> setResidenceDetail(ResidenceDetail updated) async {
    await _docRef(updated.id).set(updated.toJson());
  }

  /// ✅ Real-time updates
  Stream<ResidenceDetail?> watchResidenceDetailsByOwnerId(UserId id) {
    return _docRefByOwnerId(id).snapshots().map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        return ResidenceDetail.fromJson(snapshot.docs.first.data());
      }
      return null;
    });
  }

  /// ✅ One-time fetch
  Future<ResidenceDetail?> fetchResidenceDetailsByOwnerId(UserId id) async {
    final residenceSnap = await _docRefByOwnerId(id).get();

    if (residenceSnap.docs.isNotEmpty) {
      return ResidenceDetail.fromJson(residenceSnap.docs.first.data());
    }
    return null;
  }

  /// ✅ One-time fetch
  Future<ResidenceDetail?> fetchResidenceDetails(EntityId id) async {
    final doc = await _docRef(id).get();
    if (doc.exists && doc.data() != null) {
      return ResidenceDetail.fromJson(doc.data()!);
    }
    return null;
  }

  // Helpers
  DocumentReference<Map<String, dynamic>> _docRef(EntityId id) {
    return _firestore.collection(residenceKey).doc(id);
  }

  Query<Map<String, dynamic>> _docRefByOwnerId(UserId id) {
    return _firestore
        .collection(residenceKey)
        .where('ownerId', isEqualTo: id)
        .limit(1);
  }
}

@Riverpod(keepAlive: true)
ResidenceDetailsRepository residenceDetailsRepository(Ref ref) {
  return ResidenceDetailsRepository(FirebaseFirestore.instance);
}
