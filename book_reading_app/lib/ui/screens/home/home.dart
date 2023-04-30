import 'package:book_reading_app/data/data.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

import 'home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<String> selectedCategory = ValueNotifier(categories[0]);
  ValueNotifier<int> bottomBarIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        appBar: const MyHomeAppBar(),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: const BoxDecoration(color: blackColor, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: ValueListenableBuilder(
            valueListenable: bottomBarIndex,
            builder: (context, value, child) {
              return BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: mainColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 30,
                currentIndex: value,
                onTap: (index) {
                  bottomBarIndex.value = index;
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(IconsaxOutline.home), label: "Home", activeIcon: Icon(IconsaxBold.home)),
                  BottomNavigationBarItem(icon: Icon(IconsaxOutline.play), label: "Listen", activeIcon: Icon(IconsaxBold.play)),
                  BottomNavigationBarItem(icon: Icon(IconsaxOutline.bookmark), label: "Bookmarks", activeIcon: Icon(IconsaxBold.bookmark)),
                  BottomNavigationBarItem(icon: Icon(IconsaxOutline.user), label: "Profile", activeIcon: Icon(IconsaxBold.user)),
                ],
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: h * 0.145,
                child: const WeeklyGoalWidget(),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: const SectionTile(
                  title: "For you",
                  showArrow: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: w,
                height: h * 0.06,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ValueListenableBuilder(
                      valueListenable: selectedCategory,
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            selectedCategory.value = categories[index];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              color: categories[index] == value ? blackColor : Colors.grey.shade200,
                            ),
                            margin: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                              categories[index],
                              style: TextStyle(
                                  fontWeight: categories[index] == value ? FontWeight.w600 : FontWeight.w400,
                                  color: categories[index] == value ? Colors.white : blackColor),
                            )),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                height: h * 0.25,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: allBooks.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: w * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey,
                          image: DecorationImage(image: AssetImage(allBooks[index].image), fit: BoxFit.cover)),
                      margin: const EdgeInsets.all(5),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: const SectionTile(
                  title: "Continue Reading",
                  showArrow: false,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: h * .20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  // color: Colors.green,
                ),
                clipBehavior: Clip.hardEdge,
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        height: h * 0.16,
                        left: 0,
                        right: 0,

                        /// the main color background widget
                        child: ClipPath(
                          clipper: ContinueReadingCardClipper(),
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: mainColor,
                            ),
                          ),
                        )),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      child: Container(
                        height: h * 0.18,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          // border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              // padding: const EdgeInsets.symmetric(horizontal: 20),
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                // image: DecorationImage(image: AssetImage(allBooks[4].image)),
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset(
                                allBooks[3].image,
                                width: w * 0.25,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(height: h * .18),
            ],
          ),
        ));
  }
}

class ContinueReadingCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //declared the variavles
    double h = size.height;
    double w = size.width;
    // created a path
    var p = Path()

      /// move to top left corner
      ..moveTo(0, 0)

      /// line to 30% of width
      ..lineTo(w * .30, 0)

      ///make 1st arc
      ..arcToPoint(Offset(w * .33, h * .1), radius: Radius.circular(h * .2), clockwise: true)

      /// make second arcd
      ..arcToPoint(Offset(w * .36, h * .2), radius: Radius.circular(h * .2), clockwise: false)

      /// continue making line
      ..lineTo(w, h * .2)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    return p;

    /// Note : Rounded corners are handled by child container of this clipper
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
