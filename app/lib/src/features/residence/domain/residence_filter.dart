import '../../../core/models/place.dart';
import '../../../core/models/my_data_types.dart';
import 'residence_enums.dart';

class ResidenceFilter {
  final ResidenceType? residenceType;
  final Gender? genderPref;
  final bool? isFurnished;
  final Place? location;

  ResidenceFilter({
    this.residenceType,
    this.genderPref,
    this.isFurnished,
    this.location,
  });
}
