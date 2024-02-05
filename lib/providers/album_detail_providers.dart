import 'package:assignment3_flutter/models/album_detail_models.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/album_models.dart';

class AlbumDetailProvider extends ChangeNotifier {
  AlbumModels? selectedAlbum;

  void selectAlbum(AlbumModels data) {
    selectedAlbum = data;
    notifyListeners();
  }
}

Future<List<AlbumDetailModels>> getAlbumDetail(int index) async {
  try {
    final resp = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$index/photos'),
    );

    final list = json.decode(resp.body) as List<dynamic>;
    return list.map((index) => AlbumDetailModels.fromJson(index)).toList();
  } catch (err) {
    throw Exception('Failed to load album');
  }
}
