import 'package:flutter/material.dart';
import 'package:white_sounds/utils/helper_functions.dart';

class Section1 extends StatelessWidget {
  final double pageValue;
  const Section1({super.key, required this.pageValue});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    // print(pageValue);
    return Stack(
      children: [
        Positioned(
            top: 20,
            left: 20,
            child: Opacity(
              opacity: 1 - pageValue.clamp(0, 1),
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
                    "Forest collection",
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
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.bookmark),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('04', textScaleFactor: 2.5),
                            Text(
                              'Being in the\nForest',
                              textScaleFactor: 1.2,
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 20))
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
          left: w * 0.33,
          top: h * 0.2,
          height: 90,
          width: 90,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: w * 0.65 * convertRange(originalValue: pageValue),
            child: Transform.rotate(
              angle: -1.57 * convertRange(originalValue: pageValue),
              alignment: Alignment.bottomLeft,
              child: Container(
                width: w * 0.75,
                height: h * 0.1,
                color: Colors.red,
              ),
            ))
      ],
    );
  }
}
