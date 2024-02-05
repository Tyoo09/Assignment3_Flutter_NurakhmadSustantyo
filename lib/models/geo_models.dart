class GeoModels {
  String? lat;
  String? lng;

  GeoModels({
    this.lat,
    this.lng,
  });

  factory GeoModels.fromJson(Map<String, dynamic> json) => GeoModels(
        lat: json["lat"],
        lng: json["lng"],
      );
}
