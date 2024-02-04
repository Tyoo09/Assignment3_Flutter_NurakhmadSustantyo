import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_providers.dart';
import '../widgets/post_widgets.dart';

class PostOverviewScreen extends StatefulWidget {
  @override
  _PostOverviewScreen createState() {
    return _PostOverviewScreen();
  }
}

class _PostOverviewScreen extends State<PostOverviewScreen> {
  bool _init = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Assignment 3'),
      ),
      body: FutureBuilder(
        future:
            Provider.of<PostProvider>(context, listen: false).fetchAndSetPost(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (dataSnapshot.error != null) {
              return Center(
                child: Text(
                  'Something Went Wrong',
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              return Consumer<PostProvider>(
                builder: (ctx, post, ch) {
                  final postDatas = post.posts;
                  return ListView(
                    children: postDatas
                        .map(
                          (post) => PostCard(
                            key: ValueKey(post.userId),
                            userId: post.userId,
                            id: post.id,
                            title: post.title,
                            body: post.body,
                          ),
                        )
                        .toList(),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
