class Movie {
  final String title;
  final String assetImage;
  final String type;
  final String duration;
  final String rating;
  final String synopsis;
  final bool isPlaying;

  Movie({
    required this.title,
    required this.assetImage,
    required this.type,
    required this.duration,
    required this.rating,
    required this.synopsis,
    required this.isPlaying,
  });
}

class MovieModel {
  final String name;
  final double rating;
  final String director;
  final String image;
  final List<String> genre;
  final List<Cast> castList;
  final String description;

  MovieModel(
      {required this.name,
      required this.rating,
      required this.director,
      required this.image,
      required this.genre,
      required this.castList,
      required this.description});
}

class Cast {
  final String name;

  final String role;
  final String image;

  Cast({required this.name, required this.role, required this.image});
}
