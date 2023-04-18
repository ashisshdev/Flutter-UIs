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
    page1Controller =
        PageController(initialPage: page1CurrentIndex, viewportFraction: 0.35)
          ..addListener(() {
            page1PageValue = page1Controller.page ?? 0.0;
          });
    page2Controller =
        PageController(initialPage: page2CurrentIndex, viewportFraction: 0.35)
          ..addListener(() {
            page2PageValue = page2Controller.page ?? 0.0;
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.black,
          ),
          Expanded(
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
                // padEnds: false,
                itemCount: allPizzaImages.length,
                itemBuilder: (context, index) {
                  // final delta = (page1PageValue - index + 1).abs();

                  return Opacity(
                    opacity: index == page1CurrentIndex ? 1 : 0.5,
                    child: Container(
                      // color: index == page1CurrentIndex ? Colors.red : Colors.black,
                      margin: index == page1PageValue
                          ? const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 1)
                          : const EdgeInsets.only(left: 55, top: 5, bottom: 5, right: 1),
                      padding: index == page1PageValue.floor()
                          ? EdgeInsets.zero
                          : const EdgeInsets.only(left: 40, top: 40, bottom: 40),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            right: -150,
                            top: 0,
                            left: 10,
                            bottom: 0,
                            child: Image.asset(
                              allPizzaImages[index],
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
                // padEnds: false,
                itemCount: allPizzaImages.length,
                itemBuilder: (context, index) {
                  // return Container(
                  //   color: index == page2CurrentIndex ? Colors.red : Colors.black,
                  //   margin: index == page2CurrentIndex
                  //       ? const EdgeInsets.only(left: 1, top: 5, bottom: 5, right: 15)
                  //       : const EdgeInsets.only(left: 1, top: 5, bottom: 5, right: 35),
                  // );
                  return Container(
                    color: Colors.green,
                  );
                },
              ))
            ],
          ))
        ],
      ),
    );
  }
}
