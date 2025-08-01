import 'package:app/src/core/models/my_data_types.dart';

class SearchEntity {
  final EntityId id;
  final String name;
  final String cityName;
  final String sectorName;

  SearchEntity({
    required this.id,
    required this.name,
    required this.cityName,
    required this.sectorName,
  });

  factory SearchEntity.fromJson(Map<String, dynamic> json) {
    return SearchEntity(
      id: json['objectID'] as String,
      name: json['name'] as String,
      cityName: json['cityName'] as String,
      sectorName: json['sectorName'] as String,
    );
  }
}
