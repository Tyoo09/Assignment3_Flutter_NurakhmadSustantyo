import 'package:assignment3_flutter/models/post_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_providers.dart';
import '../widgets/post_widgets.dart';

class PostOverviewScreen extends StatefulWidget {
  const PostOverviewScreen({Key? key}) : super(key: key);

  @override
  _PostOverviewScreenState createState() => _PostOverviewScreenState();
}

class _PostOverviewScreenState extends State<PostOverviewScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: Provider.of<PostProvider>(context).getPostData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.data == null) {
            return Center(child: Text("No data available"));
          } else {
            List<PostModels> posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return PostCard(
                  userId: posts[index].userId!,
                  id: posts[index].id!,
                  title: posts[index].title!,
                  body: posts[index].body!,
                );
              },
            );
          }
        },
      ),
    );
  }
}
