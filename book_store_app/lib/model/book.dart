import 'package:book_store_app/model/category.dart';

/// Book model
class Book {
  final String title;
  final int price;
  final String image;
  final Category category;
  final String author;

  Book({
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.author,
  });
}
