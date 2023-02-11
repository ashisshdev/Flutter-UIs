// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AnimatedProductPage extends StatefulWidget {
  const AnimatedProductPage({super.key});

  @override
  State<AnimatedProductPage> createState() =>
      _AnimatedProductPageState();
}

class _AnimatedProductPageState extends State<AnimatedProductPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);
    _slideAnimation =
        Tween<Offset>(begin: Offset(0, -0.15), end: Offset(0, 0))
            .animate(
      CurvedAnimation(
        parent: _slideAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  int currentImageIndex = 0;
  final Product currentProduct = Product(
      title:
          "boAt Rockerz 450 with Upto 15 Hours Playback Bluetooth Headset",
      images: [blackVariation, beigeVariation, blueVariation],
      relatedProducts: relatedProducts,
      description: description,
      highlights: highlights,
      priceBefore: 300,
      price: 199,
      rating: 4.8);

  @override
  void dispose() {
    _slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.arrow_back_ios,
          ),
          actions: const [
            Icon(
              Icons.shopping_cart,
              size: 30,
            ),
          ],
        ),
        body: Stack(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Container(
                  height: 350,
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: AnimatedBuilder(
                    animation: _slideAnimationController,
                    child: Center(
                        child: AnimatedSwitcher(
                      duration: Duration(seconds: 2),
                      child: Image.asset(
                        currentProduct
                            .images[currentImageIndex].images[0],
                        key: Key(currentImageIndex.toString()),
                      ),
                    )),
                    builder: (context, child) {
                      return SlideTransition(
                        position: _slideAnimation,
                        child: child,
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2, vertical: 5),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                currentProduct.title,
                                textScaleFactor: 1.5,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                      /// Price and Rating
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, right: 5, left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// Old Price lineThrough
                            Stack(
                              children: [
                                Center(
                                  child: Text(
                                    "${currentProduct.priceBefore}  ",
                                    textScaleFactor: 1.2,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  top: 9,
                                  bottom: 9,
                                  child: Transform.rotate(
                                    angle: 2.9,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 30,
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),

                            /// Current Price
                            Text(
                              "\$${currentProduct.price}",
                              textScaleFactor: 1.6,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            Spacer(),

                            /// Rating
                            Text(
                              currentProduct.rating.toString(),
                              textScaleFactor: 1.6,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                      /// Colors Box
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 4),
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))),
                        margin: EdgeInsets.only(top: 10),
                        padding: EdgeInsets.symmetric(
                            vertical: 8, horizontal: 3),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              " 3 Available Colors :  ",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                      currentProduct.images.length,
                                  itemBuilder: ((context, index) {
                                    return InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentImageIndex = index;
                                        });
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        padding: EdgeInsets.all(2),
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.black),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: currentProduct
                                                .images[index].color,
                                          ),
                                        ),
                                      ),
                                    );
                                  })),
                            ),
                          ],
                        ),
                      ),
                      /// Divider 1
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          height: 10,
                          color: Colors.black54,
                        ),
                      ),
                      /// Description
                      Text(
                        currentProduct.description,
                        textScaleFactor: 1.2,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                      /// Space
                      SizedBox(
                        height: 20,
                      ),
                      /// Divider
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          height: 10,
                          color: Colors.black54,
                        ),
                      ),
                      /// Highlights
                      Text(
                        "Product highlights : ",
                        textScaleFactor: 1.5,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 5, left: 5),
                        child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.start,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children:
                                currentProduct.highlights.map((e) {
                              return Text(
                                "○ $e",
                                textScaleFactor: 1.2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500),
                              );
                            }).toList()),
                      ),
                      /// Space
                      SizedBox(
                        height: 20,
                      ),
                      /// Horizontle Scrollable
                      RelatedItemsBox(
                          relatedProducts:
                              currentProduct.relatedProducts),

                      /// Hightlights
                      /// Related Products
                      // RelatedItemsBox(
                      //     relatedProducts:
                      //         currentProduct.relatedProducts)
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),

            /// bottom sticky widget for add to cart and but now buttons
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Colors.white24)]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Add To Card",
                            textScaleFactor: 1.5,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.orange,
                          child: Center(
                            child: Text(
                              "Buy Now",
                              textScaleFactor: 1.5,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

// Widgets
class RelatedItemsBox extends StatelessWidget {
  final List<RelatedProduct> relatedProducts;

  const RelatedItemsBox({
    Key? key,
    required this.relatedProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Related Products ",
                  textScaleFactor: 1.5,
                ),
                Icon(
                  Icons.arrow_right_sharp,
                  size: 40,
                )
              ]),
          SizedBox(
            height: 180,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: relatedProducts.length,
              itemBuilder: ((context, index) {
                return Container(
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(2),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child:
                            Image.asset(relatedProducts[index].image),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, right: 5, left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              relatedProducts[index].title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text(
                              relatedProducts[index]
                                  .rating
                                  .toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 12,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}

////////////////////// ------------------------------
/// Dummy Data
////////////////////// ------------------------------

ProductVariation beigeVariation =
    ProductVariation(color: Color(0xFF464445), images: [
  'assets/boat450/black/black1.webp',
  'assets/boat450/black/black2.webp',
  'assets/boat450/black/black3.webp',
  'assets/boat450/black/black4.webp',
  'assets/boat450/black/black5.webp',
]);
ProductVariation blackVariation =
    ProductVariation(color: Color(0xFFDCCCB0), images: [
  'assets/boat450/beige/beige1.webp',
  'assets/boat450/beige/beige2.webp',
  'assets/boat450/beige/beige3.webp',
  'assets/boat450/beige/beige4.webp',
  'assets/boat450/beige/beige5.webp',
]);
ProductVariation blueVariation =
    ProductVariation(color: Color(0xFF92AEB7), images: [
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
