import 'cast.dart';

class Movie {
  final String name;
  final double rating;
  final String director;
  final String image;
  final List<String> genre;
  final List<Cast> castList;
  final String description;

  Movie(
      {required this.name,
      required this.rating,
      required this.director,
      required this.image,
      required this.genre,
      required this.castList,
      required this.description});
}

