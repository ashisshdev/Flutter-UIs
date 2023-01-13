// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Youtube extends StatelessWidget {
  Youtube({Key? key}) : super(key: key);

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Search Youtube",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 20),
          Icon(Icons.cast),
          SizedBox(width: 20),
          Icon(Icons.notifications_none_outlined),
          SizedBox(width: 20),
          Icon(Icons.person_pin),
          SizedBox(width: 12),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.4,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home", activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department),
              label: "Trending",
              activeIcon: Icon(Icons.local_fire_department_rounded)),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: "Subscriptions",
              activeIcon: Icon(Icons.subscriptions_rounded)),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library_outlined), label: "Library", activeIcon: Icon(Icons.video_library))
        ],
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
