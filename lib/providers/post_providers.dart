import '../models/post_models.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostProvider with ChangeNotifier {
  List<PostModels> _posts = <PostModels>[];

  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  List<PostModels> get posts {
    return [..._posts];
  }

  Future<void> fetchAndSetPost() async {
    try {
      final resp = await http.get(url);
      final extractedData = json.decode(resp.body);
      List<PostModels> loadedDatas = [];

      extractedData['posts'].forEach((post) {
        final currentData = PostModels(
          userId: int.parse(post['userId'].toString()),
          id: int.parse(post['id'].toString()),
          title: post['title'].toString(),
          body: post['body'].toString(),
        );
        loadedDatas.add(currentData);
      });

      _posts = loadedDatas;
    } catch (err) {
      print("test $err");
      rethrow;
    }
  }
}
