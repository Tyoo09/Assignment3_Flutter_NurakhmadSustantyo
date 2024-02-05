import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  final int id;
  final String title;
  final VoidCallback onTap;

  const AlbumCard({
    Key? key,
    required this.id,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
                leading: Text(
                  "$id",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                height: 10,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
