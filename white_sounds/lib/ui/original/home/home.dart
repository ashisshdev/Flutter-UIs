import 'package:flutter/material.dart';
import 'package:white_sounds/ui/original/home/section1/section1.dart';
import 'package:white_sounds/ui/original/home/section2/section2.dart';
import 'package:white_sounds/utils/constants.dart';

class HomePageOriginal extends StatefulWidget {
  const HomePageOriginal({super.key});

  @override
  State<HomePageOriginal> createState() => _HomePageOriginalState();
}

class _HomePageOriginalState extends State<HomePageOriginal> {
  late PageController pageController;
  final int initialIndex = 0;
  late ValueNotifier<double> page;

  @override
  void initState() {
    super.initState();
    page = ValueNotifier<double>(initialIndex.toDouble());
    pageController = PageController(
      initialPage: initialIndex,
      viewportFraction: kPageViewPointFraction,
    )..addListener(() {
        /// the page value will always vary from 0.0 to kPageViewPointFraction back and forth
        page.value = pageController.page ?? 0.0;
        // pageValue = pageController.page ?? 0.0;
      });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: PageView(
            controller: pageController,
            padEnds: false,
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.3)),
                child: ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, value, child) {
                    return Section1(pageValue: value);
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.3),
                ),
                child: ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, value, child) {
                    return Section2(pageValue: value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
