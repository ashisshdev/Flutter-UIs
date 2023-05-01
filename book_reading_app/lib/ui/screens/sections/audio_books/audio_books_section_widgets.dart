import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class CustomShapeContainer extends StatelessWidget {
  const CustomShapeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      // color: Colors.black,
      height: h * .7,
      child: Stack(
        children: [
          ClipPath(
            clipper: ContainerClipper(),
            child: Container(
              color: mainColor,
              // child: const Text("BACKGROUND"),
            ),
          ),
          ClipPath(
            clipper: ContainerClipper(),
            child: SizedBox(
              height: h * 0.7,
              // color: mainColor,
              width: w,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              IconsaxOutline.arrow_left_2,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: Icon(
                              IconsaxOutline.bookmark_2,
                              color: Colors.black,
                              size: 25,
                            ),
                          )
                        ],
                      )),
                  Expanded(
                      flex: 6,
                      child: Container(
                        color: Colors.green,
                      )),
                  Container(
                    height: w * .22,
                    width: w * .19,
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: blackColor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 2),
                              color: Colors.black,
                              spreadRadius: 1,
                              blurRadius: 3)
                        ]),
                    child: const Center(
                      child: Icon(
                        IconsaxOutline.headphone,
                        color: mainColor,
                        size: 45,
                      ),
                    ),
                  ),
                  SizedBox(height: h * .035),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //declared the variavles
    double h = size.height;
    double w = size.width;

    /// arc 1 data
    final arc1StartWidth = w * 0;
    final arc1StartHeight = h * .75;
    final arc1Radius = h * .1;
    final arc1EndWidth = w * .15;
    final arc1EndHeight = h * .85;

    /// arc 2 data
    final arc2StartWidth = w * .32;
    final arc2StartHeight = h * .85;
    final arc2Radius = h * .05;
    final arc2EndWidth = w * .38;
    final arc2EndHeight = h * .89;

    /// arc 3 data
    final arc3Radius = h * 0.09;
    final arc3EndWidth = w * .62;
    final arc3EndHeight = h * .9;

    /// arc 4 data
    final arc4Radius = h * .05;
    final arc4EndWidth = w * .68;
    final arc4EndHeight = h * .85;

    /// arc 5 data
    final arc5StartWidth = w * .85;

    // created a path
    var p = Path()

      /// move to top left corner
      ..moveTo(0, 0)

      /// make a line to starting of first arc
      ..lineTo(arc1StartWidth, arc1StartHeight)

      /// first arc in bottom left
      ..arcToPoint(Offset(arc1EndWidth, arc1EndHeight),
          radius: Radius.circular(arc1Radius), clockwise: false)

      /// make a line to starting of second arc - center cirdle's left
      ..lineTo(arc2StartWidth, arc2StartHeight)

      /// arc 2
      ..arcToPoint(Offset(arc2EndWidth, arc2EndHeight),
          radius: Radius.circular(arc2Radius), clockwise: true)

      /// semicricle - arc 3
      ..arcToPoint(Offset(arc3EndWidth, arc3EndHeight),
          radius: Radius.circular(arc3Radius), clockwise: false)

      /// arc 4
      ..arcToPoint(Offset(arc4EndWidth, arc4EndHeight),
          radius: Radius.circular(arc4Radius), clockwise: true)

      /// make a line to last arc
      ..lineTo(arc5StartWidth, h * .85)

      /// last arc in bottom right
      ..arcToPoint(Offset(w, arc1StartHeight), radius: Radius.circular(h * .1), clockwise: false)

      /// make a line to top right corner
      ..lineTo(w, 0)

      /// close method will join the starting (top left corner) and ending points (top right corner)
      ..close();
    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
