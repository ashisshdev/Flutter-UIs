import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urbanears_headphones_challenge/data/dummy_data.dart';
import 'package:urbanears_headphones_challenge/ui/screens/more_details/details.dart';

import 'widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ValueNotifier<double> pageValue;
  late ValueNotifier<int> currentIndex;
  late ValueNotifier<double> scale;
  late PageController pageController;
  late PageController headphoneTitlesPageController;

  @override
  void initState() {
    super.initState();

    pageValue = ValueNotifier(0.0);
    currentIndex = ValueNotifier(0);
    scale = ValueNotifier(0.0);

    pageController = PageController(initialPage: 0);
    headphoneTitlesPageController = PageController(initialPage: 0);

    /// Logic for moving headphoneTitlesPageController in accordance to items pageController pageValue
    pageController.addListener(() {
      pageValue.value = pageController.page ?? 0.0;
      headphoneTitlesPageController.position.jumpTo(headphoneTitlesPageController.position.minScrollExtent +
          (pageValue.value) * headphoneTitlesPageController.position.viewportDimension);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    headphoneTitlesPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * .08,
                width: w,
                // color: Colors.red,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: w * 0.6,
                      child: AnimatedBuilder(
                        animation: pageController,
                        builder: (context, child) {
                          return PageView(
                            controller: headphoneTitlesPageController,
                            scrollDirection: Axis.vertical,
                            children: [
                              Text(allHeadphones[0].name, textScaleFactor: 2.3),
                              Text(allHeadphones[1].name, textScaleFactor: 2.3),
                              Text(allHeadphones[2].name, textScaleFactor: 2.3)
                            ],
                          );
                        },
                      ),
                    ),
                    const Icon(Icons.menu, size: 35)
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                        bottom: h * 0.35,
                        width: w,
                        height: w,
                        child: AnimatedBuilder(
                          animation: pageController,
                          builder: (context, child) {
                            return Container(
                              margin: EdgeInsets.all(w * 0.3 + (150 * (pageValue.value - currentIndex.value).abs())),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: allHeadphones[currentIndex.value]
                                      .cLight
                                      .withOpacity((1 - (pageValue.value - currentIndex.value).abs()).clamp(0, 1))),
                            );
                          },
                        )),
                    Positioned(
                      width: w,
                      height: h * 0.55,
                      bottom: h * 0.18,
                      child: AnimatedBuilder(
                        animation: pageController,
                        builder: (context, child) {
                          return PageView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            controller: pageController,
                            onPageChanged: (value) {
                              currentIndex.value = value;
                            },
                            itemBuilder: (context, index) {
                              scale.value = 1 - (0.7 * (pageValue.value - index).abs());
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Transform.scale(
                                      scale: scale.value,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            createCircularRoute(
                                              nextPage: DetailPage(headphone: allHeadphones[index]),
                                              offset: Offset(w / 2, h * .45),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.all(15.0 * scale.value),
                                          child: Hero(
                                            tag: allHeadphones[index].image,
                                            child: Image.asset(
                                              allHeadphones[index].image,
                                              height: h * 0.4,
                                              width: w * 0.75,
                                            ),
                                          ),
                                        ),
                                      )),
                                  Container(
                                    // height: h * 0.15,
                                    margin: const EdgeInsets.symmetric(horizontal: 40),
                                    alignment: Alignment.topRight,
                                    child: Opacity(
                                      opacity: (1 - (pageValue.value - currentIndex.value).abs()).clamp(0, 1),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Opacity(
                                            opacity: index == currentIndex.value
                                                ? pageValue.value - currentIndex.value > 0.3
                                                    ? 0
                                                    : 1
                                                : 0,

                                            /// This text moves faster than the parent in both directions, so this transform widget achieves that effect
                                            child: Transform.translate(
                                                offset: Offset(-150 * (pageValue.value - currentIndex.value), 0),
                                                child: Text(
                                                  allHeadphones[index].title.toUpperCase(),
                                                  textScaleFactor: 1.5,
                                                  style:
                                                      const TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1.2),
                                                )),
                                          ),
                                          SizedBox(
                                            height: h * 0.01,
                                          ),
                                          Opacity(
                                            opacity: index == currentIndex.value
                                                ? pageValue.value - currentIndex.value > 0.3
                                                    ? 0
                                                    : 1
                                                : 0,
                                            child: Text(
                                              allHeadphones[index].description,
                                              style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const Positioned(
                      top: 100,
                      right: 15,
                      child: SeriesName(),
                    ),
                    const Positioned(
                      bottom: 0,
                      left: 10,
                      child: BrandName(),
                    ),
                    Positioned(
                        bottom: 20,
                        right: 10,
                        child: ValueListenableBuilder(
                          valueListenable: currentIndex,
                          builder: (context, value, child) {
                            return AvailableColorsRow(
                              selectedIndex: value,
                            );
                          },
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route createCircularRoute(
    {required Widget nextPage, required Offset offset, Duration duration = const Duration(milliseconds: 700)}) {
  return PageRouteBuilder(
    transitionDuration: duration,
    reverseTransitionDuration: const Duration(milliseconds: 500),
    opaque: false,
    barrierDismissible: false,
    pageBuilder: (context, animation, secondaryAnimation) => nextPage,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var screenSize = MediaQuery.of(context).size;
      Offset center = offset;

      double beginRadius = 10;
      double endRadius = screenSize.height * 1.2;

      var tween = Tween(begin: beginRadius, end: endRadius);
      var radiusTweenAnimation = animation.drive(tween);

      return ClipPath(
        clipper: CircleRevealClipper(
          radius: radiusTweenAnimation,
          center: center,
        ),
        child: child,
      );
    },
  );
}

/// A Custom path Clipper that slowly clips the widget in circle.
/// We will slowly pass the animation value from tansitionBuilder and increase the size of the cirle.
class CircleRevealClipper extends CustomClipper<Path> {
  final Offset center;
  final Animation radius;

  CircleRevealClipper({required this.center, required this.radius});

  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(radius: radius.value, center: center));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
