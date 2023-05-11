import 'dart:math';

import 'package:flutter/material.dart';
import 'package:urbanears_headphones_challenge/data/dummy_data.dart';
import 'package:urbanears_headphones_challenge/ui/theme/app_strings.dart';

class BrandName extends StatelessWidget {
  const BrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // angle: -pi / 3,
      angle: -pi / 2,
      alignment: Alignment.topLeft,
      child: Text(
        brandName.toUpperCase(),
        textScaleFactor: 1.6,
        style: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 2),
      ),
    );
  }
}

class SeriesName extends StatelessWidget {
  const SeriesName({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 2,
      alignment: Alignment.topRight,
      child: Text(
        headphoneSeriesName.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.w700, letterSpacing: 3, color: Colors.grey),
      ),
    );
  }
}


class AvailableColorsRow extends StatelessWidget {
  final int selectedIndex;
  const AvailableColorsRow({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < allLightColors.length; i++) ...[
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 40,
            width: 40,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.all(11),
            decoration: BoxDecoration(
              border: selectedIndex == i
                  ? Border.all(color: Colors.grey, width: 1)
                  : Border.all(width: 0, color: Colors.white),
              shape: BoxShape.circle,
              // color: element,
            ),
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: allLightColors[i],
                shape: BoxShape.circle,
              ),
            ),
          )
        ]
      ],
    );
  }
}
