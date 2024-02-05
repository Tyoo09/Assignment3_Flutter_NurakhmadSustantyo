import 'package:assignment3_flutter/models/album_models.dart';
import 'package:assignment3_flutter/providers/album_detail_providers.dart';
import 'package:assignment3_flutter/providers/album_providers.dart';
import 'package:assignment3_flutter/screens/album_detail_overview_screen.dart';
import 'package:assignment3_flutter/widgets/album_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumOverviewScreen extends StatelessWidget {
  const AlbumOverviewScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final albumProviders = Provider.of<AlbumDetailProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Album',
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: FutureBuilder(
        future: getAlbumData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.data == null) {
            return Center(child: Text("No data available"));
          } else {
            List<AlbumModels> albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                return AlbumCard(
                  id: albums[index].id!,
                  title: albums[index].title!,
                  onTap: () {
                    if (snapshot.hasData) {
                      albumProviders.selectAlbum(snapshot.data![index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbumDetailOverviewScreen(),
                        ),
                      );
                    }
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
