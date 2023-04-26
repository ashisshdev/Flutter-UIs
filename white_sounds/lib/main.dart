import 'package:flutter/material.dart';

import 'ui/mirror/home/home_mirror.dart';

/// inspired by this dribble design - https://dribbble.com/shots/6730530-White-Noise

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeMirror(),
        // home: HomePageOriginal(),
      ),
    );
  }
}
