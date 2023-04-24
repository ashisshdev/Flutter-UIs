import 'package:flutter/material.dart';
import 'package:white_sounds/ui/home/section1/section1.dart';
import 'package:white_sounds/ui/home/section2/section2.dart';
import 'package:white_sounds/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        setState(() {
          /// the page value will always vary from 0.0 to kPageViewPointFraction back and forth
          page.value = pageController.page ?? 0.0;
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          child: PageView(
            controller: pageController,
            padEnds: false,
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black, width: 0.3)),
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
