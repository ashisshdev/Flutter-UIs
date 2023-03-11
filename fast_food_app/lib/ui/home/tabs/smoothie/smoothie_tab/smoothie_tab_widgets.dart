import 'dart:math';
import 'package:fast_food_app/models/smoothie.dart';
import 'package:flutter/material.dart';
import 'package:fast_food_app/ui/home/tabs/smoothie/view_smoothie/view_smoothie_page.dart';


class SmoothieCard extends StatelessWidget {
  final Smoothie smoothie;

  const SmoothieCard({
    Key? key,
    required this.smoothie,
  }) : super(key: key);

  final double borderRadius = 18;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  SmoothiePage(smoothie: smoothie)));
        },
        child: Stack(
          children: [
            Positioned(
              right: 0,
              left: 0,
              bottom: 0,
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: smoothie.color.withOpacity(0.1),
                    borderRadius:
                        BorderRadius.circular(borderRadius),
                  ),
                  child: Column(
                    children: [
                      // price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: smoothie.color
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(
                                    borderRadius),
                                topRight: Radius.circular(
                                    borderRadius),
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              ' \$${smoothie.price} ',
                              style: TextStyle(
                                color: smoothie.color,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 45,
                      ),
                      // donut flavor
                      Text(
                        smoothie.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Dunkins',
                        style:
                            TextStyle(color: Colors.grey[600]),
                      ),
                      // love icon + add button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 5),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: const [
                            // love icon
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                              // Colors.pink[400],
                            ),

                            // plus button
                            Text(
                              "Add",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  decoration:
                                      TextDecoration.underline),
                            ),
                            // Icon(
                            //   Icons.add,
                            //   color: Colors.grey[800],
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: -20,
              child: Hero(
                tag: smoothie.image,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 5),
                  child: Transform(
                      transform: Matrix4.rotationY(pi),
                      alignment: Alignment.center,
                      child: Image.asset(
                        smoothie.image,
                        height: 120,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
