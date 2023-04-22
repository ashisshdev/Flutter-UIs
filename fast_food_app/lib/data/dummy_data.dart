import 'dart:math';

import 'package:fast_food_app/models/donut.dart';
import 'package:fast_food_app/models/nutrient.dart';
import 'package:fast_food_app/models/smoothie.dart';
import 'package:fast_food_app/utils/assets.dart';
import 'package:flutter/material.dart';

/// Homepage

class TabBarItem {
  String name;
  String image;
  TabBarItem({
    required this.name,
    required this.image,
  });
}

List<TabBarItem> tabBarItems = [
  TabBarItem(name: "Donuts", image: AppAssets.homePageAssets.homepageTabIconDonut),
  TabBarItem(name: "Burgers", image: AppAssets.homePageAssets.homepageTabIconBurger),
  TabBarItem(name: "Smoothies", image: AppAssets.homePageAssets.homepageTabIconSmoothie),
  TabBarItem(name: "Pancakes", image: AppAssets.homePageAssets.homepageTabIconPancake),
  TabBarItem(name: "Pizzas", image: AppAssets.homePageAssets.homepageTabIconPizza),
];

/// Donut Tab

List<String> donutNames = [
  "Raspberry Vanila",
  "Classic Sprinkle",
  "Strawberry Lemon",
  "Choco-Coco Tap",
  "Chocolate Cherry",
  "Choco Glaze",
  "Strawberry Wheel",
];
List<Color> donutColors = [
  Colors.purple,
  Colors.blue,
  Colors.red,
  Colors.teal,
  Colors.green,
  Colors.blue,
  Colors.orange
];

List<String> donutImages = [
  AppAssets.donutAssets.donutRaspberryVanilla,
  AppAssets.donutAssets.donutClassicSprinkle,
  AppAssets.donutAssets.donutStrawberryLemon,
  AppAssets.donutAssets.donutChocoCocoTap,
  AppAssets.donutAssets.donutChocolateCherry,
  AppAssets.donutAssets.donutChochGlaze,
  AppAssets.donutAssets.donutStrawberryWheel
];

int randomDonutPrice() => Random().nextInt(10) + 5;

List<Donut> donuts = List.generate(
    7,
    (index) => Donut(
        name: donutNames[index],
        price: randomDonutPrice(),
        color: donutColors[index],
        image: donutImages[index]));

String donutDetail =
    "The Sweet And Subtle Salty Combo of Chocolate Meets Caramel. Introduce the Caramel Duo To Your Mouth!";

/// Donut Ingredients
List<String> ingredients = [
  "Flour",
  "Sugar",
  "Milk",
  "Nuts",
  "Yeast",
  "Sugar",
  "Eggs",
  "Butter",
  "Salt",
  "Water",
  "Vanila Extract",
  "Nutmeg",
  "Vegetable Oil",
];

/// Smoothies tab

// List<String> oldSmoothieNames = [
//   "Sweet Strawberry",
//   "Leafy Berries",
//   "Cleansing Green",
//   "Banana Bonus",
//   "Choco Berry",
//   "Mango Melon",
//   "Non-Stop Apricot",
//   "Cute Cherry"
// ];

List<String> smoothieNames = [
  "Sweet Strawberry",
  "Bohemian Raspberry",
  "Cleansing Green",
  "Hakuna Banana",
  "Berry Christmas",
  "Mango Melon",
  "Peach, Please",
  "Cute Cherry"
];

List<Color> smoothieColors = [
  Colors.pink,
  Colors.purple,
  Colors.green,
  Colors.yellow,
  Colors.brown,
  Colors.orange,
  Colors.yellow,
  Colors.red
];

List<String> smoothieImages = [
  AppAssets.smoothieAssets.smoothieSweetStrawberry,
  AppAssets.smoothieAssets.smoothieLeafyBerries,
  AppAssets.smoothieAssets.smoothieCleansingGreen,
  AppAssets.smoothieAssets.smoothieBananaBonus,
  AppAssets.smoothieAssets.smoothieChocoBerry,
  AppAssets.smoothieAssets.smoothieMangoMelon,
  AppAssets.smoothieAssets.smoothieNonStopApricot,
  AppAssets.smoothieAssets.smoothieCuteCherry,
];

List<String> smoothieMessages = [
  "Sweet &\nBright",
  "Cold &\nNatural",
  "Tangy &\nHealthy",
  "Yellow &\nSweet",
  "Sweet &\nCute",
  "Strange &\nHealthy",
  "Fun &\nNatural",
  "Cute &\nTasty",
];

int randomSmoothiePrice() => Random().nextInt(5) + 10;

List<Smoothie> smoothies = List.generate(
    7,
    (index) => Smoothie(
        name: smoothieNames[index],
        price: randomSmoothiePrice(),
        color: smoothieColors[index],
        image: smoothieImages[index],
        message: smoothieMessages[index]));

String smoothieDetail =
    "The Sweet And Subtle Salty Combo of Chocolate Meets Caramel. Cold, Creamy and so thick that your straw stands straight up, and filled with juicy berries!";

/// All Tabs common

List<Nutrient> nutrients = [
  Nutrient(value: "20 Gram", percentage: 2, name: "Sugar"),
  Nutrient(value: "4 Gram", percentage: .3, name: "Salt"),
  Nutrient(value: "31 Gram", percentage: 40, name: "Carbs"),
  Nutrient(value: "8 Gram", percentage: 12, name: "Fat"),
  Nutrient(value: "5 Gram", percentage: 2, name: "Protein"),
  Nutrient(value: "140 Kcal", percentage: 40, name: "Energy"),
];

///
List<String> allPizzaImages =
    List.generate(9, (index) => 'assets/images/pizzas/remix/${index + 1}.png');

class RemixPizza {
  String name;
  int fullPrice;
  int halpPrice;
  String image;
  RemixPizza({
    required this.name,
    required this.fullPrice,
    required this.halpPrice,
    required this.image,
  });
}

List pizzaNames = [
  'Hawaiian',
  'All Veg',
  'Farmhouse',
  'Margherita',
  'Paneer Punch',
  "Meat Load",
  'Capricciosa',
  'Indian Farm',
  'Tandoori Malai'
];

int randomFullPrice() => Random().nextInt(20) + 20;
int notSoRandomHalfPrice() => 15 + Random().nextInt(10);

List<RemixPizza> allRemixAblePizzas = List.generate(
    allPizzaImages.length,
    (index) => RemixPizza(
        name: pizzaNames[index % pizzaNames.length],
        fullPrice: randomFullPrice(),
        halpPrice: notSoRandomHalfPrice(),
        image: allPizzaImages[index]));
