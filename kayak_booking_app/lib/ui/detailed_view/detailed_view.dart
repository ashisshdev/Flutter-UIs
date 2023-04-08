import 'package:flutter/material.dart';
import 'package:kayak_booking_app/data/dummy_data.dart';
import 'package:simple_shadow/simple_shadow.dart';

class DetailedView extends StatefulWidget {
  final int index;

  const DetailedView({super.key, required this.index});

  @override
  State<DetailedView> createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView> {
  late ValueNotifier<int> currentKayakIndex;
  late ValueNotifier<double> pageValue;
  late PageController pageController;

  @override
  void initState() {
    currentKayakIndex = ValueNotifier(widget.index);
    pageValue = ValueNotifier(widget.index.toDouble());
    pageController = PageController(initialPage: currentKayakIndex.value)
      ..addListener(() {
        pageValue.value = pageController.page ?? 0.0;
      });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, 4);
        return Future(() => false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Hero(
                      tag: kayaks[currentKayakIndex.value].color,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: h / 1.5,
                        width: w,
                        decoration: BoxDecoration(
                            color: kayaks[currentKayakIndex.value].color.withOpacity(0.9),
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: h * 0.05,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          Hero(
                            tag: kayaks[currentKayakIndex.value].name,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(kayaks[currentKayakIndex.value].name,
                                  textScaleFactor: 2.0, style: const TextStyle(color: Colors.white)),
                            ),
                          ),
                          Container(
                            width: w * 0.35,
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                            decoration: const BoxDecoration(
                                color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: kayaks[currentKayakIndex.value].color,
                                ),
                                const Text(
                                  '1',
                                  textScaleFactor: 1.5,
                                ),
                                Icon(
                                  Icons.add,
                                  color: kayaks[currentKayakIndex.value].color,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: h * 0.25,
                    height: h * 0.65,
                    child: Center(
                        child: PageView.builder(
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      onPageChanged: (value) {
                        setState(() {
                          currentKayakIndex.value = value;
                        });
                      },
                      itemCount: kayaks.length,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Hero(
                              tag: kayaks[currentKayakIndex.value].image,
                              flightShuttleBuilder: (_, animation, flightDirection, ___, ____) {
                                return AnimatedBuilder(
                                  animation: animation,
                                  builder: (context, child) {
                                    return Transform.rotate(
                                      angle: -.9 * (1 - animation.value),
                                      alignment: Alignment.center,
                                      child: child,
                                    );
                                  },
                                  child: SimpleShadow(
                                    opacity: 0.3,
                                    color: Colors.black,
                                    offset: const Offset(-15, 10),
                                    child: Image.asset(
                                      kayaks[currentKayakIndex.value].image,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                );
                              },
                              child: ValueListenableBuilder(
                                valueListenable: pageValue,
                                builder: (context, value, child) {
                                  print("opacity = ${index - pageValue.value}");
                                  print("index = $index");
                                  print("pagevalue = ${pageValue.value}");

                                  final child = Opacity(
                                    opacity: (index - pageValue.value),
                                    child: SimpleShadow(
                                      opacity: 0.3,
                                      color: Colors.black,
                                      offset: const Offset(-15, 10),
                                      child: Image.asset(
                                        kayaks[index].image,
                                        alignment: Alignment.topCenter,
                                      ),
                                    ),
                                  );

                                  // upcoming boat
                                  if (index == pageValue.value.floor() + 1) {
                                    return Transform.translate(
                                      offset: Offset(0.0, -h * 0.6 * (index - pageValue.value)),
                                      child: child,
                                    );
                                  }
                                  // previous boat
                                  else if (index == pageValue.value.floor() - 1) {
                                    return Transform.translate(
                                      offset: Offset(0.0, h * 0.6 * (pageValue.value - index)),
                                      child: child,
                                    );
                                  }
                                  // current boat
                                  else {
                                    return child;
                                  }
                                },
                              )),
                        );
                      },
                    )),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
