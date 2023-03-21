import 'package:coffee_shop/data/data.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

class IngredientIcon extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientIcon({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 5.0),
        child: Column(children: [
          Container(
            height: 50.0,
            width: 50.0,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: ingredient.color.withOpacity(0.8)),
            child: Center(
              child: Image.asset(
                ingredient.icon,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          SizedBox(
              width: 60.0,
              child: Center(
                  child: Text(ingredient.name,
                      textAlign: TextAlign.center,
                      style: varelaBrown.copyWith(
                          fontSize: 10, fontWeight: FontWeight.w500))))
        ]));
  }
}
