import 'dart:math';

import 'package:flutter/material.dart';

/// Models
class Ingredient {
  String name;
  String image;
  String singUnitImage;
  int price;
  List<Offset> positions;
  Ingredient({
    required this.name,
    required this.image,
    required this.singUnitImage,
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

/// Helpers
List<String> ingredientsNames = [
  "Onion",
  "Chili",
  "Mushroom",
  "olive",
  "Pea",
  "Pickle",
  "Potato"
];

List<String> pizzaNames = [
  "New Orleans Pizza",
  "Mexican Green Wave",
  "Paneer Makhni Pizza",
  "Farm House Pizza"
];

/// Generated
List<Ingredient> allIngredients = List.generate(
    ingredientsNames.length,
    (index) => Ingredient(
        name: ingredientsNames[index],
        image:
            'assets/ingredients/${ingredientsNames[index].toLowerCase()}.png',
        singUnitImage:
            'assets/ingredients/single_units/${ingredientsNames[index].toLowerCase()}_unit.png',
        price: randomIngredientPrice(),
        positions: randomIngredientOffsetsList()));

List<Pizza> allPizzas = List.generate(
    pizzaNames.length,
    (index) => Pizza(
        name: pizzaNames[index],
        image: 'assets/pizzas/pizza-$index.png',
        price: randomPizzaPrice()));

/// Random Helpers
int randomIngredientPrice() => Random().nextInt(2) + 1;

int randomPizzaPrice() => Random().nextInt(5) + 10;

double randomeDoubleOffset() => double.parse(
    Random().nextDouble().floorToDouble().toStringAsFixed(3));

List<Offset> randomIngredientOffsetsList() => List.generate(6,
    (index) => Offset(randomeDoubleOffset(), randomeDoubleOffset()));

num degreeToRADS(num deg) => (deg * pi) / 180.0;

/// Other assets
const String pizzaPlate = 'assets/dish.png';


/// enums
Map<String, int> pizzaSizes = {"S": 60, "M": 40, "L": 20};

///
// enum PizzaSize { S, M, L }

// Map<String, int> pizzaSizeNumbers =
//     PizzaSize.values.map((e) => {e.toString(): sendSizeInt(e)});

// int sendSizeInt(PizzaSize size) {
//   if (size == PizzaSize.S) {
//     return 60;
//   } else if (size == PizzaSize.M) {
//     return 40;
//   } else {
//     return 20;
//   }
// }
