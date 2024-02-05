import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment3_flutter/providers/album_detail_providers.dart';
import 'package:assignment3_flutter/models/album_detail_models.dart';
import 'package:assignment3_flutter/widgets/album_detail_widget.dart';

class AlbumDetailOverviewScreen extends StatelessWidget {
  const AlbumDetailOverviewScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final albumProviders = Provider.of<AlbumDetailProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Album Detail',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: getAlbumDetail(albumProviders.selectedAlbum!.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.data == null) {
            return Center(child: Text("No data available"));
          } else {
            List<AlbumDetailModels> albumDetails = snapshot.data!;
            return ListView.builder(
              itemCount: albumDetails.length,
              itemBuilder: (context, index) {
                return AlbumDetailCard(
                  albumId: albumDetails[index].albumId!,
                  id: albumDetails[index].id!,
                  title: albumDetails[index].title!,
                  url: albumDetails[index].url!,
                  thumbnailUrl: albumDetails[index].thumbnailUrl!,
                );
              },
            );
          }
        },
      ),
    );
  }
}
