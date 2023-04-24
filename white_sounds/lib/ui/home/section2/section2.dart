import 'package:flutter/material.dart';
import 'package:white_sounds/utils/helper_functions.dart';

class Section2 extends StatelessWidget {
  final double pageValue;
  const Section2({super.key, required this.pageValue});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned(
            top: 15,
            left: 25 + w * 0.47 * convertRange(originalValue: pageValue),
            child: Transform.rotate(
                angle: convertRange(originalValue: pageValue), child: the4dots))
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
  decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
);
