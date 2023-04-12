import 'package:flutter/material.dart';

class Item {
  final String title;
  final String image;
  final String description;

  Item({required this.title, required this.image, required this.description});
}

List<Item> items = [
  Item(title: 'Express your \ncreativity', image: gifs[0], description: desc),
  Item(title: 'Optimise \nevery task', image: gifs[1], description: desc),
  Item(title: 'Work more \neffectively', image: gifs[2], description: desc),
];

const String desc =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod aliqua o eiusmod do eiusmod ipsum dolor sit amet.";

List<String> gifs = [
  'assets/gifs/1.gif',
  'assets/gifs/2.gif',
  'assets/gifs/3.gif',
];

List<Color> myColors = [
  Colors.pinkAccent.shade100,
  Colors.yellow.shade100,
  Colors.deepPurpleAccent.shade100,
  Colors.greenAccent.shade200
];

const String tube1Asset = 'assets/tube1.png';
const String tube2Asset = 'assets/tube2.png';
