import 'package:assignment3_flutter/models/user_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider with ChangeNotifier{

  Future<List<UserModels>> getUserData() async {
    try {
      final resp = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/'),
      );

      final list = json.decode(resp.body) as List<dynamic>;
      return list.map((index) => UserModels.fromJson(index)).toList();
    } catch (err) {
      throw Exception('Failed to load user');
    }
  }
}