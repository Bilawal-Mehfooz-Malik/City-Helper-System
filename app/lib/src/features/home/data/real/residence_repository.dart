import 'package:app/src/core/models/my_data_types.dart';
import 'package:app/src/features/home/domain/entity.dart';
import 'package:app/src/features/home/domain/entity_filter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'residence_repository.g.dart';

class ResidenceRepository {
  ResidenceRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String get residencesKey => 'residence_listings';

  Future<void> setResidence(Residence residence) async {
    await _residencesRef.doc(residence.id).set(residence);
  }

  Future<List<Residence>> fetchResidencesList({
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    var query = _approvedResidencesQuery.where('isPopular', isEqualTo: false);
    query = _buildFilteredQuery(query, filter);

    query = query.limit(limit);

    if (lastEntityId != null) {
      final lastDoc = await _residencesRef.doc(lastEntityId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }
    final snapshot = await query.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Residence>> fetchResidencesListBySubCategoryId(
    SubCategoryId subCategoryId, {
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    var query = _approvedResidencesQuery
        .where('subCategoryId', isEqualTo: subCategoryId)
        .where('isPopular', isEqualTo: false);

    query = _buildFilteredQuery(query, filter);

    query = query.limit(limit);

    if (lastEntityId != null) {
      final lastDoc = await _residencesRef.doc(lastEntityId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }
    final snapshot = await query.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Residence>> fetchPopularResidencesList({
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    var query = _approvedResidencesQuery.where('isPopular', isEqualTo: true);

    query = _buildFilteredQuery(query, filter);

    query = query.limit(limit);

    if (lastEntityId != null) {
      final lastDoc = await _residencesRef.doc(lastEntityId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }
    final snapshot = await query.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Residence>> fetchPopularResidencesListBySubCategoryId(
    SubCategoryId subCategoryId, {
    required int limit,
    required ResidenceFilter filter,
    String? lastEntityId,
  }) async {
    var query = _approvedResidencesQuery
        .where('subCategoryId', isEqualTo: subCategoryId)
        .where('isPopular', isEqualTo: true);

    query = _buildFilteredQuery(query, filter);

    query = query.limit(limit);

    if (lastEntityId != null) {
      final lastDoc = await _residencesRef.doc(lastEntityId).get();
      if (lastDoc.exists) {
        query = query.startAfterDocument(lastDoc);
      }
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }


  /// Watches a single residence by its ID
  Stream<Residence?> watchResidence(EntityId id) {
    return _residencesRef
        .doc(id)
        .snapshots()
        .map((snapshot) => snapshot.exists ? snapshot.data() : null);
  }

  /// Fetches a single residence by its ID
  Future<Residence?> fetchResidence(EntityId id) async {
    // Uses the original, unfiltered ref
    final snapshot = await _residencesRef.doc(id).get();
    return snapshot.exists ? snapshot.data() : null;
  }

  // --------------------Helpers--------------------------

  Query<Residence> _buildFilteredQuery(
      Query<Residence> query, ResidenceFilter filter) {
    var newQuery = query;

    if (filter.getIsOpen) {
      newQuery = newQuery.where('isOpen', isEqualTo: true);
    }
    if (filter.isFurnished) {
      newQuery = newQuery.where('isFurnished', isEqualTo: true);
    }
    if (filter.genderPref != GenderPreference.any) {
      newQuery = newQuery.where('genderPref', isEqualTo: filter.genderPref.name);
    }
    if (filter.ratingSort != SortOrder.none) {
      newQuery = newQuery
          .where('avgRating', isGreaterThanOrEqualTo: 0)
          .orderBy('avgRating', descending: filter.ratingSort == SortOrder.highToLow);
    }
    if (filter.priceSort != SortOrder.none) {
      newQuery = newQuery.orderBy('price', descending: filter.priceSort == SortOrder.highToLow);
    }

    return newQuery;
  }

  /// The base collection reference without any filters.
  /// Used for fetching single documents by ID or for writing data.
  CollectionReference<Residence> get _residencesRef => _firestore
      .collection(residencesKey)
      .withConverter<Residence>(
        fromFirestore: (snapshot, _) =>
            Residence.fromJson(Map<String, dynamic>.from(snapshot.data()!)),
        toFirestore: (residence, _) => residence.toJson(),
      );

  /// A pre-filtered query that only includes documents with an "approved" status.
  /// Used for all public-facing list views.
  Query<Residence> get _approvedResidencesQuery =>
      _residencesRef.where('status', isEqualTo: ApprovalStatus.approved.name);
}

@Riverpod(keepAlive: true)
ResidenceRepository residenceRepository(Ref ref) {
  return ResidenceRepository(FirebaseFirestore.instance);
}
