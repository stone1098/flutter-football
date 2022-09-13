import 'package:flutter/material.dart';
import 'package:flutter_football/screens/screen_index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Football',
      routes: {
        '/index': (context) => IndexScreen(),
      },
      initialRoute: '/index',
    );
  }
}