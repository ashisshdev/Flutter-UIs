import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app_challenge/data/data.dart';

// app inspired from
// https://dribbble.com/shots/6950787-Mobile-App-Food-Recipes
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App Challenge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ValueNotifier<bool> isExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
            semanticsLabel: 'Acme Logo',
            // ignore: deprecated_member_use
            color: Colors.pink,
            height: 10,
            width: 10,
          ),
        ),
        actions: [
          Container(
            decoration: const BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              'assets/icons/bag.svg',
              semanticsLabel: 'Acme Logo',
              // ignore: deprecated_member_use
              color: Colors.white,
              // height: 10,
              // width: 10,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: ValueListenableBuilder(
                  valueListenable: isExpanded,
                  builder: (context, value, child) {
                    return ItemsSlider(isExpanded.value);
                  })),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {},
              onPanUpdate: (details) {
                if (details.delta.dy < 0) {
                  isExpanded.value = true;
                  showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.05),
                      elevation: 10,
                      isScrollControlled: true,
                      constraints: BoxConstraints(minHeight: h * 0.7, maxHeight: h * 0.7),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (context) {
                        return Container(
                          height: h * 6,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.photo),
                                title: const Text('Photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.music_note),
                                title: const Text('Music'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.videocam),
                                title: const Text('Video'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(Icons.share),
                                title: const Text('Share'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      }).whenComplete(() => isExpanded.value = false);
                }
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: h * 0.08,
                    width: w,
                    margin: EdgeInsets.symmetric(horizontal: w * 0.1),
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Center(
                        child: Text(
                      "Add To Cart",
                      textScaleFactor: 1.1,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    )),
                  ),
                  const Positioned(
                    bottom: 90,
                    child: Text(
                      "Swipe to see Recipe",
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ),
                  Positioned(
                    bottom: -120,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..rotateY(pi)
                        ..rotateZ(0.1),
                      alignment: FractionalOffset.center,
                      child: Image.asset(
                        'assets/bottom_fruits2.png',
                        width: w,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemsSlider extends StatefulWidget {
  final bool isExpanded;
  const ItemsSlider(this.isExpanded, {super.key});

  @override
  State<ItemsSlider> createState() => _ItemsSliderState();
}

class _ItemsSliderState extends State<ItemsSlider> {
  double pageValue = 0.0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 1.3)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return PageView.builder(
      itemCount: foodItems.length,
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        double angle = (pageValue - index).abs();

        Widget getPlate(Widget child) {
          /// Sliding the movie card in focus a little but up
          if (index == pageValue.floor() + 1 || index == pageValue.floor() + 2) {
            return Transform.translate(
              offset: Offset(0.0, 250 * (index - pageValue)),
              child: child,
            );
          } else if (index == pageValue.floor() || index == pageValue.floor() - 1) {
            return Transform.translate(
              offset: Offset(0.0, 250 * (pageValue - index)),
              child: child,
            );
          } else {
            return child;
          }
        }

        Food item = foodItems[index];
        return Stack(
          children: [
            Positioned(
              top: -130,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 400),
                opacity: angle < 0.45 ? 1 : 0,
                // opacity: angle > 0.5 ? (0.5 - (1 - angle)) : (0.5 - angle),
                child: Transform.scale(
                  scale: 1.1,
                  child: Transform.rotate(
                      angle: -angle * 1.5, child: buildFilter(item.image)),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              top: widget.isExpanded ? -30 : 100,
              left: 0,
              right: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(125),
                  child: Container(
                      child: getPlate(Transform.rotate(
                          angle: angle * 2.5, child: Image.asset(item.image)))),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                  child: AnimatedOpacity(
                duration: const Duration(milliseconds: 100),
                opacity: angle < 0.15 ? 1 : 0,
                child: Column(
                  children: [
                    Text(
                      item.name,
                      textScaleFactor: 1.5,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "\$ ${item.price}",
                      textScaleFactor: 1.5,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.pink),
                    ),
                  ],
                ),
              )),
            ),
          ],
        );
      },
    );
  }
}

Widget buildFilter(String image) {
  return ImageFiltered(
    imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
    child: Image.asset(image),
  );
}
