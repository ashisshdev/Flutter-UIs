import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app_challenge/data/data.dart';

class ItemsSlider extends StatefulWidget {
  final bool isExpanded;
  const ItemsSlider(this.isExpanded, {super.key});

  @override
  State<ItemsSlider> createState() => _ItemsSliderState();
}

class _ItemsSliderState extends State<ItemsSlider> {
  double pageValue = 0.0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 1.3)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return PageView.builder(
      itemCount: foodItems.length,
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        double angle = (pageValue - index).abs();

        Widget getPlate(Widget child) {
          /// Sliding the movie card in focus a little but up
          if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
            return Transform.translate(
              offset: Offset(0.0, 250 * (index - pageValue)),
              child: child,
            );
          } else if (index == pageValue.floor() || index == pageValue.floor() - 1) {
            return Transform.translate(
              offset: Offset(0.0, 250 * (pageValue - index)),
              child: child,
            );
          } else {
            return child;
          }
        }

        Food item = foodItems[index];
        return Stack(
          children: [
            Positioned(
              top: -130,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: angle < 0.45 ? 1 : 0,
                // opacity: angle > 0.5 ? (0.5 - (1 - angle)) : (0.5 - angle),
                child: Transform.scale(
                  scale: 1.1,
                  child: Transform.rotate(
                      angle: -angle * 1.5, child: buildFilter(item.image)),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: widget.isExpanded ? -30 : 100,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(125),
                  child: Container(
                      child: getPlate(Transform.rotate(
                          angle: angle * 2.5, child: Image.asset(item.image)))),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                  child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: angle < 0.15 ? 1 : 0,
                child: Column(
                  children: [
                    Text(
                      item.name,
                      textScaleFactor: 1.5,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "\$ ${item.price}",
                      textScaleFactor: 1.5,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.pink),
                    ),
                  ],
                ),
              )),
            ),
          ],
        );
      },
    );
  }
}

Widget buildFilter(String image) {
  return ImageFiltered(
    imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
    child: Image.asset(image),
  );
}
