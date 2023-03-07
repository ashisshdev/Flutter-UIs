import 'package:fast_food_app/ui/home/tabs/donut/view_donut_page.dart';
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
  TabBarItem(
      name: "Burgers",
      image: AppAssets.homePageAssets.homepageTabIconBurger),
  TabBarItem(
      name: "Smoothies",
      image: AppAssets.homePageAssets.homepageTabIconSmoothie),
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

List<Nutrient> nutrients = [
  Nutrient(value: "20 Gram", percentage: 2, name: "Sugar"),
  Nutrient(value: "4 Gram", percentage: .3, name: "Salt"),
  Nutrient(value: "31 Gram", percentage: 40, name: "Carbs"),
  Nutrient(value: "8 Gram", percentage: 12, name: "Fat"),
  Nutrient(value: "5 Gram", percentage: 2, name: "Protein"),
  Nutrient(value: "140 Kcal", percentage: 40, name: "Energy"),
];

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
