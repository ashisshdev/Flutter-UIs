import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app_login_screen/dummy_data/data.dart';
import 'package:travel_app_login_screen/models/hotel.dart';

class DummyTravelApp extends StatefulWidget {
  const DummyTravelApp({super.key});

  @override
  State<DummyTravelApp> createState() => _DummyTravelAppState();
}

class _DummyTravelAppState extends State<DummyTravelApp> {
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
                              child: SizedBox(
                            child: Text(
                              "What you would like to find?",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                          const SizedBox(width: 10),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondary,
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
                elevation: 0,
                toolbarHeight: 120,
                flexibleSpace: Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 10),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0;
                              i < _icons.length;
                              i++) ...{
                            InkWell(
                              onTap: () {
                                goToSection(i);
                              },
                              child: Container(
                                  padding:
                                      const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: iconSelected == i
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : const Color(
                                            0xFFE7EBEE),
                                  ),
                                  child: Icon(
                                    _icons[i],
                                    color: i == iconSelected
                                        ? Theme.of(context)
                                            .primaryColor
                                        : const Color(
                                            0xFFB4C1C4),
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
            child: SingleChildScrollView(
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
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Top Destinations",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight:
                                          FontWeight.bold),
                                ),
                                Text(
                                  "See All",
                                  textScaleFactor: 1.1,
                                  style: TextStyle(
                                      color: Colors.blue),
                                )
                              ],
                            ),
                          )),

                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          height: 300,
                          width:
                              MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              itemCount: myDestinations.length,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              physics:
                                  const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Card(
                                  shadowColor: Colors.black45,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(
                                              20)), //<--custom shape

                                  elevation: 2,
                                  child: SizedBox(
                                      width: 200,
                                      child: Container(
                                        padding:
                                            const EdgeInsets.all(
                                                5),
                                        decoration:
                                            const BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(
                                                  Radius
                                                      .circular(
                                                          20)),
                                        ),
                                        child: Column(
                                          children: [
                                            /// Image and name
                                            Container(
                                              height: 200,
                                              width: 200,
                                              padding:
                                                  const EdgeInsets
                                                          .only(
                                                      top: 150),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          myDestinations[index]
                                                              .imageUrl),
                                                      fit: BoxFit
                                                          .cover),
                                                  borderRadius:
                                                      const BorderRadius
                                                              .all(
                                                          Radius.circular(
                                                              20))),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets
                                                            .only(
                                                        left: 10,
                                                        bottom:
                                                            9),
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    gradient: LinearGradient(
                                                        begin: Alignment
                                                            .topCenter,
                                                        end: Alignment.bottomCenter,
                                                        colors: [
                                                          Colors
                                                              .transparent,
                                                          Colors
                                                              .black
                                                        ])),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      myDestinations[
                                                              index]
                                                          .city,
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold,
                                                          fontSize:
                                                              20,
                                                          color:
                                                              Colors.white),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Icon(
                                                          FontAwesomeIcons
                                                              .locationArrow,
                                                          size:
                                                              15,
                                                          color:
                                                              Colors.white,
                                                        ),
                                                        Text(
                                                          "  ${myDestinations[index].country}",
                                                          style: const TextStyle(
                                                              fontSize: 15,
                                                              color: Colors.white70),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),

                                            /// Details

                                            Padding(
                                              padding:
                                                  const EdgeInsets
                                                      .all(10.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                children: <
                                                    Widget>[
                                                  Text(
                                                    '${myDestinations[index].activities.length + 11} activities',
                                                    style:
                                                        const TextStyle(
                                                      fontSize:
                                                          22.0,
                                                      fontWeight:
                                                          FontWeight
                                                              .w600,
                                                      letterSpacing:
                                                          1.2,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    myDestinations[
                                                            index]
                                                        .description,
                                                    overflow:
                                                        TextOverflow
                                                            .ellipsis,
                                                    maxLines: 2,
                                                    style:
                                                        const TextStyle(
                                                      color: Colors
                                                          .grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              }),
                        ),
                      ),
                      // ScrollingParallaxCards(destinations: myDestinations),

                      InkWell(
                          onTap: () {
                            // Go to All Popular Destinations Page
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, right: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Exclusive Hotels",
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight:
                                          FontWeight.bold),
                                ),
                                Text(
                                  "See All",
                                  textScaleFactor: 1.1,
                                  style: TextStyle(
                                      color: Colors.blue),
                                )
                              ],
                            ),
                          )),

                      SizedBox(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: DummyScrollingHotelsCards(
                            hotels: myHotels),
                      ),

                      // InkWell(
                      //   onTap: () {
                      //     // Go to Exciting Activities Page
                      //   },
                      //   child: const SectionTitle(
                      //     title: "Exciting Activities",
                      //   ),
                      // ),
                      // Container(
                      //   margin:
                      //       const EdgeInsets.only(bottom: 20),
                      //   color: Colors.blue,
                      //   height: 300,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     // Go to Famous Sights Page
                      //   },
                      //   child: const SectionTitle(
                      //     title: "Famous Sights",
                      //   ),
                      // ),
                      // Container(
                      //   margin:
                      //       const EdgeInsets.only(bottom: 20),
                      //   color: Colors.yellow,
                      //   height: 300,
                      // ),
                      Container(
                        margin:
                            const EdgeInsets.only(bottom: 20),
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// List<IconData> _icons = [
//   FontAwesomeIcons.plane,
//   FontAwesomeIcons.bed,
//   FontAwesomeIcons.streetView,
//   FontAwesomeIcons.personBiking,
// ];

List<IconData> _icons = [
  FontAwesomeIcons.compass,
  FontAwesomeIcons.plane,
  FontAwesomeIcons.bed,
  FontAwesomeIcons.streetView,
  FontAwesomeIcons.personBiking,
];

class DummyScrollingHotelsCards extends StatefulWidget {
  final List<Hotel> hotels;

  const DummyScrollingHotelsCards({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  @override
  State<DummyScrollingHotelsCards> createState() =>
      _ScrollingHotelCardsState();
}

class _ScrollingHotelCardsState
    extends State<DummyScrollingHotelsCards> {
  late PageController pageController;
  bool pageHaveDimentions = false;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.95);

    pageHaveDimentions
        ? null
        : WidgetsBinding.instance.addPostFrameCallback((_) {
            Future.delayed(const Duration(seconds: 2)).then((_) {
              setState(() {
                pageHaveDimentions = true;
              });
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: MediaQuery.of(context).size.width,
      child: PageView.builder(
          padEnds: false,
          controller: pageController,
          itemCount: widget.hotels.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final hotel = widget.hotels[index];
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: pageHaveDimentions
                  ? AnimatedBuilder(
                      animation: pageController,
                      builder: (context, _) {
                        return DummyHotelCard(
                          hotel: hotel,
                          xFactor: -pageController.page!.abs() +
                              index,
                        );
                      },
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: const Text(
                        'Shimmer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
            );
          }),
    );
  }
}

// HOtels
class DummyHotelCard extends StatelessWidget {
  final Hotel hotel;
  final double xFactor;

  const DummyHotelCard({
    Key? key,
    required this.hotel,
    required this.xFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
            image: AssetImage(
              hotel.imageUrl,
            ),
            fit: BoxFit.cover,
            alignment: Alignment(xFactor * 5, 0)),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(top: 165),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black12, Colors.black])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  hotel.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  hotel.address,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              "\$${hotel.price}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
