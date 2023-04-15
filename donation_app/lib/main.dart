// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme)),
      debugShowCheckedModeBanner: false,
      home: Onboarding(),
    );
  }
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> with TickerProviderStateMixin {
  double pageValue = 0.0;
  int currentIndex = 0;
  late PageController pageController;
  late AnimationController squareAnimationController;
  late AnimationController buttonAnimationController;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.7, initialPage: 0)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page ?? 0.0;
        });
      });
    squareAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    buttonAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    super.initState();
  }

  gotToNextScreen() {
    /// choose the way you want to go to the next screen
    /// 1 is to enlarge the square in center - squareAnimationController.forward
    /// if I choose this then the Square should come at the end of the stack

    squareAnimationController.forward();

    /// other is to enlarge the button in bottom - buttonAnimationController.forward
    /// if I choose this then the button should come at the end of the stack

    // buttonAnimationController.forward();

    // TODO : It should be push and replace here.
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => HomePage(),
        transitionDuration: Duration(seconds: 2),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          /// the image in the center
          Center(
            child: SizedBox(
              height: h,
              width: w,
              child: Center(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: 4,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Center(
                      child: SizedBox(
                        height: 170,
                        width: 170,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          /// the rotating box around
          Positioned(
              child: IgnorePointer(
            child: Transform.rotate(
              angle: pi / 2 * pageValue,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    left: w - w / 6,
                    child: Transform.rotate(
                        alignment: Alignment.centerLeft,
                        angle: 0.25 * -pi,
                        child: Container(
                          height: h + h / 2,
                          width: w,
                          color: Color(0xFF2F44CC),
                          alignment: Alignment.center,
                        )),
                  ),
                  Positioned(
                    left: w - w / 6,
                    child: Transform.rotate(
                        alignment: Alignment.centerLeft,
                        angle: pi / 2 + 0.25 * -pi,
                        child: Container(
                          height: h + h / 2,
                          width: w,
                          // color: Colors.grey,
                          color: Color(0xFFA4AFBB),
                          alignment: Alignment.center,
                        )),
                  ),
                  Positioned(
                    right: w - w / 6,
                    child: Transform.rotate(
                        alignment: Alignment.centerRight,
                        angle: 0.25 * -pi,
                        child: Container(
                          height: h + h / 2,
                          width: w,
                          // color: Colors.redAccent.shade200,
                          color: Color(0xFFA52725),
                          alignment: Alignment.center,
                        )),
                  ),
                  Positioned(
                    right: w - w / 6,
                    child: Transform.rotate(
                        alignment: Alignment.centerRight,
                        angle: pi / 2 + 0.25 * -pi,
                        child: Container(
                          height: h + h / 2,
                          width: w,
                          // color: Colors.yellow.shade900,
                          color: Color(0xFFFDBB2F),
                          alignment: Alignment.center,
                        )),
                  ),

                  ///
                  Positioned(
                    left: 100,
                    top: -33,
                    child: Transform.rotate(
                        alignment: Alignment.centerLeft,
                        angle: 0.25 * -pi,
                        child: Container(
                          height: w,
                          width: w,
                          color: Color(0xFF2F44CC),
                          alignment: Alignment.center,
                        )),
                  ),
                ],
              ),
            ),
          )),

          /// the text message
          Positioned(
              top: 280,
              right: 40,
              child: Transform.rotate(
                  angle: 0.25 * pi,
                  alignment: Alignment.centerRight,
                  child: AnimatedOpacity(
                    opacity: (pageValue - currentIndex).abs() > 0.25 ? 0 : 1,
                    duration: Duration(milliseconds: 300),
                    child: getText(currentIndex),
                  ))),

          AnimatedBuilder(
            animation: buttonAnimationController,
            builder: (context, child) {
              return Positioned(
                  bottom: 25 * (1 - buttonAnimationController.value),
                  left: 15 * (1 - buttonAnimationController.value),
                  right: 15 * (1 - buttonAnimationController.value),
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: currentIndex == 3
                        ? InkWell(
                            onTap: () {
                              gotToNextScreen();
                            },
                            child: Container(
                              height: h * 0.09 + (buttonAnimationController.value * h),
                              width: w + (buttonAnimationController.value * w),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: Duration(milliseconds: 200),
                                  child: buttonAnimationController.value > 0.50
                                      ? SizedBox.shrink()
                                      : Text(
                                          "Let's Start",
                                          textScaleFactor: 1.7,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                ),
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  pageController.animateToPage(3,
                                      duration: Duration(
                                          milliseconds: 1200 - (currentIndex * 300)),
                                      curve: Curves.ease);
                                },
                                child: Text(
                                  "Skip",
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                      color: currentIndex % 2 == 0
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    pageController.nextPage(
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.ease);
                                  },
                                  icon: Icon(Icons.arrow_forward_ios_rounded,
                                      size: 40,
                                      color: currentIndex % 2 == 0
                                          ? Colors.white
                                          : Colors.black))
                            ],
                          ),
                  ));
            },
          ),
          Align(
            alignment: Alignment.center,
            child: pageValue < 2.99
                ? SizedBox.shrink()
                : AnimatedBuilder(
                    animation: squareAnimationController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: -pi / 4 * (1 - squareAnimationController.value),
                        child: Container(
                          color: Colors.white,
                          height: 170 + (squareAnimationController.value * h),
                          width: 170 + (squareAnimationController.value * w),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

Widget getText(int index) {
  switch (index) {
    case 0:
      return Text(
        "We Are Always\n Close To You",
        textScaleFactor: 3.0,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      );
    case 1:
      return Text(
        "Work On Local\nCauses Worldwide.",
        textScaleFactor: 3.0,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      );
    case 2:
      return Text(
        "Join Community \nYou Resonate With.",
        textScaleFactor: 3.0,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      );
    default:
      return Text(
        "Do Good, Together,\nAround The World.",
        textScaleFactor: 3.0,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ValueNotifier<int> selectedTab;
  late PageController pageController;

  @override
  void initState() {
    selectedTab = ValueNotifier<int>(0);
    pageController = PageController(initialPage: selectedTab.value);
    super.initState();
  }

  changeTab(int index, [bool cameFromPageView = false]) {
    if (selectedTab.value != index) {
      selectedTab.value = index;
      if (cameFromPageView == false) {
        pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            /// tab View
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              height: 65,
              width: w,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              padding: EdgeInsets.all(7),
              child: ValueListenableBuilder(
                valueListenable: selectedTab,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            changeTab(0);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: value == 0 ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            alignment: Alignment.center,
                            child: Text(
                              "Local",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight:
                                      value == 0 ? FontWeight.w600 : FontWeight.w500,
                                  letterSpacing: 0.6),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            changeTab(1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: value == 1 ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "International",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight:
                                      value == 1 ? FontWeight.w600 : FontWeight.w500,
                                  letterSpacing: 0.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start New Cause",
                        textScaleFactor: 1.4,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 6),
                      SizedBox(
                        height: 20,
                        child: DefaultTextStyle(
                          style: const TextStyle(fontSize: 15.0, color: Colors.grey),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            pause: Duration(seconds: 12),
                            animatedTexts: [
                              TypewriterAnimatedText("...for Children's education",
                                  speed: Duration(milliseconds: 80)),
                              TypewriterAnimatedText("...for women empowerment",
                                  speed: Duration(milliseconds: 80)),
                              TypewriterAnimatedText("...for stopping animal cruelity",
                                  speed: Duration(milliseconds: 80)),
                              TypewriterAnimatedText("...for helping minority groups",
                                  speed: Duration(milliseconds: 80)),
                              TypewriterAnimatedText("and invite people to help!",
                                  speed: Duration(milliseconds: 80)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      padding: EdgeInsets.all(15),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2F44CC)),
                      child: Icon(Icons.add, size: 30, color: Colors.white))
                ],
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  changeTab(value, true);
                },
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            SectionTitle(title: "They need your help."),
                            SizedBox(height: 15),
                            SizedBox(
                              width: w,
                              height: 160,
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    for (final item in theyNeedYourHelp) ...[
                                      AspectRatio(
                                        aspectRatio: 120 / 130,
                                        child: ImageCard(item: item),
                                      ),
                                    ],
                                    AspectRatio(
                                      aspectRatio: 120 / 130,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.all(Radius.circular(15))),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10, vertical: 15),
                                                padding: EdgeInsets.all(12),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                        color: Color(0xFF2F44CC),
                                                        width: 2)),
                                                child: Icon(Icons.arrow_forward,
                                                    size: 30, color: Color(0xFF2F44CC))),
                                            Text("View All"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                // color: Colors.grey.withOpacity(.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Text(
                                        "Start New Cause",
                                        textScaleFactor: 1.4,
                                        style: TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "All Friends who also donate.",
                                        textScaleFactor: 1.1,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(0xFF2F44CC), width: 2)),
                                      child: Icon(Icons.arrow_forward,
                                          size: 30, color: Color(0xFF2F44CC)))
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.grey,
                              height: 600,
                              margin: EdgeInsets.all(20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.green,
                  )

                  // LocalCauses(),
                  // InternationalCauses()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textScaleFactor: 1.4,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          "view all",
          textScaleFactor: 1,
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.75)),
        )
      ],
    );
  }
}

///
/// Refer to friends page
/// see all contributions
/// contributions results
///
/// categories Children, Women Empoerment, Men Rights, Animals, Education, Health, Warzone Nations
///

class Item {
  final String name;
  final String country;
  final String category;
  final String image;
  final double porgress;

  Item({
    required this.name,
    required this.category,
    required this.porgress,
    required this.country,
    required this.image,
  });
}

List<Item> theyNeedYourHelp = [
  Item(
      name: "Monkeys",
      category: "Animals",
      porgress: 23.0,
      country: "Ethiopia",
      image: 'assets/items/animal.jpg'),
  Item(
      name: "Farmers",
      category: "People",
      porgress: 14.0,
      country: "India",
      image: 'assets/items/farmer.png'),
  Item(
      name: "Girls",
      category: "People",
      porgress: 7.0,
      country: "Pakistan",
      image: 'assets/items/girl.png'),
  Item(
      name: "Children",
      category: "People",
      porgress: 30.0,
      country: "Morocco",
      image: 'assets/items/kid.jpg'),
  Item(
      name: "Ukraine",
      category: "Country",
      porgress: 72.0,
      country: "Ukraine",
      image: 'assets/items/ukraine.png')
];

class ImageCard extends StatelessWidget {
  final Item item;
  const ImageCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final h = constraints.maxHeight;
          final w = constraints.maxWidth;
          return Stack(
            children: [
              /// LOGIC for showing progress
              // Positioned.fill(
              //   top: 0,
              //   child: Image.asset(
              //     item.image,
              //     width: w,
              //     fit: BoxFit.fitWidth,
              //     alignment: Alignment.topCenter,
              //   ),
              // ),
              // Positioned(
              //   top: 0,
              //   child: ColorFiltered(
              //     colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
              //     child: Image.asset(
              //       item.image,
              //       width: w,
              //       height: h - ((item.porgress / 100) * h),

              //       fit: BoxFit.fitWidth,
              //       // color: Colors.red,
              //       alignment: Alignment.topCenter,
              //     ),
              //   ),
              // ),
              /// LOGIC Ends here
              Positioned(
                top: 0,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.black, BlendMode.saturation),
                  child: Image.asset(
                    item.image,
                    width: w,
                    fit: BoxFit.fitWidth,
                    // color: Colors.red,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                top: h * 0.71,
                left: 0,
                right: 0,
                child: Text(
                  item.name,
                  textScaleFactor: 1.2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),
              Positioned(
                top: h * 0.7,
                left: 0,
                right: 0,
                child: Text(
                  item.name,
                  textScaleFactor: 1.2,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
              Positioned(
                top: h * 0.83,
                left: 0,
                right: 0,
                child: Text(
                  item.country,
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
