import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class WeeklyGoalWidget extends StatelessWidget {
  const WeeklyGoalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          height: h * 0.11,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Weekly Goal",
                    textScaleFactor: 1.4,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "210/300 minutes",
                    textScaleFactor: 1.2,
                  ),
                ],
              ),
              const Spacer(),
              const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: LinearProgressIndicator(
                  value: 0.65,
                  minHeight: 8,
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(blackColor),
                ),
              ),
            ],
          ),
        ),
        ClipPath(
          clipper: KeepItUpMessageShape(),
          child: Container(
            height: h * .035,
            width: w * .6,
            decoration: const BoxDecoration(
              color: mainColor,
            ),
            alignment: Alignment.topCenter,
            child: const Text(
              'Keep it Up!',
              textScaleFactor: 1.2,
              style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

class KeepItUpMessageShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //declared the variavles
    double h = size.height;
    double w = size.width;
    // created a path
    var p = Path()

      /// move to top left corner
      ..moveTo(0, 0)

      /// make an arc from top left corner to 10% of width and 50% of height
      ..arcToPoint(Offset(w * .1, h / 2), radius: Radius.circular(h), clockwise: true)

      /// make an arc from last point to 20% of width and 100% of height
      ..arcToPoint(Offset(w * .2, h), radius: Radius.circular(h), clockwise: false)
      ..lineTo(w * .8, h)
      ..arcToPoint(Offset(w * .9, h / 2), radius: Radius.circular(h), clockwise: false)
      ..arcToPoint(Offset(w, 0), radius: Radius.circular(h), clockwise: true)
      ..lineTo(w, 0)
      ..close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
