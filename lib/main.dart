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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 15, 117, 235),
          primarySwatch: Colors.blue,
        ),
        home: PostOverviewScreen(),
      ),
    );
  }
}
