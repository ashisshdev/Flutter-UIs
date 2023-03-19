import 'package:flutter/material.dart';

class AppColor {
  static Color primaryColor = const Color(0xFFE8B448);
  static Color secondaryColor = const Color.fromARGB(255, 3, 8, 104);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF000000);
  static Color backgroundBlack = const Color.fromARGB(255, 37, 37, 37);
  static Color backgroundGray = const Color.fromRGBO(238, 238, 238, 1);

  static MaterialColor primarySwatch = const MaterialColor(
    0xFFE8B448,
    {
      50: Color(0xFFf4daa4),
      100: Color(0xFFf1d291),
      200: Color(0xFFefcb7f),
      300: Color(0xFFedc36d),
      400: Color(0xFFeabc5a),
      500: Color(0xFFE8B448),
      600: Color(0xFFd1a241),
      700: Color(0xFFba903a),
      800: Color(0xFFa27e32),
      900: Color(0xFF8b6c2b),
    },
  );
}
