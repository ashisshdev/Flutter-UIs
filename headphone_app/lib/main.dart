import 'package:flutter/material.dart';
import 'package:headphone_app/animated_product_page_advance.dart';
import 'animated_index_shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: const AnimatedProductPageAdvance(),
      home: const AnimatedProductPage(),

    );
  }
}
