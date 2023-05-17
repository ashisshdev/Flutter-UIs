import 'dart:math';

import 'package:flutter/material.dart';

import 'models.dart';

/// App Level Strings
List<String> sections = ["Black GOld", 'Cold Brew', 'Nescafe', 'McCafe', "Gold Brew"];
String aboutUs = "About Us";

/// Coffee's List Hard Data
List<String> allCoffeeNames = [
  "New Orleans",
  "French Vanilla",
  "Cocoa Mocha",
  "Bean Bag Kit",
  "The Spouch",
  "Lil'Easy Black",
  "Lil'Easy Strong",
  "Bean Bag Can",
  "Decaf Bean Bag Can",
  "Bean Bag Concentrate",
  "Bean Bag Decaf",
  "New Orleans Dark Roast",
];

List<int> ranks = [1, 3, 5, 8, 6, 4, 12, 11, 9, 2, 7, 10];

List<String> section1Images = List.generate(3, (index) => 'assets/coffees/1/${index + 1}.png');
List<String> section2Images = List.generate(2, (index) => 'assets/coffees/2/${index + 1}.png');
List<String> section3Images = List.generate(2, (index) => 'assets/coffees/3/${index + 1}.png');
List<String> section4Images = List.generate(2, (index) => 'assets/coffees/4/${index + 1}.png');
List<String> section5Images = List.generate(3, (index) => 'assets/coffees/5/${index + 1}.png');

List<String> allCoffeeImages = section1Images + section2Images + section3Images + section4Images + section5Images;

List<Color> cardColor = [
  const Color(0xFF57CFEA),
  const Color(0xFFFCC07E),
  const Color.fromARGB(255, 243, 107, 204),
  const Color.fromARGB(255, 205, 243, 102),
];

String description =
    "Designed with your taste buds in mind, it's dangerously smooth with just the right touch of vanilla, backed up by our signature blend of coffee, chicory, and spices.\n\nAll-natural, sugar-free, vegan, low calorie, non-GMO, kosher, and gluten-free";

/// Coffees lists generators
List<Coffee> allCoffees = List.generate(
    12,
    (index) => Coffee(
        name: allCoffeeNames[index],
        image: allCoffeeImages[index],
        price: generateRandomPrice().toString(),
        reviews: generateRandomReviewsCount(),
        rating: generateRandomRating(),
        rank: ranks[index],
        cardColor: cardColor[index % 4],
        description: description));

List<Recipe> whatYouCanDo = [];

List<Coffee> relatedItems = [allCoffees[11], allCoffees[4], allCoffees[9], allCoffees[7], allCoffees[6]];

/// Random Generators
final Random random = Random();

double generateRandomPrice() => 10 + random.nextInt(10) + double.parse(random.nextDouble().toStringAsFixed(2));

double generateRandomRating() {
  double min = 2.5;
  double max = 5.0;
  double randomDouble = min + random.nextDouble() * (max - min);
  return double.parse(randomDouble.toStringAsFixed(1));
}

int generateRandomReviewsCount() => random.nextInt(200) + 30;
