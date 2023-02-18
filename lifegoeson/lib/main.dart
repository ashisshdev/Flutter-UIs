import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: LifeGoesOnPage(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.deepPurpleAccent
  ];

  int currentColor = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentColor == 3
            ? currentColor = 0
            : currentColor = currentColor + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        color: colors[currentColor],
        child: const Center(
          child: ImageSequence(),
        ),
      )),
    );
  }
}

class ImageSequence extends StatefulWidget {
  const ImageSequence({Key? key}) : super(key: key);

  @override
  ImageSequenceState createState() => ImageSequenceState();
}

class ImageSequenceState extends State<ImageSequence> {
  List allImages = [];
  int currentImage = 0;

  @override
  void initState() {
    super.initState();

    if (allImages.isEmpty) {
      for (int i = 0; i < 15; i++) {
        allImages.add('assets/duckimages/image${i.toString()}.png');
      }
    }

    Timer.periodic(const Duration(milliseconds: 70), (timer) {
      setState(() {
        currentImage < 14
            ? currentImage = currentImage + 1
            : currentImage = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(allImages[currentImage]);
  }
}
