import 'package:assignment3_flutter/models/address_models.dart';
import 'package:assignment3_flutter/models/company_models.dart';

class UserModels {
  int? id;
  String? name;
  String? username;
  String? email;
  AddressModels? address;
  String? phone;
  String? website;
  CompanyModels? company;

  UserModels({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserModels.fromJson(Map<String, dynamic> json) => UserModels(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: AddressModels.fromJson(json['address']),
        phone: json["phone"],
        website: json["website"],
        company: CompanyModels.fromJson(json['company']),
      );
}