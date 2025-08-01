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

  /// The base collection reference without any filters.
  /// Used for fetching single documents by ID or for writing data.
  CollectionReference<Residence> get _residencesRef => _firestore
      .collection(residencesKey)
      .withConverter<Residence>(
        fromFirestore: (snapshot, _) =>
            Residence.fromJson(Map<String, dynamic>.from(snapshot.data()!)),
        toFirestore: (residence, _) => residence.toJson(),
      );

  // THIS IS THE KEY CHANGE:
  /// A pre-filtered query that only includes documents with an "approved" status.
  /// Used for all public-facing list views.
  Query<Residence> get _approvedResidencesQuery => _residencesRef.where(
    'status',
    isEqualTo: Status.approved.name, // Using enum for type-safety
  );

  /// Writes a residence document. Uses the unfiltered ref to allow setting
  /// documents with any status (e.g., 'pending').
  Future<void> setResidence(Residence residence) async {
    await _residencesRef.doc(residence.id).set(residence);
  }

  /// Watches a list of all approved residences.
  Stream<List<Residence>> watchResidencesList() {
    // Uses the new filtered query
    return _approvedResidencesQuery.snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
    );
  }

  /// Fetches a list of all approved residences.
  Future<List<Residence>> fetchResidencesList() async {
    // Uses the new filtered query
    final snapshot = await _approvedResidencesQuery.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Watches a list of popular, approved residences.
  Stream<List<Residence>> watchPopularResidencesList() {
    // Chains another .where() onto the new filtered query
    return _approvedResidencesQuery
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  /// Fetches a list of popular, approved residences.
  Future<List<Residence>> fetchPopularResidencesList() async {
    // Chains another .where() onto the new filtered query
    final snapshot = await _approvedResidencesQuery
        .where('isPopular', isEqualTo: true)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Watches a list of approved residences by sub-category.
  Stream<List<Residence>> watchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) {
    return _approvedResidencesQuery
        .where('subCategoryId', isEqualTo: subCategoryId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  /// Fetches a list of approved residences by sub-category.
  Future<List<Residence>> fetchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    final snapshot = await _approvedResidencesQuery
        .where('subCategoryId', isEqualTo: subCategoryId)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // ... (Apply the same change to other list-fetching methods) ...
  Stream<List<Residence>> watchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) {
    return _approvedResidencesQuery
        .where('subCategoryId', isEqualTo: subCategoryId)
        .where('isPopular', isEqualTo: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<List<Residence>> fetchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId,
  ) async {
    final snapshot = await _approvedResidencesQuery
        .where('subCategoryId', isEqualTo: subCategoryId)
        .where('isPopular', isEqualTo: true)
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  /// Watches a single residence by its ID, regardless of its status.
  Stream<Residence?> watchResidence(EntityId id) {
    // Uses the original, unfiltered ref
    return _residencesRef
        .doc(id)
        .snapshots()
        .map((snapshot) => snapshot.exists ? snapshot.data() : null);
  }

  /// Fetches a single residence by its ID, regardless of its status.
  Future<Residence?> fetchResidence(EntityId id) async {
    // Uses the original, unfiltered ref
    final snapshot = await _residencesRef.doc(id).get();
    return snapshot.exists ? snapshot.data() : null;
  }
}

@Riverpod(keepAlive: true)
ResidenceRepository residenceRepository(Ref ref) {
  return ResidenceRepository(FirebaseFirestore.instance);
}
