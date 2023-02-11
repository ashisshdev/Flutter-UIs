import 'dart:ui';

ProductVariation beigeVariation =
    ProductVariation(color: const Color(0xFF464445), images: [
  'assets/boat450/black/black1.webp',
  'assets/boat450/black/black2.webp',
  'assets/boat450/black/black3.webp',
  'assets/boat450/black/black4.webp',
  'assets/boat450/black/black5.webp',
]);
ProductVariation blackVariation =
    ProductVariation(color: const Color(0xFFDCCCB0), images: [
  'assets/boat450/beige/beige1.webp',
  'assets/boat450/beige/beige2.webp',
  'assets/boat450/beige/beige3.webp',
  'assets/boat450/beige/beige4.webp',
  'assets/boat450/beige/beige5.webp',
]);
ProductVariation blueVariation =
    ProductVariation(color: const Color(0xFF92AEB7), images: [
  'assets/boat450/blue/blue1.webp',
  'assets/boat450/blue/blue2.webp',
  'assets/boat450/blue/blue3.webp',
  'assets/boat450/blue/blue4.webp',
  'assets/boat450/blue/blue5.webp',
]);

List<RelatedProduct> relatedProducts = [
  // RelatedProduct(
  //     title: "Boat 330",
  //     image: "assets/related_products/boat330.webp",
  //     rating: 3.8),
  RelatedProduct(
      title: "Boat 510",
      image: "assets/related_products/boat510.webp",
      rating: 4.3),
  RelatedProduct(
      title: "Boat 518",
      image: "assets/related_products/boat518.webp",
      rating: 4.8),
  RelatedProduct(
      title: "Boat 550",
      image: "assets/related_products/boat550.webp",
      rating: 4.2),
  RelatedProduct(
      title: "Boat 560",
      image: "assets/related_products/boat560.webp",
      rating: 4.0),
  RelatedProduct(
      title: "Boat 600",
      image: "assets/related_products/boat600.webp",
      rating: 4.5),
  RelatedProduct(
      title: "Boat 650",
      image: "assets/related_products/boat650.webp",
      rating: 4.7),
  RelatedProduct(
      title: "Boat 751",
      image: "assets/related_products/boat751.webp",
      rating: 4.9),
];

/// Fake data
List<String> highlights = [
  'With Mic:Yes',
  'Connector type: 3.5 mm',
  'Battery life: 15 hr | Charging time: 3 Hours',
  '40mm Drivers: HD Sound',
  'Adjustable Earcups',
  'Up to 15 H Playback',
  'Bluetooth version 5.0',
  "Dual Modes: Bluetooth & AUX",
];

String description =
    'Are you looking for a headset that features eye-catching aesthetics and dual modes? If yes, bring home the boAt Rockerz 450 that has an AUX-mode as well as the Bluetooth connectivity feature. The 40-mm drivers and adjustable earcups ensure you enjoy a comfortable listening experience that is immersive.';

/// Models

class Product {
  String title;
  List<ProductVariation> images;
  List<RelatedProduct> relatedProducts;
  String description;
  List<String> highlights;
  int price;
  int priceBefore;
  double rating;
  Product({
    required this.title,
    required this.images,
    required this.relatedProducts,
    required this.description,
    required this.highlights,
    required this.price,
    required this.priceBefore,
    required this.rating,
  });
}

class RelatedProduct {
  String title;
  String image;
  double rating;
  RelatedProduct({
    required this.title,
    required this.image,
    required this.rating,
  });
}

class ProductVariation {
  Color color;
  List<String> images;
  ProductVariation({
    required this.color,
    required this.images,
  });
}
