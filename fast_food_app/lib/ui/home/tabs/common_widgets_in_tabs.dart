import 'package:fast_food_app/models/nutrient.dart';
import 'package:flutter/material.dart';

class ItemAddToCart extends StatelessWidget {
  final int price;

  const ItemAddToCart({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(color: Colors.black54, width: 3)),
      padding: const EdgeInsets.symmetric(
          vertical: 12, horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$${price.toString()}",
                  textScaleFactor: 1.4,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800)),
              const Text("*Delvery not included."),
            ],
          ),
          const Text(
            "Add to Cart",
            textScaleFactor: 1.3,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}

class NutrientTile extends StatelessWidget {
  final Color color;
  final Nutrient nutrient;

  const NutrientTile({
    Key? key,
    required this.color,
    required this.nutrient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 12),
      height: 140,
      width: 75,
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(40)),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            nutrient.name,
            textScaleFactor: 1.3,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            nutrient.value,
            textScaleFactor: 0.8,
            style: const TextStyle(color: Colors.black54),
          ),
          CircleAvatar(
            radius: 26,
            backgroundColor: color.withOpacity(0.2),
            child: Text(
              "${nutrient.percentage.toStringAsFixed(0)}%",
              textScaleFactor: 1.1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class BuildACustom extends StatelessWidget {
  final String title;

  const BuildACustom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        "Build a custom $title",
        textScaleFactor: 1.4,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}
