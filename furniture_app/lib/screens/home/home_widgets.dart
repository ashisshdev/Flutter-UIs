import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:furniture_app/data/data.dart';

class SectionTile extends StatelessWidget {
  final String title;
  const SectionTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textScaleFactor: 1.9,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          Transform.rotate(
            angle: pi,
            child: const Icon(Icons.arrow_back_ios),
          ),
        ],
      ),
    );
  }
}

class TrendingItemsList extends StatefulWidget {
  const TrendingItemsList({super.key});

  @override
  State<TrendingItemsList> createState() => _TrendingItemsListState();
}

class _TrendingItemsListState extends State<TrendingItemsList> {
  late PageController pageController;
  double pageValue = 0.0;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.8)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      padEnds: false,
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      itemCount: trendingNow.length,
      itemBuilder: (context, index) {
        double angle = (pageValue - index).abs();

        return TrendingFurnitureCard(
          furniture: trendingNow[index],
          angle: angle,
        );
      },
    );
  }
}

class TrendingFurnitureCard extends StatelessWidget {
  final Furniture furniture;
  final double angle;

  const TrendingFurnitureCard({super.key, required this.furniture, required this.angle});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          elevation: 20,
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: SizedBox(
                          height: constraints.maxHeight * 0.7,
                          child: Transform(
                            transform: Matrix4.identity()..rotateY(-angle),
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              furniture.image,
                              fit: BoxFit.cover,
                            ),
                          )),
                    ),

                    /// for parallax effect

                    Transform.translate(
                      offset: Offset(-100 * angle, 0),
                      child: RatingBarIndicator(
                        rating: furniture.rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 15.0,
                        // direction: Axis.vertical,
                      ),
                    ),
                  ],
                ),
                const Spacer(),

                /// for parallax effect
                Transform.translate(
                  offset: Offset(20 * angle, 0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              furniture.name,
                              textScaleFactor: 1.8,
                              style: const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "by ${furniture.by}",
                              textScaleFactor: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              furniture.price,
                              textScaleFactor: 1.8,
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            furniture.isLiked
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.favorite_border)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NewArrivalsList extends StatelessWidget {
  const NewArrivalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: MasonryGridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: allItems.length,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        gridDelegate:
            const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(seconds: 1),
            columnCount: (allItems.length / 2).floor(),
            child: ScaleAnimation(
              child: FadeInAnimation(
                child: Column(
                  children: [
                    Image.asset(
                      allItems[index].image,
                      fit: BoxFit.cover,
                    ),
                    Card(
                      elevation: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    allItems[index].name,
                                    textScaleFactor: 1.6,
                                    maxLines: 2,
                                    style: const TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  allItems[index].price,
                                  textScaleFactor: 1.8,
                                  style: const TextStyle(fontWeight: FontWeight.w700),
                                ),
                                allItems[index].isLiked
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    : const Icon(Icons.favorite_border)
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
