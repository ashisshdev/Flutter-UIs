import 'package:book_store_app/data/category_list.dart';
import 'package:book_store_app/model/book.dart';

/// Book list
class BookList {
  static final List<Book> newArrivalBooks = [
    Book(
        title: "SHOE DOG",
        price: 20,
        image: "assets/images/book1.jpg",
        category: CategoryList.business,
        author: "Phil Knight"),
    Book(
      title: "No Rules Rules",
      author: "Reed Hastings / Erin Meyer",
      price: 20,
      image: "assets/images/book10.jpg",
      category: CategoryList.business,
    ),
    Book(
        title: "To Pixar And Beyond",
        author: "Lawrence Levy",
        price: 20,
        image: "assets/images/book11.jpg",
        category: CategoryList.business),
    Book(
        title: "WONDER",
        author: "R. J. Palacio",
        price: 20,
        image: "assets/images/book6.jpg",
        category: CategoryList.novel),
    Book(
        title: "HOLES",
        author: "Louis Sachar",
        price: 20,
        image: "assets/images/book7.jpg",
        category: CategoryList.novel),
  ];

  static final List<Book> recommendBooks = [
    Book(
        title: "Who Moved My Cheese?",
        author: "Spencer Johnson",
        price: 20,
        image: "assets/images/book8.jpg",
        category: CategoryList.business),
    Book(
        title: "The Giver",
        author: "Lois Lowry",
        price: 20,
        image: "assets/images/book2.jpg",
        category: CategoryList.novel),
    Book(
        title: "Martin Luther King",
        author: "Martin Luther King Jr.",
        price: 20,
        image: "assets/images/book4.jpg",
        category: CategoryList.biography),
    Book(
        title: "KIKI's DELIVERY SERVICE",
        author: "Eiko Kadono",
        price: 20,
        image: "assets/images/book3.jpg",
        category: CategoryList.novel),
  ];
}
