class Food {
  final String name;
  final String image;
  final double price;

  Food({required this.name, required this.image, required this.price});
}

class Ingredient {
  final String name;
  final String image;
  final String quantity;

  Ingredient({required this.name, required this.image, required this.quantity});
}

/////////

List<Ingredient> allIngredients = [
  Ingredient(name: "Blueberries", image: 'assets/ingredients/berry.png', quantity: '30g'),
  Ingredient(name: "Mangoes", image: 'assets/ingredients/mango.png', quantity: '50g'),

  Ingredient(name: "Honey", image: 'assets/ingredients/honey.png', quantity: '15g'),
  Ingredient(name: "Oranges", image: 'assets/ingredients/orange.png', quantity: '50g'),

  // Ingredient(name: "Kiwis", image: 'assets/ingredients/kiwi.png', quantity: '50g'),
  // Ingredient(
  //     name: "Strawberries", image: 'assets/ingredients/strawberry.png', quantity: '80g'),
];

List<Ingredient> moreIngredients = [
  Ingredient(
      name: "Maple Syrup", image: 'assets/more_ingredients/mapple.png', quantity: '50g'),
  Ingredient(
      name: "Pancake Syrup",
      image: 'assets/more_ingredients/pancake.png',
      quantity: '50g'),
  Ingredient(
      name: "Chocolate Syrup",
      image: 'assets/more_ingredients/choclate.png',
      quantity: '50g'),
  Ingredient(
      name: "Pure Maple Syrup",
      image: 'assets/more_ingredients/pure_maple.png',
      quantity: '50g'),
  // Ingredient(
  //     name: "Strawberry Syrup",
  //     image: 'assets/more_ingredients/strawberry.png',
  //     quantity: '50g'),
];

List<Food> foodItems = [
  Food(name: "Spicy Spaghetti", image: 'assets/plates/spaghetti.png', price: 30.00),
  Food(name: "Mix Fruit Plate", image: 'assets/plates/fruit.png', price: 23.66),
  Food(name: "Chicken Chips", image: 'assets/plates/chips.png', price: 35.50),
];

List<Food> cartItems = [
  Food(name: "Spicy Spaghetti", image: 'assets/plates/spaghetti.png', price: 30.00),
  Food(name: "Mix Fruit Plate", image: 'assets/plates/fruit.png', price: 23.66),
  Food(name: "Chicken Chips", image: 'assets/plates/chips.png', price: 35.50),
];
