import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app_login_screen/dummy_data/data.dart';
import 'package:travel_app_login_screen/screens/home/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int iconSelected = 0;
  goToSection(int index) {
    if (iconSelected != index) {
      iconSelected = index;
      setState(() {});
    } else {}
  }

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                pinned: false,
                floating: false,
                toolbarHeight: 115,
                flexibleSpace: Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                      ),
                      Row(
                        children: [
                          const Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: HomePageTopText(),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 40,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                backgroundColor: const Color(0xFFF3F5F7),
                pinned: true,
                elevation: 5,
                toolbarHeight: 100,
                flexibleSpace: Container(
                  margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child:
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      for (int i = 0; i < _icons.length; i++) ...{
                        InkWell(
                          onTap: () {
                            goToSection(i);
                          },
                          child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: iconSelected == i
                                    ? Theme.of(context).colorScheme.secondary
                                    : const Color(0xFFE7EBEE),
                              ),
                              child: Icon(
                                _icons[i],
                                color: i == iconSelected
                                    ? Theme.of(context).primaryColor
                                    : const Color(0xFFB4C1C4),
                              )),
                        )
                      },
                      const SizedBox(
                        width: 2,
                      ),
                    ]),
                  ),
                ),
              ),
            ];
          },
          body: SafeArea(
            child: IndexedStack(
              index: iconSelected,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView(
                        padding: const EdgeInsets.only(left: 10),
                        controller: controller,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () {
                              // Go to All Popular Destinations Page
                            },
                            child: const SectionTitle(
                              title: "Top Destinations",
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 470,
                              width: MediaQuery.of(context).size.width,
                              child: const ScrollingTopDestinations(),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Go to All Popular Destinations Page
                            },
                            child: const SectionTitle(
                              title: "Personalised for You",
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: ScrollingDestinationCards(
                                destinationsList: myDestinations,
                              ),
                            ),
                          ),
                          // ScrollingParallaxCards(destinations: myDestinations),

                          InkWell(
                            onTap: () {
                              // Go to All Hotels Page
                            },
                            child: const SectionTitle(
                              title: "Exclusive Hotels",
                            ),
                          ),

                          SizedBox(
                            height: 240,
                            width: MediaQuery.of(context).size.width,
                            child: ScrollingHotelsCards(hotels: myHotels),
                          ),

                          InkWell(
                            onTap: () {
                              // Go to Exciting Activities Page
                            },
                            child: const SectionTitle(
                              title: "Exciting Activities",
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            color: Colors.blue,
                            height: 300,
                          ),
                          InkWell(
                            onTap: () {
                              // Go to Famous Sights Page
                            },
                            child: const SectionTitle(
                              title: "Famous Sights",
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            color: Colors.yellow,
                            height: 300,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Placeholder(),
                const Placeholder(),
                const Placeholder(),
                const Placeholder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<IconData> _icons = [
  FontAwesomeIcons.compass,
  FontAwesomeIcons.plane,
  FontAwesomeIcons.bed,
  FontAwesomeIcons.streetView,
  FontAwesomeIcons.personBiking,
];
