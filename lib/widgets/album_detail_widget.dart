import 'package:flutter/material.dart';
import 'package:assignment3_flutter/models/album_detail_models.dart';

class AlbumDetailCard extends StatelessWidget {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const AlbumDetailCard({
    Key? key,
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              maxLines: 2,
            ),
            leading: Text(
              "$id",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
          ),
          Container(
            height: 10,
            color: Colors.white,
          ),
          Image.network(url ?? ''),
        ],
      ),
    );
  }
}
