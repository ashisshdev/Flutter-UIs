import 'package:flutter/material.dart';
import 'package:white_sounds/utils/constants.dart';

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

class WhiteNoiseApp extends StatefulWidget {
  const WhiteNoiseApp({super.key});

  @override
  State<WhiteNoiseApp> createState() => _WhiteNoiseAppState();
}

class _WhiteNoiseAppState extends State<WhiteNoiseApp> {
  late PageController pageController;
  final int initialIndex = 0;
  late ValueNotifier<double> page;

  @override
  void initState() {
    super.initState();
    page = ValueNotifier<double>(initialIndex.toDouble());
    pageController = PageController(
      initialPage: initialIndex,
      viewportFraction: kPageViewPointFraction,
    )..addListener(() {
        /// the page value will always vary from 0.0 to kPageViewPointFraction back and forth
        page.value = pageController.page ?? 0.0;
        // pageValue = pageController.page ?? 0.0;
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Placeholder(),
    );
  }
}
