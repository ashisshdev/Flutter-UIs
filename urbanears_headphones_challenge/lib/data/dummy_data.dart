import 'package:flutter/material.dart';

class Headphone {
  String name;
  String image;
  String title;
  String description;
  String colorName;
  Color cLight;
  Color cDark;
  Headphone({
    required this.name,
    required this.image,
    required this.title,
    required this.description,
    required this.colorName,
    required this.cLight,
    required this.cDark,
  });
}

List<Headphone> allHeadphones = [
  Headphone(
      name: "Humlan B",
      image: 'assets/headphone2.png',
      title: "Goood Quality",
      description: "Blue's music partner, \nmore rich tone fondle admiringly",
      colorName: "Blue",
      cLight: lightBlue,
      cDark: darkBlue),
  Headphone(
      name: "Plattan",
      image: 'assets/headphone1.png',
      title: "From Sweden",
      description: "Extraordinary headphones \naccompany, not the same you",
      colorName: "Silver",
      cLight: lightSilver,
      cDark: darkSilver),
  Headphone(
      name: "Humlan P",
      image: 'assets/headphone3.png',
      title: "Various Colors",
      description: "Beautiful headphones, \nlet you more and more handsome",
      colorName: "Pink",
      cLight: lightPink,
      cDark: darkPink),
];

List<Color> allLightColors = [lightBlue, lightSilver, lightPink];
List<Color> allDarkColors = [darkBlue,darkSilver,darkPink];

const lightBlue = Color(0xFFC6DEEF);
Color lightSilver = Colors.grey.shade300;
const lightPink = Color(0xFFFFEAE0);

const darkBlue = Color.fromARGB(255, 117, 187, 236);
Color darkSilver = Colors.grey.shade700;
const darkPink = Color.fromARGB(255, 248, 150, 104);
