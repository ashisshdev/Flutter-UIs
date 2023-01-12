import 'package:flutter/material.dart';
import 'package:whatsapp/whatsapp_tabview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF075E54),
        ),
      ),
      home: const WhatsAppTab(),
    );
  }
}
