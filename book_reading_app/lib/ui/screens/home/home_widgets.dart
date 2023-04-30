import 'package:book_reading_app/ui/theme/assets.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class MyHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Hello Daniel",
            textScaleFactor: 1.7,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Welcome back!",
            textScaleFactor: 0.9,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 5, bottom: 15),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              padding: const EdgeInsets.all(10),
              child: Image.asset(AppAssets().homePageAssets.searchIcon)),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.green,
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 0,
                right: 0,
                bottom: 15,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: mainColor,
                ),
              ),
              Positioned.fill(
                  child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(AppAssets().homePageAssets.userAvatar),
              )),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

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

class SectionTile extends StatelessWidget {
  final String title;
  final bool showArrow;
  const SectionTile({super.key, required this.title, required this.showArrow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textScaleFactor: 1.8,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        showArrow
            ? Icon(
                Icons.arrow_forward,
                size: 30,
                color: Colors.black.withOpacity(0.7),
              )
            : SizedBox.fromSize()
      ],
    );
  }
}
