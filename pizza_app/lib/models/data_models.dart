import 'package:flutter/material.dart';

class Ingredient {
  String name;
  String image;
  int singleUnitSize;
  String singUnitImage;
  int price;
  List<Offset> positions;
  Ingredient({
    required this.name,
    required this.image,
    required this.singUnitImage,
    required this.singleUnitSize,
    required this.price,
    required this.positions,
  });
}

class Pizza {
  String name;
  int price;
  String image;
  Pizza({
    required this.name,
    required this.price,
    required this.image,
  });
}

enum PizzaSize { S, M, L }

class CustomPizza {
  Pizza pizza;
  List<Ingredient> addOnIngredients;
  PizzaSize pizzaSize;
  int price;

  CustomPizza({
    required this.pizza,
    required this.addOnIngredients,
    required this.pizzaSize,
    required this.price,
  });
}
