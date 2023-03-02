import 'package:pizza_app/utils/helpers.dart';

import '../models/data_models.dart';

/// Helpers
List<String> ingredientsNames = [
  "Onion",
  "Chili",
  "Mushroom",
  "Olive",
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
    singleUnitSize: unitSizes[ingredientsNames[index]]!,
    price: randomIngredientPrice(),
    positions: randomIngredientOffsetsList(),
  ),
);

List<Pizza> allPizzas = List.generate(
    pizzaNames.length,
    (index) => Pizza(
        name: pizzaNames[index],
        image: 'assets/pizzas/pizza-$index.png',
        price: randomPizzaPrice()));

Map<String, int> unitSizes = {
  "Onion": 30,
  "Chili": 25,
  "Mushroom": 20,
  "Olive": 14,
  "Pea": 11,
  "Pickle": 18,
  "Potato": 18
};
