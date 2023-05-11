import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:urbanears_headphones_challenge/ui/screens/home/home.dart';

/// inpired from https://dribbble.com/shots/3894781-Urbanears-Headphones

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urbanears Headphones UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.workSansTextTheme()),
      home: const MyHomePage(),
    );
  }
}
