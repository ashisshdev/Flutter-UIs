import 'dart:math';

/// Models
class Ingredient {
  String name;
  String image;
  String singUnitImage;
  int price;
  Ingredient({
    required this.name,
    required this.image,
    required this.singUnitImage,
    required this.price,
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
        price: randomIngredientPrice()));

List<Pizza> allPizzas = List.generate(
    pizzaNames.length,
    (index) => Pizza(
        name: pizzaNames[index],
        image: 'assets/pizzas/pizza-$index.png',
        price: randomPizzaPrice()));

/// Random Helpers
int randomIngredientPrice() => Random().nextInt(2) + 1;
int randomPizzaPrice() => Random().nextInt(5) + 10;

/// Other assets
const String pizzaPlate = 'assets/dish.png';

/// Const Data
List<String> pizzaSizes = ["S", "M", "L"];
