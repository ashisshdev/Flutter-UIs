import 'package:donation_app/ui/screens/home/international/international.dart';
import 'package:flutter/material.dart';

import 'local/local.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late ValueNotifier<int> selectedTab;
  late PageController pageController;

  @override
  void initState() {
    selectedTab = ValueNotifier<int>(0);
    pageController = PageController(initialPage: selectedTab.value, keepPage: true);
    super.initState();
  }

  changeTab(int index, [bool cameFromPageView = false]) {
    if (selectedTab.value != index) {
      selectedTab.value = index;
      if (cameFromPageView == false) {
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            /// tab View
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              height: 65,
              width: w,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.all(7),
              child: ValueListenableBuilder(
                valueListenable: selectedTab,
                builder: (context, value, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            changeTab(0);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: value == 0 ? Colors.white : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15))),
                            alignment: Alignment.center,
                            child: Text(
                              "Local",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight:
                                      value == 0 ? FontWeight.w600 : FontWeight.w500,
                                  letterSpacing: 0.6),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            changeTab(1);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: value == 1 ? Colors.white : Colors.transparent,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "International",
                              textScaleFactor: 1.3,
                              style: TextStyle(
                                  fontWeight:
                                      value == 1 ? FontWeight.w600 : FontWeight.w500,
                                  letterSpacing: 0.6),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const StartNewCause1(),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  changeTab(value, true);
                },
                controller: pageController,
                scrollDirection: Axis.horizontal,
                children: const [Local(), International()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




