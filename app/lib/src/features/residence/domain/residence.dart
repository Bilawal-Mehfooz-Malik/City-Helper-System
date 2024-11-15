import '../../../core/models/entity.dart';
import '../../../core/models/my_data_types.dart';

enum ResidenceType { hostel, flat, room, house }

enum HostelStatus {
  roomAvailable,
  seatAvailable,
  unavailable
} // only used in hostel

enum ResidenceStatus {
  available,
  sold
} // only used in flat, room and house type

class Residence extends Entity {
  final Gender genderPref;
  final ResidenceType residenceType;
  final HostelStatus? hostelStatus;
  final ResidenceStatus? residenceStatus;

  Residence({
    required super.userId,
    required super.id,
    required super.name,
    required super.description,
    required super.coverImageUrl,
    required super.imagesUrls,
    required super.videosUrls,
    required super.location,
    required super.address,
    required super.avgRating,
    required super.reviewsCount,
    required super.isPopular,
    required super.updatedAt,
    super.phoneNum,
    super.waNum,
    super.fbUrl,
    super.instaUrl,
    super.webUrl,
    required this.genderPref,
    required this.residenceType,
    this.hostelStatus,
    this.residenceStatus,
  });
}
