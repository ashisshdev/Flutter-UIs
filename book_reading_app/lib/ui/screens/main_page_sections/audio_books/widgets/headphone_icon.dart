import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class HeadphoneIcon extends StatelessWidget {
  const HeadphoneIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Container(
      height: w * .19,
      width: w * .19,
      margin: EdgeInsets.only(bottom: h * .015),
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: blackColor, boxShadow: [
        BoxShadow(offset: Offset(0, 2), color: Colors.black, spreadRadius: 1, blurRadius: 3)
      ]),
      child: const Center(
        child: Icon(
          IconsaxOutline.headphone,
          color: mainColor,
          size: 45,
        ),
      ),
    );
  }
}
