import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kayak_booking_app/data/dummy_data.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;

  double currentPage = 0;
  double previousPage = 0;
  bool isUpScroll = true;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 0.5)
      ..addListener(() {
        setState(() {
          currentPage = pageController.page!;
          previousPage < currentPage ? isUpScroll = true : isUpScroll = false;
          previousPage = currentPage;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.menu_rounded, color: Colors.black),
        actions: const [Icon(Icons.person, color: Colors.black)],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: const Text(
                "Rent a boat",
                textScaleFactor: 2.8,
                style:
                    TextStyle(fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
              ),
            ),
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Center(
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintStyle: const TextStyle(),
                      focusColor: Colors.black,
                      focusedBorder: _border(Colors.black, 3),
                      border: _border(Colors.grey.withOpacity(0.05), 1),
                      hintText: 'Search',
                      alignLabelWithHint: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 5),
                        child: Icon(Icons.search),
                      ),
                    ),
                    onFieldSubmitted: (value) {},
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: kayaks.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                padEnds: false,
                itemBuilder: (context, index) {
                  double enterExitAngle = (currentPage - index).abs();
                  double scrollingAngle = (currentPage - index).abs();

                  if (scrollingAngle > 0.5) {
                    scrollingAngle = 1 - scrollingAngle;
                  }

                  Matrix4 extryExitMatrix = Matrix4.identity()
                    ..setEntry(3, 2, 0.0001)
                    ..rotateX(-enterExitAngle * 1.5);

                  Matrix4 scrollingMatrix = Matrix4.identity()
                    ..setEntry(
                      3,
                      2,
                      0.001,
                    )
                    ..rotateX(isUpScroll ? scrollingAngle : -scrollingAngle);

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                    padding: const EdgeInsets.only(
                      right: 2,
                      left: 2,
                      top: 2,
                      bottom: 2,
                    ),
                    // transform: currentPage < index ? Matrix4.identity() : myMatrix,
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: currentPage < index ? scrollingMatrix : extryExitMatrix,
                      child: Opacity(
                        opacity: currentPage < index ? 1 : 1 - enterExitAngle,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: h * 0.20,
                                decoration: BoxDecoration(
                                    color: kayaks[index].color.withOpacity(0.7),
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(20))),
                                child: Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Icon(Icons.arrow_forward,
                                          color: Colors.white),
                                      const SizedBox(height: 10),
                                      Text(kayaks[index].name,
                                          textScaleFactor: 2.0,
                                          style: const TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -30,
                              right: w * 0.25,
                              height: h * 0.30,
                              child: Transform.rotate(
                                angle: pi * -1.3,
                                child: SimpleShadow(
                                  opacity: 0.3,
                                  color: Colors.black,
                                  offset: const Offset(15, -10),
                                  child: Image.asset(
                                    kayaks[index].image,
                                    alignment: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder _border(Color color, double width) => OutlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
      borderRadius: BorderRadius.circular(6),
    );
