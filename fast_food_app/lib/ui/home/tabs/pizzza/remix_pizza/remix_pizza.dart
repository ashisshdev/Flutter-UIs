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
                  // final delta = (page1PageValue - index).abs();

                  // final double scaleFactor =
                  //     max(0.6, (1 - (page1PageValue - index).abs() * 0.2));
                  // final bool isCurrentPage = page1PageValue == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    curve: Curves.easeInOut,
                    // transform: Matrix4.identity()
                    //   ..scale(isCurrentPage ? 1.0 : scaleFactor),
                    alignment: Alignment.centerRight,
                    child: Opacity(
                      opacity: page1PageValue.round() == index ? 1 : 0.3,
                      // opacity: isCurrentPage ? 1.0 : 0.5,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            right: -190,
                            top: 0,
                            left: 0,
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
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 0),
                    curve: Curves.easeInOut,
                    // transform: Matrix4.identity()
                    //   ..scale(isCurrentPage ? 1.0 : scaleFactor),
                    alignment: Alignment.centerRight,
                    child: Opacity(
                      opacity: page2PageValue.round() == index ? 1 : 0.3,
                      // opacity: isCurrentPage ? 1.0 : 0.5,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            right: 0,
                            top: 0,
                            left: -190,
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
              ))
            ],
          ))
        ],
      ),
    );
  }
}


// class MyPageView extends StatefulWidget {
//   const MyPageView({Key? key}) : super(key: key);

//   @override
//   _MyPageViewState createState() => _MyPageViewState();
// }

// class _MyPageViewState extends State<MyPageView> {
//   final PageController _pageController = PageController(viewportFraction: 3.5);
//   int _currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//     _pageController.addListener(() {
//       setState(() {
//         _currentPage = _pageController.page!.round();
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _pageController,
//       itemCount: itemCount,
//       itemBuilder: (BuildContext context, int index) {
//         final double scaleFactor = max(0.6, (1 - (_currentPage - index).abs() * 0.2));
//         final bool isCurrentPage = _currentPage == index;
//         return AnimatedContainer(
//           duration: Duration(milliseconds: 250),
//           curve: Curves.easeInOut,
//           transform: Matrix4.identity()
//             ..scale(isCurrentPage ? 1.0 : scaleFactor)
//             ..translate(isCurrentPage ? 0.0 : (50 * (_currentPage - index)).toDouble()),
//           child: Opacity(
//             opacity: isCurrentPage ? 1.0 : 0.5,
//             child: /* Your content widget here */,
//           ),
//         );
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
// }
