import 'package:flutter/material.dart';
import 'package:white_sounds/ui/original/home/home.dart';

/// inspired by this dribble design - https://dribbble.com/shots/6730530-White-Noise

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'White Noises',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageOriginal(),
      // home: HomeMirror(),
    );
  }
}
