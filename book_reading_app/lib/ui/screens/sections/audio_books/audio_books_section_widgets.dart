import 'package:book_reading_app/data/data.dart';
import 'package:book_reading_app/data/models/book.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class CustomShapeContainer extends StatefulWidget {
  const CustomShapeContainer({super.key});

  @override
  State<CustomShapeContainer> createState() => _CustomShapeContainerState();
}

const double pageViewPoint = 0.50;

class _CustomShapeContainerState extends State<CustomShapeContainer> {
  int currentIndex = 0;
  double pageValue = 0.0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(viewportFraction: pageViewPoint)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page ?? 0.0;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      // color: Colors.black,
      // height: h * .65,
      child: Stack(
        children: [
          ClipPath(
            clipper: ContainerClipper(),
            child: Container(
              height: h * 0.65,
              color: mainColor,
              width: w,
              child: Column(
                children: [
                  Row(
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
                  ),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: pageController,
                      builder: (context, child) {
                        return Stack(
                          children: [
                            Positioned.fill(
                                top: -40,
                                bottom: -10,
                                left: 20,
                                right: 20,
                                child: Column(
                                  children: [
                                    for (int j = 0;
                                        j < bookNamesBGLists[currentIndex].length;
                                        j++) ...[
                                      BackGroundText(text: bookNamesBGLists[currentIndex][j])
                                    ],
                                  ],
                                )),
                            Positioned.fill(
                              child: PageView.builder(
                                controller: pageController,
                                onPageChanged: (value) {
                                  currentIndex = value;
                                },
                                itemBuilder: (context, index) {
                                  final book = allBooks[index];
                                  final scale = 1 - (0.2 * (pageValue - index).abs());
                                  final opacity =
                                      ((1 - (pageValue - index).abs()) + 0.6).clamp(0.0, 1.0);
                                  return Transform.scale(
                                    scale: scale,
                                    child: Opacity(
                                      opacity: opacity,
                                      child: Center(
                                        child: Column(
                                          children: [
                                            Expanded(
                                              flex: 5,
                                              child: BookImage(image: book.image),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: index != currentIndex
                                                  ? Container()
                                                  : BookNameAndRating(book: book),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    height: w * .19,
                    width: w * .19,
                    margin: EdgeInsets.only(bottom: h * .015),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookImage extends StatelessWidget {
  final String image;
  const BookImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class BookNameAndRating extends StatelessWidget {
  final Book book;
  const BookNameAndRating({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                book.name,
                textScaleFactor: 1.8,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < book.rating; i++) ...[
                      const Icon(
                        IconsaxBulk.star,
                        size: 35,
                        color: mainDark,
                      ),
                    ],
                    const SizedBox(width: 5),
                    for (int i = 0; i < 5 - book.rating; i++) ...[
                      const Icon(
                        IconsaxOutline.star,
                        size: 25,
                        color: mainDark,
                      ),
                    ],
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class BackGroundText extends StatelessWidget {
  final String text;
  const BackGroundText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.fill,
        child: FittedBox(
          /// or we can just remove this fitted box
          fit: BoxFit.fitHeight,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: Text(
              text,
              key: UniqueKey(),
              textAlign: TextAlign.center,
              // style: GoogleFonts.anton(
              //     textStyle: TextStyle(
              //         foreground: Paint()
              //           ..style = PaintingStyle.stroke
              //           ..strokeWidth = .1
              //           ..color = mainColorDark)),
              style: TextStyle(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = .1
                    ..color = mainColorDark),
            ),
          ),
        ),
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
    final arc1StartHeight = h * .77;
    final arc1Radius = h * .1;
    final arc1EndWidth = w * .15;
    final arc1EndHeight = h * .87;

    /// arc 2 data
    final arc2StartWidth = w * .32;
    final arc2StartHeight = h * .87;
    final arc2Radius = h * .05;
    final arc2EndWidth = w * .38;
    final arc2EndHeight = h * .93;

    /// arc 3 data
    final arc3Radius = h * 0.095;
    final arc3EndWidth = w * .62;
    final arc3EndHeight = h * .89;

    /// arc 4 data
    final arc4Radius = h * .05;
    final arc4EndWidth = w * .68;
    final arc4EndHeight = h * .87;

    /// arc 5 data
    final arc5StartWidth = w * .85;
    final arc5StartHeight = h * .87;

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
      ..lineTo(arc5StartWidth, arc5StartHeight)

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
