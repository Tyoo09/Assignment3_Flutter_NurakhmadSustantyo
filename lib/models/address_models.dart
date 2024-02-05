import 'package:assignment3_flutter/models/geo_models.dart';

class AddressModels {
  String? street;
  String? suite;
  String? city;
  String? zipcode;
  GeoModels? geo;

  AddressModels({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  factory AddressModels.fromJson(Map<String, dynamic> json) => AddressModels(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: GeoModels.fromJson(json['geo'])
      );
}