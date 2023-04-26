import 'dart:math';

import 'package:flutter/material.dart';
import 'package:white_sounds/data/data.dart';
import 'package:white_sounds/utils/helper_functions.dart';

class Section2Mirror extends StatelessWidget {
  final double pageValue;
  const Section2Mirror({super.key, required this.pageValue});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
            top: 15,
            left: 40 + w * 0.47 * convertRange(originalValue: pageValue),
            child: Transform.rotate(angle: (1 - convertRange(originalValue: pageValue)), child: the4dots)),
        Positioned(
            top: h * 0.1,
            // left: 20 + ((convertRange(originalValue: pageValue)) * 65),
            left: 20 + w * 0.47 * convertRange(originalValue: pageValue),
            child: SizedBox(
              height: h * 0.75,
              width: w * 0.75,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25 * (double.parse(convertRange(originalValue: pageValue).toStringAsFixed(2))),
                      // height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: allCollections
                          .map((e) => Container(
                                margin: const EdgeInsets.symmetric(vertical: 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform.translate(
                                      offset: Offset(10 + 40 * (convertRange(originalValue: pageValue)), 0),
                                      child: Transform.rotate(
                                        angle: -pi / 2 * (convertRange(originalValue: pageValue)),
                                        // angle: 0,
                                        alignment: Alignment.bottomLeft,
                                        child: RichText(
                                          textScaleFactor: 1.3,
                                          textAlign: TextAlign.right,
                                          softWrap: true,
                                          text: TextSpan(
                                            text: e == selectedCollection ? "• " : "  ",
                                            style: const TextStyle(color: Colors.blue, fontSize: 20),
                                            children: [
                                              TextSpan(
                                                text: e.name.toUpperCase(),
                                                style: TextStyle(
                                                  letterSpacing: 1,
                                                  fontSize: 15 - (3 * (convertRange(originalValue: pageValue))),
                                                  color: Colors.black.withOpacity(0.65),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: h * 0.03),
                                    Transform.translate(
                                      offset: Offset(10 + 100 * (convertRange(originalValue: pageValue)), 0),
                                      // offset: const Offset(0, 0),
                                      child: Container(
                                        height: h * 0.18 - (h * 0.16 * (convertRange(originalValue: pageValue))),
                                        width: w * 0.5 - (w * 0.45 * (convertRange(originalValue: pageValue))),
                                        // height: h * 0.18,
                                        // width: w * 0.5,
                                        // margin: const EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(e.image), fit: BoxFit.cover, alignment: Alignment.topCenter),
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(0.5, 0.5),
                                                  blurRadius: 5,
                                                  spreadRadius: 0.5,
                                                  color: Colors.black.withOpacity(0.2))
                                            ]),
                                        clipBehavior: Clip.hardEdge,
                                        padding: const EdgeInsets.only(top: 30, left: 20),
                                        alignment: Alignment.centerLeft,
                                        child: AnimatedSwitcher(
                                          duration: const Duration(milliseconds: 500),
                                          child: pageValue < 0.1
                                              ? Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e.numberOfItems,
                                                      textScaleFactor: 2.8,
                                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Text(
                                                      e.tagLine,
                                                      textScaleFactor: 1,
                                                      style: const TextStyle(color: Colors.white),
                                                    )
                                                  ],
                                                )
                                              : const SizedBox.shrink(),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            )),

        /// user name and profile pic
        Positioned(
          bottom: 0,
          // left: -((1 - convertRange(originalValue: pageValue)) * w * 0.50),
          left: ((1 - convertRange(originalValue: pageValue))),
          height: h * 0.1,
          width: w * 0.75,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(offset: Offset(0, 0), color: Colors.white, spreadRadius: 5, blurRadius: 10),
            ]),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Ashish",
                    textScaleFactor: 1.9,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    backgroundImage: AssetImage('assets/user.png'),
                    radius: 28,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

/// Widgets
Widget the4dots = SizedBox(
  height: 35,
  width: 35,
  child: Stack(
    children: [
      Align(alignment: Alignment.topLeft, child: theDotBall),
      Align(alignment: Alignment.topRight, child: theDotBall),
      Align(alignment: Alignment.bottomLeft, child: theDotBall),
      Align(alignment: Alignment.bottomRight, child: theDotBall)
    ],
  ),
);

Widget theDotBall = Container(
  height: 10,
  width: 10,
  decoration: BoxDecoration(color: Colors.black.withOpacity(0.6), shape: BoxShape.circle),
);
