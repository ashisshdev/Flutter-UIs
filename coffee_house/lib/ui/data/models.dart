class Coffee {
  String name;
  String price;
  int reviews;
  int stars;
  int rank;
  String description;
  Coffee({
    required this.name,
    required this.price,
    required this.reviews,
    required this.stars,
    required this.rank,
    required this.description,
  });
}

class Recipe {
  String title;
  String image;
  List<String> ingredients;
  List<String> steps;
  Recipe({
    required this.title,
    required this.image,
    required this.ingredients,
    required this.steps,
  });
}


