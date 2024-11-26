import 'package:app/src/features/startup/domain/geo_location.dart';
import 'package:app/src/core/models/my_data_types.dart';

import 'residence_enums.dart';

class ResidenceFilter {
  final ResidenceType? residenceType;
  final Gender? genderPref;
  final bool? isFurnished;
  final Location? location;

  ResidenceFilter({
    this.residenceType,
    this.genderPref,
    this.isFurnished,
    this.location,
  });
}
