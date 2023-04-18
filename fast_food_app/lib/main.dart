import 'package:fast_food_app/ui/home/homepage.dart';
import 'package:fast_food_app/ui/home/tabs/pizzza/remix_pizza/remix_pizza.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DonutApp());
}

class DonutApp extends StatelessWidget {
  const DonutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const RemixPizza(),
    );
  }
}
