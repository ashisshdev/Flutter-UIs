import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/screens/home/home_screen.dart';
import 'package:movie_ticket_booking_app/utils/theme/app_textsyle.dart';
import 'package:movie_ticket_booking_app/utils/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie Booking App UI",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      // home: const Dummy(),
    );
  }
}

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [textThemeSample(context)]),
        ),
      ),
    );
  }
}
