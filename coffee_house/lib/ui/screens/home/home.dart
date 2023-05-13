import 'package:coffee_house/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

List<String> sections = ["Black GOld", 'Cold Brew', 'Nescafe', 'McCafe', "Gold Brew"];

class _HomePageState extends State<HomePage> {
  // final colorPalette = ColorPalette();

  final _selectedOption = 0;

  // List allOptions = [BlackGold(), ColdBrew(), Nescafe(), McCafe(), GoldBrew()];

  int selectedIndex = 0;

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
            Expanded(
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
                destinations: sections
                    .map((e) => NavigationRailDestination(
                        icon: const Icon(null),
                        label: RotatedBox(
                          quarterTurns: 3,
                          child: Column(
                            children: [
                              e == sections[selectedIndex]
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
                              Text(
                                e,
                                textScaleFactor: 1.7,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: e == sections[selectedIndex] ? titleColor : titleColor.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        )))
                    .toList(),
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
                      )
                    ];
                  },
                  body: ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.only(bottom: 35),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const CoffeeItemCard();
                      // return Container(
                      //   height: 100,
                      //   width: 100,
                      //   color: Colors.red,
                      //   margin: const EdgeInsets.all(10),
                      //   child: const Text("HEHE"),
                      // );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeItemCard extends StatelessWidget {
  const CoffeeItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
        height: h * 0.4,
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
                  decoration: const BoxDecoration(
                    color: firstSlice,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/coffee/dooodle.png',
                      ),
                      fit: BoxFit.cover,
                      opacity: 0.05,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Price"),
                      const Text(
                        "\$12.5",
                        textScaleFactor: 3.0,
                      ),
                      const Spacer(),
                      const Text(
                        "Grandy's Gold Brew",
                        textScaleFactor: 2.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text("65 Reviews"),
                              Text("StarsStars"),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "+ Add",
                              textScaleFactor: 1.2,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: 20,
              right: 50,
              child: Image.asset(
                'assets/coffee/coffee1.png',
                height: h * 0.25,
              ),
            ),
          ],
        ));
  }
}
