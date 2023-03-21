import 'package:flutter/material.dart';

import '../utils/app_assets.dart';

class Coffee {
  final String image;
  final String name;
  final String shopName;
  final String description;
  final String price;
  final bool isLiked;

  Coffee({
    required this.image,
    required this.name,
    required this.shopName,
    required this.description,
    required this.price,
    required this.isLiked,
  });
}

List<String> coffeeImages = [
  AppAssets.homePageAssets.homeCoffeeStarbucks,
  AppAssets.homePageAssets.homeCoffeePinkCup,
  AppAssets.homePageAssets.homeCoffeeTwoCup,
  AppAssets.homePageAssets.homeCoffeeNcup,
];
List<String> coffeeNames = ["Caffe Misto", 'Caffe Latte', "Caffe Misto", 'Caffe Latte'];
List<String> coffeeShopNames = [
  "Starbucks",
  "BrownHouse",
  "Hot Black Shop",
  "BrownHouse"
];
List<String> coffeeDescriptions = [
  'Our dark, rich espresso balanced with steamed milk and a light layer of foam',
  'Rich, full-bodied espresso with bittersweet milk sauce and steamed milk',
  'Our dark, rich espresso balanced with steamed milk and a light layer of foam',
  'Rich, full-bodied espresso with bittersweet milk sauce and steamed milk'
];
List<String> coffeePrices = ['\$4.99', '\$3.29', '\$5.99', '\$4.10'];
List<bool> coffeeLikes = [false, true, true, false];

List<Coffee> coffees = List.generate(
    4,
    (index) => Coffee(
        image: coffeeImages[index],
        name: coffeeNames[index],
        shopName: coffeeShopNames[index],
        description: coffeeDescriptions[index],
        price: coffeePrices[index],
        isLiked: coffeeLikes[index]));

List<CoffeeShop> shops = [
  CoffeeShop(name: "Starbuck", image: AppAssets.homePageAssets.homeCoffeeShop1),
  CoffeeShop(name: "Black Bear", image: AppAssets.homePageAssets.homeCoffeeShop2),
  CoffeeShop(name: "Dark Store", image: AppAssets.homePageAssets.homeCoffeeShop3),
];

class CoffeeShop {
  String name;
  String image;
  CoffeeShop({
    required this.name,
    required this.image,
  });
}

class Ingredient {
  String icon;
  String name;
  Color color;
  Ingredient({
    required this.icon,
    required this.name,
    required this.color,
  });
}

List<String> ingredientNames = [
  "Water",
  "Brewed Espresso",
  "Sugar",
  "Toffee Nut Syrup",
  "Vanilla Syrup",
  "Natural Flavors",
  "Natural Honey Exract",
  "Ground Nuts"
];

List<Color> colors = [
  Colors.blue,
  Colors.brown,
  Colors.pink,
  Colors.green,
  Colors.teal,
  Colors.yellow,
  Colors.purple,
  Colors.cyan
];

List<Ingredient> coffeeIngredients = List.generate(
    8,
    (index) => Ingredient(
          icon: 'assets/images/ingredients/${index + 1}.png',
          name: ingredientNames[index],
          color: colors[index],
        ),
    growable: false);
