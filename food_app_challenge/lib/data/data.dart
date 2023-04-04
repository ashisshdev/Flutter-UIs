class Food {
  final String name;
  final String image;
  final List<Ingredient> ingredients;

  Food({required this.name, required this.image, required this.ingredients});
}

class Ingredient {
  final String name;
  final String image;
  final String quantity;

  Ingredient({required this.name, required this.image, required this.quantity});
}
