import 'package:flutter/material.dart';
import 'package:headphone_app/data.dart';

PreferredSizeWidget appbar() => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(
        Icons.arrow_back_ios,
      ),
      actions: const [
        Icon(
          Icons.shopping_cart,
          size: 30,
        ),
      ],
    );

class ProductTitle extends StatelessWidget {
  final String title;

  const ProductTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              textScaleFactor: 1.5,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

class PriceAndRatingRow extends StatelessWidget {
  final int price;
  final int previousPrice;
  final double rating;

  const PriceAndRatingRow({
    Key? key,
    required this.price,
    required this.rating,
    required this.previousPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Old Price lineThrough
          Stack(
            children: [
              Center(
                child: Text(
                  previousPrice.toString(),
                  textScaleFactor: 1.2,
                  style: const TextStyle(
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
            "\$$price",
            textScaleFactor: 1.6,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const Spacer(),

          /// Rating
          Text(
            rating.toString(),
            textScaleFactor: 1.6,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const Icon(
            Icons.star,
            color: Colors.yellow,
          )
        ],
      ),
    );
  }
}

class DividerHeightTen extends StatelessWidget {
  const DividerHeightTen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Divider(
        height: 10,
        color: Colors.black54,
      ),
    );
  }
}

Widget twentySizedBox() => const SizedBox(
      height: 20,
    );

class ProductHighlights extends StatelessWidget {
  final List<String> highlights;
  const ProductHighlights({Key? key, required this.highlights})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Product highlights : ",
          textAlign: TextAlign.left,
          textScaleFactor: 1.5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: highlights.map((e) {
                return Text(
                  "○ $e",
                  textScaleFactor: 1.2,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                );
              }).toList()),
        ),
      ],
    );
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
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
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
              physics: const BouncingScrollPhysics(),
              itemCount: relatedProducts.length,
              itemBuilder: ((context, index) {
                return Container(
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black)),
                  margin: const EdgeInsets.all(2),
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
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Text(
                              relatedProducts[index]
                                  .rating
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
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
