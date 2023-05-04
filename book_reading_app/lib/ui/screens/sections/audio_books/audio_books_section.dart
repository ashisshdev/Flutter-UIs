import 'package:book_reading_app/data/data.dart';
import 'package:book_reading_app/ui/screens/sections/audio_books/audio_books_section_widgets.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ficonsax/ficonsax.dart';


const double pageViewPoint = 0.50;

class AudioBooksSection extends StatefulWidget {
  const AudioBooksSection({super.key});

  @override
  State<AudioBooksSection> createState() => _AudioBooksSectionState();
}

class _AudioBooksSectionState extends State<AudioBooksSection> {

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

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white60,
          Colors.white30,
          Colors.transparent,
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: mainColor),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
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
      ))
                ,Column(
                  children: [
                    SizedBox(
                      height: h * .09,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          BookDetailWIdget(title: "Hours", value: "4h 30min"),
                          BookDetailWIdget(title: "Author", value: "Hello AUth"),
                          BookDetailWIdget(title: "Genre", value: "Adventure"),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: OverViewWidget(text: descriptions[0]),
                ),
                SizedBox(height: h * .1)
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class OverViewWidget extends StatefulWidget {
  final String text;
  const OverViewWidget({super.key, required this.text});

  @override
  State<OverViewWidget> createState() => _OverViewWidgetState();
}

class _OverViewWidgetState extends State<OverViewWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overview",
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: showMore
              ? Text(
                  widget.text,
                  textScaleFactor: 1.1,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              : Text(
                  widget.text,
                  textScaleFactor: 1.1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
        )
      ],
    );
  }
}

class BookDetailWIdget extends StatelessWidget {
  final String title;
  final String value;
  const BookDetailWIdget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        Text(
          title,
          textScaleFactor: 1.3,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          textScaleFactor: 1.4,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
