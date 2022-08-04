import 'dart:convert';

class Local {
  List<double> coordinates;

  Local({
    required this.coordinates,
  });

  getLongitude() {
    return coordinates[0];
  }

  getLatitude() {
    return coordinates[1];
  }

  Map<String, dynamic> toMap() {
    return {
      'coordinates': coordinates,
    };
  }

  factory Local.fromMap(Map<String, dynamic> map) {
    var local = Local(
      coordinates: map['coordinates'].cast<double>(),
    );
    return local;
  }

  String toJson() => json.encode(toMap());

  factory Local.fromJson(String source) => Local.fromMap(json.decode(source));

  @override
  String toString() => 'Local(coordinates: $coordinates)';
}
