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
    setState(() {
      // iconSelected = index;
      // TODO
      // ///      controller. move position
    });
  }

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(left: 10),
          controller: controller,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 50),
                child: HomePageTopText()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                                  ? Theme.of(context)
                                      .colorScheme
                                      .secondary
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
            InkWell(
              onTap: () {
                // TODO : Go to All Popular Destinations Page
              },
              child: const SectionTitle(
                title: "Top Destinations",
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
                // TODO : Go to All Hotels Page
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
                // TODO : Go to Exciting Activities Page
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
                // TODO : Go to Famous Sights Page
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
      ),
    );
  }
}

List<IconData> _icons = [
  FontAwesomeIcons.plane,
  FontAwesomeIcons.bed,
  FontAwesomeIcons.streetView,
  FontAwesomeIcons.personBiking,
];
