class Location {
  final double lat;
  final double lng;
  final String name;

  Location(this.lat, this.lng, this.name);
  factory Location.fromJson(Map<String, dynamic> json) => Location(
        json['lat'],
        json['lng'],
        json['name'],
      );
}
