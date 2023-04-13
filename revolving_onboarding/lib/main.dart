// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      ),
      home: Onboarding(),
    );
  }
}

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

List emojis = ["🤼", "😍", "😑", "👹"];

class _OnboardingState extends State<Onboarding> {
  double pageValue = 0.0;
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.7, initialPage: 0)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page ?? 0.0;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark, statusBarColor: Colors.transparent),
      child: Scaffold(
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
                          // color: Colors.black,
                          child: Center(
                            child: Text(
                              emojis[index],
                              textScaleFactor: 5.0,
                            ),
                          ),
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
                    )
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
          ],
        ),
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
        "Text 2",
        textScaleFactor: 2.0,
        style: TextStyle(color: Colors.black),
      );
    case 2:
      return Text(
        "Text 3",
        textScaleFactor: 2.0,
        style: TextStyle(color: Colors.white),
      );
    default:
      return Text(
        "Text 2",
        textScaleFactor: 2.0,
        style: TextStyle(color: Colors.black),
      );
  }
}
