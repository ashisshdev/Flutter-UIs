import 'package:book_reading_app/data/data.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class ContinueReadinCard extends StatelessWidget {
  const ContinueReadinCard({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
            bottom: 0,
            height: h * 0.16,
            left: 0,
            right: 0,

            /// the main color background widget
            child: ClipPath(
              clipper: ContinueReadingCardClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: mainColor,
                ),
              ),
            )),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: SizedBox(
            height: h * 0.18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// image oin left
                Container(
                  margin: const EdgeInsets.only(right: 30, left: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    allBooks.last.image,
                    width: w * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),

                /// everything in right
                SizedBox(
                  width: w * .55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      /// keep it up and progress
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Keep It Up!",
                            textScaleFactor: 1.3,
                            style:
                                TextStyle(fontWeight: FontWeight.w600, fontStyle: FontStyle.italic),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: w * .15,
                            child: const ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              child: LinearProgressIndicator(
                                value: 1,
                                minHeight: 3,
                                // backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              "78%",
                              textScaleFactor: 1.3,
                              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),

                      /// name and more options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: w * .45,
                                child: Text(
                                  allBooks.last.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textScaleFactor: 1.3,
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                allBooks.last.genre,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textScaleFactor: 1.3,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.5)),
                              )
                            ],
                          ),
                          const Icon(Icons.more_vert)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ContinueReadingCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //declared the variavles
    double h = size.height;
    double w = size.width;
    // created a path
    var p = Path()

      /// move to top left corner
      ..moveTo(0, 0)

      /// line to 30% of width
      ..lineTo(w * .30, 0)

      ///make 1st arc
      ..arcToPoint(Offset(w * .33, h * .1), radius: Radius.circular(h * .2), clockwise: true)

      /// make second arcd
      ..arcToPoint(Offset(w * .36, h * .2), radius: Radius.circular(h * .2), clockwise: false)

      /// continue making line
      ..lineTo(w, h * .2)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    return p;

    /// Note : Rounded corners are handled by child container of this clipper
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
