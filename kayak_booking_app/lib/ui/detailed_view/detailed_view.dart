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
  late PageController pageController;
  late ValueNotifier<double> pageValue;

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
                  // again this needs to be a stack because Hero widgets cant have hero ancestors
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
                        return ValueListenableBuilder<double>(
                          valueListenable: pageValue,
                          builder: (context, value, child) {
                            return Center(
                              child: Opacity(
                                opacity: (pageValue.value + 1 - currentKayakIndex.value).clamp(0, 1),
                                child: Hero(
                                  tag: kayaks[currentKayakIndex.value].image,
                                  // Hero flight builder
                                  // we use this to modify the hero transition
                                  flightShuttleBuilder: (_, animation, flightDirection, ___, ____) {
                                    return AnimatedBuilder( 
                                      animation: animation,
                                      builder: (context, child) {
                                        /// simply we, take the image and undo the rotation by slowlly multiply it with a dimnishing value 1 --> 0.
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
                                  child: SimpleShadow(
                                    opacity: 0.3,
                                    color: Colors.black,
                                    offset: const Offset(-15, 10),
                                    child: Image.asset(
                                      kayaks[currentKayakIndex.value].image,
                                      alignment: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
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
