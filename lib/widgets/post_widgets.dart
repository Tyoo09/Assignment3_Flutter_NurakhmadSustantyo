import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostCard({
    Key? key,
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                height: 140,
                padding: const EdgeInsets.all(0),
                child: Text(
                  id.toString(),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title ?? 'No Title',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                    Text(
                      body ?? 'No Body',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}