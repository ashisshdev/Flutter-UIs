import 'package:flutter/material.dart';
import 'package:white_sounds/ui/mirror/home/section1mirror/section1mirror.dart';
import 'package:white_sounds/ui/mirror/home/section2mirror/section2mirror.dart';
import 'package:white_sounds/utils/constants.dart';

class HomeMirror extends StatefulWidget {
  const HomeMirror({super.key});

  @override
  State<HomeMirror> createState() => _HomeMirrorState();
}

class _HomeMirrorState extends State<HomeMirror> {
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
                    return Section2Mirror(pageValue: value);
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
                    return Section1Mirror(pageValue: value);
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
