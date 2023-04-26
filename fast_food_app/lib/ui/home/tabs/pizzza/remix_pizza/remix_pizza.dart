import 'dart:math';

import 'package:fast_food_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

class RemixPizza extends StatefulWidget {
  const RemixPizza({super.key});

  @override
  State<RemixPizza> createState() => _RemixPizzaState();
}

class _RemixPizzaState extends State<RemixPizza> {
  late PageController page1Controller;
  int page1CurrentIndex = 0;
  double page1PageValue = 0.0;

  late PageController page2Controller;
  int page2CurrentIndex = 0;
  double page2PageValue = 0.0;

  @override
  void initState() {
    super.initState();

    page1Controller =
        PageController(initialPage: page1CurrentIndex, viewportFraction: 0.35)
          ..addListener(() {
            setState(() {
              page1PageValue = page1Controller.page ?? 0.0;
            });
          });
    page2Controller =
        PageController(initialPage: page2CurrentIndex, viewportFraction: 0.35)
          ..addListener(() {
            setState(() {
              page2PageValue = page2Controller.page ?? 0.0;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                    width: w,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 25,
                        ),
                        Text(
                          "Remix Pizza",
                          textScaleFactor: 1.9,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text("     "),
                      ],
                    ))),
            Positioned(
              top: h * 0.05,
              bottom: h * 0.1,
              child: SizedBox(
                width: w,
                child: Row(
                  children: [
                    Expanded(
                        child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          page1CurrentIndex = value;
                        });
                      },
                      controller: page1Controller,
                      scrollDirection: Axis.vertical,
                      itemCount: allRemixAblePizzas.length,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 0),
                          curve: Curves.easeInOut,
                          alignment: Alignment.centerRight,
                          child: Opacity(
                            opacity: index == page1CurrentIndex
                                ? 1 - (page1PageValue - index).abs()
                                : 0.4,
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 150),
                                  right: -195,
                                  top: 0,
                                  left: 0,
                                  bottom: 0,
                                  child: AnimatedPadding(
                                    duration: const Duration(milliseconds: 100),
                                    padding: index == page1CurrentIndex
                                        ? EdgeInsets.zero
                                        : index > page1CurrentIndex
                                            ? const EdgeInsets.only(
                                                left: 0, bottom: 70, top: 40)
                                            : const EdgeInsets.only(
                                                left: 0, bottom: 40, top: 70),
                                    child: Image.asset(
                                      allRemixAblePizzas[index].image,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
                    Expanded(
                        child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          page2CurrentIndex = value;
                        });
                      },
                      controller: page2Controller,
                      scrollDirection: Axis.vertical,
                      itemCount: allRemixAblePizzas.length,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 0),
                          curve: Curves.easeInOut,
                          // color: index == page2CurrentIndex ? Colors.red : Colors.green,
                          alignment: Alignment.centerRight,
                          child: Opacity(
                            opacity: index == page2CurrentIndex
                                ? 1 - (page2PageValue - index).abs()
                                : 0.4,
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 150),
                                  right: 0,
                                  top: 0,
                                  left: -195,
                                  bottom: 0,
                                  child: AnimatedPadding(
                                    duration: const Duration(milliseconds: 100),
                                    padding: index == page2CurrentIndex
                                        ? EdgeInsets.zero
                                        : index > page2CurrentIndex
                                            ? const EdgeInsets.only(
                                                left: 0, bottom: 70, top: 40)
                                            : const EdgeInsets.only(
                                                left: 0, bottom: 40, top: 70),
                                    child: Image.asset(allRemixAblePizzas[index].image),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                ),
              ),
            ),
            Positioned(
                height: h * 0.24,
                width: w,
                top: 55,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 0),
                  child: page1CurrentIndex == page2CurrentIndex
                      ? Container(
                          color: Colors.white,
                          padding: const EdgeInsets.only(bottom: 30),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${allRemixAblePizzas[page1CurrentIndex].name} Pizza",
                            textScaleFactor: 2.0,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      : Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    allRemixAblePizzas[page1CurrentIndex].name,
                                    textScaleFactor: 1.1,
                                    style: const TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "\$${allRemixAblePizzas[page1CurrentIndex].halpPrice}",
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(color: Colors.black.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    allRemixAblePizzas[page2CurrentIndex].name,
                                    textScaleFactor: 1.1,
                                    style: const TextStyle(
                                        color: Colors.black, fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "\$${allRemixAblePizzas[page2CurrentIndex].halpPrice}",
                                    textScaleFactor: 1.3,
                                    style:
                                        TextStyle(color: Colors.black.withOpacity(0.7)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                )),
            Positioned(
                left: 20,
                right: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        final randomNumber1 = Random().nextInt(allRemixAblePizzas.length);
                        final randomNumber2 = Random().nextInt(allRemixAblePizzas.length);
                        page1Controller.animateToPage(randomNumber1,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.ease);
                        page2Controller.animateToPage(randomNumber2,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.ease);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            border: Border.all(
                                color: Colors.black.withOpacity(0.6), width: 2),
                            image: const DecorationImage(
                                image: AssetImage('assets/other_icons/dice.png'))),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: h * 0.08,
                          child: Center(
                            child: Text(
                              page1CurrentIndex == page2CurrentIndex
                                  ? "\$${allRemixAblePizzas[page2CurrentIndex].fullPrice}"
                                  : "\$${allRemixAblePizzas[page1CurrentIndex].halpPrice + allRemixAblePizzas[page2CurrentIndex].halpPrice}",
                              textScaleFactor: 3.0,
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        Expanded(
                          child: Container(
                            height: h * 0.08,
                            decoration: const BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: const Center(
                              child: Text(
                                "Add to Cart",
                                textScaleFactor: 1.8,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
