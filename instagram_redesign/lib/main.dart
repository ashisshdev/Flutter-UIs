import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

List<Color> instagramGradientColors = [
  const Color(0xFFfeda75),
  const Color(0xFFfa7e1e),
  const Color(0xFFd62976),
  const Color(0xFF962fbf),
  const Color(0xFF4f5bd5),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Iconsax.camera,
          color: Colors.black,
          size: 35,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Image.asset(
            'assets/logo.png',
            width: w / 2.8,
          ),
        ),
        actions: [
          Transform.rotate(
            angle: pi * -0.2,
            child: const Icon(
              Iconsax.send_1,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: Color(0xFF0b102c),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            iconSize: 35,
            currentIndex: 1,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home5),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore_rounded,
                  fill: 1,
                ),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.add_square5),
                label: "Add",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.notification5),
                label: "Notifications",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),
            SizedBox(
              width: w,
              height: 90,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            end: Alignment.bottomRight,
                            begin: Alignment.centerLeft,
                            colors: instagramGradientColors)),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
