import 'dart:math';

import 'package:flutter/material.dart';
import 'package:white_sounds/ui/original/home/section2/section2.dart';
import 'package:white_sounds/utils/constants.dart';
import 'package:white_sounds/utils/helper_functions.dart';

import 'data/data.dart';

class Dummy extends StatefulWidget {
  const Dummy({super.key});

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  late PageController pageController;
  final int initialIndex = 0;
  late ValueNotifier<double> page;

  @override
  void initState() {
    super.initState();
    page = ValueNotifier<double>(initialIndex.toDouble());
    pageController = PageController(
      initialPage: initialIndex,
      viewportFraction: kPageViewPointFraction,
    )..addListener(() {
        /// the page value will always vary from 0.0 to kPageViewPointFraction back and forth
        page.value = pageController.page ?? 0.0;
        // pageValue = pageController.page ?? 0.0;
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: PageView(
            controller: pageController,
            padEnds: false,
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.3)),
                child: ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, value, child) {
                    final pageValue = value;
                    final w = MediaQuery.of(context).size.width;
                    final h = MediaQuery.of(context).size.height;

                    return Stack(
                      children: [
                        Positioned(
                            top: 20,
                            left: 20,
                            child: Opacity(
                              opacity: 1 - double.parse(convertRange(originalValue: pageValue).toStringAsFixed(2)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "White Noise",
                                    textScaleFactor: 1.5,
                                    style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.7)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "${selectedCollection.name} collection",
                                    textScaleFactor: 2.0,
                                    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.9)),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: h * 0.35,
                                    width: w * 0.4,
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage(selectedCollection.image), fit: BoxFit.cover),
                                        color: Colors.grey,
                                        borderRadius: const BorderRadius.all(Radius.circular(10))),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.bookmark,
                                          color: Colors.white,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              selectedCollection.numberOfItems,
                                              textScaleFactor: 2.5,
                                              style: const TextStyle(color: Colors.white),
                                            ),
                                            Text(
                                              selectedCollection.tagLine,
                                              textScaleFactor: 1.2,
                                              style: const TextStyle(color: Colors.white),
                                            ),
                                            const Padding(padding: EdgeInsets.only(bottom: 20))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),

                        /// the forst/rain/ album icon
                        Positioned(
                          left: w * 0.33 + (convertRange(originalValue: pageValue) * w * 0.2),
                          top: h * 0.2 - (convertRange(originalValue: pageValue) * h * 0.15),
                          height: 90 - (convertRange(originalValue: pageValue) * 25),
                          width: 90 - (convertRange(originalValue: pageValue) * 25),
                          child: Container(
                            padding: EdgeInsets.all(18 - (convertRange(originalValue: pageValue) * 8)),
                            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [
                              BoxShadow(
                                offset: Offset(0.5, 0.5),
                                spreadRadius: 1,
                                blurRadius: 2,
                              ),
                            ]),
                            child: Image.asset(selectedCollection.logo),
                          ),
                        ),

                        /// the list of sounds
                        Positioned(
                            left: 20 + (convertRange(originalValue: pageValue) * w * 0.485),
                            top: h * 0.55 - (convertRange(originalValue: pageValue) * h * 0.4),
                            child: SizedBox(
                              height: h * 0.3 + (convertRange(originalValue: pageValue) * 70),
                              width: w * 0.5,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: allSounds
                                        .map((e) => Container(
                                              height: 60,
                                              width: 200,
                                              margin: const EdgeInsets.symmetric(vertical: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
                                                    clipBehavior: Clip.hardEdge,
                                                    child: Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        Positioned(
                                                            child: Image.asset(
                                                          e.image,
                                                          fit: BoxFit.cover,
                                                        )),
                                                        e.name == "Flowing River"
                                                            ? Container(
                                                                decoration: BoxDecoration(
                                                                    color: Colors.white.withOpacity(0.6),
                                                                    borderRadius: const BorderRadius.all(Radius.circular(40))),
                                                                child: const Padding(
                                                                  padding: EdgeInsets.all(4.0),
                                                                  child: Icon(
                                                                    Icons.stop_rounded,
                                                                    size: 25,
                                                                  ),
                                                                ),
                                                              )
                                                            : const SizedBox.shrink()
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(width: 8 + (convertRange(originalValue: pageValue) * 20)),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        e.name,
                                                        textScaleFactor: 1.1,
                                                        maxLines: 2,
                                                        style: const TextStyle(fontWeight: FontWeight.w500),
                                                      ),
                                                      Text(e.length)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList()),
                              ),
                            )),

                        /// the slider in bottom
                        Positioned(
                            bottom: 0,
                            left: w * 0.675 * convertRange(originalValue: pageValue),
                            child: Transform.rotate(
                              angle: -1.57 * convertRange(originalValue: pageValue),
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                width: w * 0.75,
                                height: h * 0.1,
                                padding: EdgeInsets.only(
                                    top: convertRange(originalValue: pageValue * 25),
                                    left: convertRange(
                                      originalValue: pageValue * 15 + 5,
                                    )),
                                child: Row(
                                  children: [
                                    const Icon(Icons.pause),
                                    SliderTheme(
                                      data: SliderThemeData(
                                          inactiveTrackColor: Colors.black.withOpacity(0.4),
                                          trackHeight: 1,
                                          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5)),
                                      child: Slider(value: 0.6, onChanged: (val) {}),
                                    ),
                                    const Icon(Icons.waves),
                                    const Icon(Icons.shuffle),
                                  ],
                                ),
                              ),
                            )),
                      ],
                    );
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.3),
                ),
                child: ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, value, child) {
                    final w = MediaQuery.of(context).size.width;
                    final h = MediaQuery.of(context).size.height;
                    final pageValue = value;

                    return Stack(
                      children: [
                        Positioned(
                            top: 15,
                            left: 25 + w * 0.47 * convertRange(originalValue: pageValue),
                            child: Transform.rotate(angle: convertRange(originalValue: pageValue), child: the4dots)),
                        Positioned(
                            top: h * 0.1,
                            left: 20 - ((1 - convertRange(originalValue: pageValue)) * 65),
                            child: SizedBox(
                              height: h * 0.75,
                              width: w * 0.75,
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 25 * (1 - double.parse(convertRange(originalValue: pageValue).toStringAsFixed(2))),
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
                                                    Transform.rotate(
                                                      angle: -pi / 2 * (1 - convertRange(originalValue: pageValue)),
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
                                                                fontSize: 15 - (3 * (1 - convertRange(originalValue: pageValue))),
                                                                color: Colors.black.withOpacity(0.65),
                                                                fontWeight: FontWeight.w500,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: h * 0.015),
                                                    Transform.translate(
                                                      offset: Offset(10 + 50 * (1 - convertRange(originalValue: pageValue)), 0),
                                                      child: Container(
                                                        height: h * 0.18 - (h * 0.12 * (1 - convertRange(originalValue: pageValue))),
                                                        width: w * 0.5 - (w * 0.4 * (1 - convertRange(originalValue: pageValue))),
                                                        // margin: const EdgeInsets.only(left: 10),
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(e.image), fit: BoxFit.cover, alignment: Alignment.topCenter),
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
                                                          duration: const Duration(milliseconds: 400),
                                                          child: pageValue > 0.6
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
                          left: -((1 - convertRange(originalValue: pageValue)) * w * 0.50),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
