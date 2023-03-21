import 'package:coffee_shop/screens/home/home.dart';
import 'package:flutter/material.dart';

// inspired from https://dribbble.com/shots/7969387-Coffee-To-Go-app-design/attachments/520952?mode=media

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
