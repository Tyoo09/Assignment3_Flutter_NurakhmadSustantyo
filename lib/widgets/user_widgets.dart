import 'package:flutter/material.dart';
import '../models/address_models.dart';
import '../models/company_models.dart';

class UserCard extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModels address;
  final String phone;
  final String website;
  final CompanyModels company;

  const UserCard({
    Key? key,
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Text(
            "${id ?? '_'}",
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Text(name ?? '_'),
          Text(username ?? '_'),
          Text(email ?? '_'),
          Text(
            "${address?.street ?? '_'}, ${address?.suite ?? '_'}, ${address?.city ?? '_'}, ${address?.zipcode ?? '_'} geo: ${address?.geo?.lat ?? '_'}, ${address?.geo?.lng ?? '_'}",
          ),
          Text(phone ?? '_'),
          Text(website ?? '_'),
          Text(
            "${company?.name ?? '_'}: ${company?.catchPhrase ?? '_'} (${company?.bs ?? '_'})",
          ),
          Container(
            height: 10,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}