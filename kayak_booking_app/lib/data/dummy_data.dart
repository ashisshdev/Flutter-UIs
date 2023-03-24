import 'package:flutter/material.dart';
import 'package:kayak_booking_app/models/kayak.dart';

List<String> kayakNames = [
  "Lifetime Youth",
  "Sunny Island",
  "Pelican Athena",
  "Sun Dolphin",
  "Lifetime Athena ",
  "Sunny Island",
  "Pelican Youth",
];

List<Color> kayakColors = [
  Colors.pink,
  Colors.cyan,
  Colors.blue,
  Colors.yellow,
  Colors.teal,
  Colors.green,
  Colors.brown,
  Colors.red,
];

List<Kayak> kayaks = List.generate(
    7,
    (index) => Kayak(
        name: kayakNames[index],
        image: 'assets/kayaks/kayak${index + 1}.png',
        color: kayakColors[index]));
