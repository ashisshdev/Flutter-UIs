import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_login_screen/screens/home/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.black));

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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF3EBACE),
          secondary: const Color(0xFFD8ECF1),
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),
      // home: const LoginScreen(),
      home: const HomePage(),
    );
  }
}

