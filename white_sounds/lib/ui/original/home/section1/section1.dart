import 'package:flutter/material.dart';
import 'package:white_sounds/data/data.dart';
import 'package:white_sounds/utils/helper_functions.dart';

class Section1 extends StatelessWidget {
  final double pageValue;
  const Section1({super.key, required this.pageValue});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
            top: 20,
            left: 20,
            child: Opacity(
              opacity: 1 -
                  double.parse(convertRange(originalValue: pageValue).toStringAsFixed(2)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "White Noise",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "${selectedCollection.name} collection",
                    textScaleFactor: 2.0,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.9)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: h * 0.35,
                    width: w * 0.4,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(selectedCollection.image),
                            fit: BoxFit.cover),
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
            decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
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
                                  ImageWidget(sound: e),
                                  SizedBox(
                                      width: 8 +
                                          (convertRange(originalValue: pageValue) * 20)),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.name,
                                        textScaleFactor: 1.1,
                                        maxLines: 2,
                                        style:
                                            const TextStyle(fontWeight: FontWeight.w500),
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
  }
}

class ImageWidget extends StatelessWidget {
  final Sound sound;
  const ImageWidget({super.key, required this.sound});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Image.asset(
            sound.image,
            fit: BoxFit.cover,
          )),
          sound.name == "Flowing River"
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
    );
  }
}
