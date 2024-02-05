import '../models/post_models.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier{

  Future<List<PostModels>> getPostData() async {
    try {
      final resp = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      if (resp.statusCode == 200) {
        final list = json.decode(resp.body) as List<dynamic>;
        return list.map((index) => PostModels.fromJson(index)).toList();
      } else {
        throw Exception('Failed to load posts - ${resp.statusCode}');
      }
    } catch (err) {
      throw Exception('Failed to load posts: $err');
    }
  }
}