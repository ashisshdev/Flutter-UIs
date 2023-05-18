import 'package:coffee_house/ui/data/dummy_data.dart';
import 'package:coffee_house/ui/data/models.dart';
import 'package:coffee_house/ui/screens/details/details.dart';
import 'package:coffee_house/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

List<int> itemsBreakPoints = [0, 3, 5, 7, 9];

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  late ItemScrollController itemScrollController;
  late ItemPositionsListener itemPositionsListener;

  @override
  void initState() {
    super.initState();
    itemScrollController = ItemScrollController();
    itemPositionsListener = ItemPositionsListener.create()
      ..itemPositions.addListener(() {
        switch (itemPositionsListener.itemPositions.value.first.index) {
          case 0:
            setState(() {
              selectedIndex = 0;
            });
            break;
          case 3:
            setState(() {
              selectedIndex = 1;
            });
            break;
          case 5:
            setState(() => selectedIndex = 2);
            break;
          case 7:
            setState(() => selectedIndex = 3);
            break;
          case 9:
            setState(() => selectedIndex = 4);
            break;
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
  }

  moveToIndex(navigationRailIndex) {
    int index = itemsBreakPoints[navigationRailIndex];
    itemScrollController.scrollTo(index: index, duration: const Duration(seconds: 1), curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              flex: 1,
              child: NavigationRail(
                labelType: NavigationRailLabelType.all,
                leading: const Padding(
                  padding: EdgeInsets.only(top: 15, right: 8),
                  child: Icon(Icons.menu, size: 40),
                ),
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                destinations: [
                  for (int i = 0; i < sections.length; i++) ...[
                    NavigationRailDestination(
                        icon: const Icon(null),
                        label: RotatedBox(
                          quarterTurns: 3,
                          child: Column(
                            children: [
                              sections[i] == sections[selectedIndex]
                                  ? SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: Container(
                                        margin: const EdgeInsets.all(3.5),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: titleColor,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: 15,
                                      width: 15,
                                      padding: const EdgeInsets.all(7),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                              InkWell(
                                onTap: () {
                                  moveToIndex(i);
                                },
                                child: Text(
                                  sections[i],
                                  textScaleFactor: 1.7,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: sections[i] == sections[selectedIndex]
                                          ? titleColor
                                          : titleColor.withOpacity(0.6)),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ]
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      toolbarHeight: 80,
                      backgroundColor: Colors.white,
                      titleSpacing: 0,
                      elevation: 0,
                      expandedHeight: 170,
                      pinned: true,
                      actions: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10, bottom: 0),
                          child: Icon(
                            Icons.shopping_bag,
                            size: 40,
                            color: Colors.black,
                          ),
                        )
                      ],
                      flexibleSpace: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "CoffeeHouse",
                              textScaleFactor: 3.5,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverAppBar(
                      pinned: false,
                      snap: false,
                      floating: false,
                      leadingWidth: 0,
                      toolbarHeight: h * 0.04,
                      backgroundColor: Colors.white,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Text(
                          "A lot can happen over a coffee.",
                          textAlign: TextAlign.start,
                          textScaleFactor: 1,
                          style: TextStyle(color: titleColor.withOpacity(0.7)),
                        ),
                      ),
                    ),
                    SliverAppBar(
                      toolbarHeight: h * 0.12,
                      backgroundColor: Colors.white,
                      titleSpacing: 0,
                      elevation: 0,
                      pinned: true,
                      title: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: SizedBox(
                          height: h * 0.06,
                          child: TextField(
                            style: const TextStyle(fontSize: 24),
                            decoration: InputDecoration(
                                hintText: "Search...",
                                contentPadding: const EdgeInsets.only(left: 10),
                                hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                suffixIconColor: titleColor,
                                suffixIcon: const Icon(Icons.search, size: 35)),
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: ScrollablePositionedList.builder(
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  itemCount: allCoffees.length,
                  padding: const EdgeInsets.only(bottom: 35),
                  physics: const BouncingScrollPhysics(),
                  // physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CoffeeItemCard(
                      coffee: allCoffees[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeItemCard extends StatelessWidget {
  final Coffee coffee;
  const CoffeeItemCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(slideRoute(Details(coffee: coffee)));
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => Details(coffee: coffee),
        // ));
      },
      child: Container(
          height: h * 0.42,
          margin: const EdgeInsets.all(10),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: h * 0.27,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: coffee.cardColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/doodle.png',
                        ),
                        fit: BoxFit.cover,
                        opacity: 0.05,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Price",
                          textScaleFactor: 1.4,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "\$${coffee.price}",
                          textScaleFactor: 3.0,
                          style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          coffee.name,
                          textScaleFactor: 2.8,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          // style: TextStyle(ma),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${coffee.reviews}  review",
                                  textScaleFactor: 1.5,
                                  style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    for (int i = 0; i < int.parse(coffee.rating.toStringAsFixed(0)); i++) ...[
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 15,
                                      )
                                    ],
                                    for (int i = 0; i < 5 - int.parse(coffee.rating.toStringAsFixed(0)); i++) ...[
                                      const Icon(
                                        Icons.star,
                                        color: Colors.white54,
                                        size: 15,
                                      )
                                    ]
                                  ],
                                )
                                // Text("${coffee.rating} Stars"),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "+ Add",
                                textScaleFactor: 1.5,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
              Positioned(
                top: 0,
                right: 0,
                child: Hero(
                  tag: coffee.image,
                  child: Image.asset(
                    coffee.image,
                    fit: BoxFit.contain,
                    height: h * .28,
                    width: w * 0.45,
                    alignment: Alignment.bottomCenter,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// Route slideRoute(Widget child) {
//   print("haha");
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => child,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return child;
//     },
//   );
// }

Route slideRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(1, 0.0);
      const begin = Offset(0.0, 0.0);

      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
