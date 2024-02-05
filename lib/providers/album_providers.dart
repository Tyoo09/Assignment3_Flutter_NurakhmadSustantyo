import '../models/album_models.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<AlbumModels>> getAlbumData() async {
  try {
    final resp = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/'),
    );

    final list = json.decode(resp.body) as List<dynamic>;
    return list.map((index) => AlbumModels.fromJson(index)).toList();
  } catch (err) {
    throw Exception('Failed to load album');
  }
}