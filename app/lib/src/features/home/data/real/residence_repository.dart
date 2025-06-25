import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/categories/residence.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'residence_repository.g.dart';

class ResidenceRepository {
  ResidenceRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get residencesKey => 'residence_listings';

  CollectionReference<Residence> get _residencesRef => _firestore
      .collection(residencesKey)
      .withConverter<Residence>(
        fromFirestore: (snapshot, _) =>
            Residence.fromJson(Map<String, Object>.from(snapshot.data()!)),
        toFirestore: (residence, _) => residence.toJson(),
      );

  Future<void> setResidence(Residence residence) async {
    await _residencesRef.doc(residence.id).set(residence);
  }

  Stream<List<Residence>> watchResidencesList() {
    return _residencesRef.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }

  Future<List<Residence>> fetchResidencesList() async {
    final snapshot = await _residencesRef.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Stream<List<Residence>> watchPopularResidencesList() {
    return _residencesRef
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<List<Residence>> fetchPopularResidencesList() async {
    final snapshot = await _residencesRef
        .where('isPopular', isEqualTo: true)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Stream<List<Residence>> watchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) {
    return _residencesRef
        .where('subCategoryId', isEqualTo: subCategoryId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<List<Residence>> fetchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    final snapshot = await _residencesRef
        .where('subCategoryId', isEqualTo: subCategoryId)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Stream<List<Residence>> watchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) {
    return _residencesRef
        .where('subCategoryId', isEqualTo: subCategoryId)
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<List<Residence>> fetchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    final snapshot = await _residencesRef
        .where('subCategoryId', isEqualTo: subCategoryId)
        .where('isPopular', isEqualTo: true)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Stream<Residence?> watchResidence(EntityId id) {
    return _residencesRef
        .doc(id)
        .snapshots()
        .map((snapshot) => snapshot.exists ? snapshot.data() : null);
  }

  Future<Residence?> fetchResidence(EntityId id) async {
    final snapshot = await _residencesRef.doc(id).get();
    return snapshot.exists ? snapshot.data() : null;
  }
}

@Riverpod(keepAlive: true)
ResidenceRepository residenceRepository(Ref ref) {
  return ResidenceRepository(FirebaseFirestore.instance);
}
