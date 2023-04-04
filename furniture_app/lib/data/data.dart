import 'dart:math';

import 'package:flutter/material.dart';

class Furniture {
  final String image;

  final String name;
  final String by;
  final String price;
  final String description;
  final bool isLiked;
  final double rating;

  Furniture({
    required this.image,
    required this.name,
    required this.by,
    required this.description,
    required this.price,
    required this.isLiked,
    required this.rating,
  });
}

List<String> furnitureCategories = [
  'All',
  'Sofa',
  'Bed',
  "Chair",
  'Table',
  'Lamp',
  'Almirah',
  'Arm Chain',
  'Coffee Table',
  'Rocking Chair'
];

List<String> chairNames = [
  'Leather Chair',
  'Hellingdal Chair',
  'Minimilistic Chair',
  'Arm-less Chair'
];

List<Furniture> trendingNow = List.generate(
    8,
    (index) => Furniture(
        image: 'assets/images/trending_now/${index + 1}.png',
        name: chairNames[index % 4],
        by: "Ikea",
        description: des,
        price: "\$${Random().nextInt(5) + 15}",
        isLiked: index % 3 == 0,
        rating: 5.0));

// ------------------------------------

List allItemsNames = ['Cushion Chair', 'Cafe Chair', 'Long Chair', 'Comfy Chair'];

List<Furniture> allItems = List.generate(
  8,
  (index) => Furniture(
      name: allItemsNames[index % 4],
      image: 'assets/images/all_items/item${index + 1}.png',
      by: 'Ikea',
      description: des,
      price: "\$${Random().nextInt(10) + 20}",
      isLiked: index % 3 == 0,
      rating: Random().nextDouble() + 4),
);

//////////////////////////////////////

//////////////////////
String des =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

class Product {
  final List<Color> colors;
  final List<String> images;
  final Furniture furniture;

  Product({required this.colors, required this.images, required this.furniture});
}

Product myProduct = Product(colors: [
  const Color.fromARGB(255, 90, 164, 224),
  Colors.redAccent.shade100,
  const Color.fromARGB(255, 131, 226, 180),
  const Color.fromARGB(255, 224, 134, 240),
  Colors.yellowAccent.shade700
], images: [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png'
], furniture: allItems[0]);
