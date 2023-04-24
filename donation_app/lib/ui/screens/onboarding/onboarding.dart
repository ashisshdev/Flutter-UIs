import 'dart:math';

import 'package:donation_app/ui/screens/home/homepage.dart';
import 'package:flutter/material.dart';

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
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    buttonAnimationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
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
        pageBuilder: (_, __, ___) => const HomePage(),
        transitionDuration: const Duration(seconds: 2),
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
                    return const Center(
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
                          color: const Color(0xFF2F44CC),
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
                          color: const Color(0xFFA4AFBB),
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
                          color: const Color(0xFFA52725),
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
                          color: const Color(0xFFFDBB2F),
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
                          color: const Color(0xFF2F44CC),
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
                    duration: const Duration(milliseconds: 300),
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
                    duration: const Duration(milliseconds: 400),
                    child: currentIndex == 3
                        ? InkWell(
                            onTap: () {
                              gotToNextScreen();
                            },
                            child: Container(
                              height: h * 0.09 + (buttonAnimationController.value * h),
                              width: w + (buttonAnimationController.value * w),
                              decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                child: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: buttonAnimationController.value > 0.50
                                      ? const SizedBox.shrink()
                                      : const Text(
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
                                        duration: const Duration(milliseconds: 400),
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
                ? const SizedBox.shrink()
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
      return const Text(
        "We Are Always\n Close To You",
        textScaleFactor: 3.0,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      );
    case 1:
      return const Text(
        "Work On Local\nCauses Worldwide.",
        textScaleFactor: 3.0,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      );
    case 2:
      return const Text(
        "Join Community \nYou Resonate With.",
        textScaleFactor: 3.0,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      );
    default:
      return const Text(
        "Do Good, Together,\nAround The World.",
        textScaleFactor: 3.0,
        textAlign: TextAlign.right,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      );
  }
}
