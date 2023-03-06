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
  TabBarItem(
      name: "Donuts",
      image: AppAssets.homePageAssets.homepageTabIconDonut),
  TabBarItem(
      name: "Burgers",
      image: AppAssets.homePageAssets.homepageTabIconBurger),
  TabBarItem(
      name: "Smoothies",
      image: AppAssets.homePageAssets.homepageTabIconSmoothie),
  TabBarItem(
      name: "Pancakes",
      image: AppAssets.homePageAssets.homepageTabIconPancake),
  TabBarItem(
      name: "Pizzas",
      image: AppAssets.homePageAssets.homepageTabIconPizza),
];

/// Donut Tab

class Donut {
  String name;
  int price;
  Color color;
  String image;

  Donut({
    required this.name,
    required this.price,
    required this.color,
    required this.image,
  });
}

List<Donut> donuts = [
  Donut(
      name: "Raspberry Vanila",
      price: 23,
      color: Colors.purple,
      image: AppAssets.donutAssets.donutRaspberryVanilla),
  Donut(
      name: "Classic Sprinkle",
      price: 27,
      color: Colors.blue,
      image: AppAssets.donutAssets.donutClassicSprinkle),
  Donut(
      name: "Strawberry Lemon",
      price: 30,
      color: Colors.red,
      image: AppAssets.donutAssets.donutStrawberryLemon),
  Donut(
      name: "Choco-Coco Tap",
      price: 33,
      color: Colors.teal,
      image: AppAssets.donutAssets.donutChocoCocoTap),
  Donut(
      name: "Chocolate Cherry",
      price: 34,
      color: Colors.green,
      image: AppAssets.donutAssets.donutChocolateCherry),
  Donut(
      name: "Choco Glaze",
      price: 39,
      color: Colors.blue,
      image: AppAssets.donutAssets.donutChochGlaze),
  Donut(
      name: "Strawberry Wheel",
      price: 42,
      color: Colors.orange,
      image: AppAssets.donutAssets.donutStrawberryWheel),
];
