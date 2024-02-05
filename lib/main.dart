import 'package:assignment3_flutter/providers/album_detail_providers.dart';
import 'package:assignment3_flutter/providers/user_providers.dart';
import 'package:assignment3_flutter/screens/album_detail_overview_screen.dart';
import 'package:assignment3_flutter/screens/album_overview_screen.dart';
import 'package:assignment3_flutter/screens/user_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/post_providers.dart';
import '../screens/post_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AlbumDetailProvider(),
        ),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 15, 117, 235),
          primarySwatch: Colors.blue,
        ),
        home: const AppHome(),
      ),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Users',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return PostOverviewScreen();
      case 1:
        return AlbumOverviewScreen();
      case 2:
        return UserOverviewScreen();
      default:
        return Container();
    }
  }
}
