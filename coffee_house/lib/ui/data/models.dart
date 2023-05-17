import 'package:flutter/material.dart';

class Coffee {
  String name;
  String image;
  String price;
  int reviews;
  double rating;
  int rank;
  String description;
  Color cardColor;
  Coffee({
    required this.name,
    required this.image,
    required this.price,
    required this.reviews,
    required this.rating,
    required this.rank,
    required this.description,
    required this.cardColor,
  });
}

class Recipe {
  String title;
  String image;
  List<String> ingredients;
  List<String> steps;
  Recipe({
    required this.title,
    required this.image,
    required this.ingredients,
    required this.steps,
  });
}
