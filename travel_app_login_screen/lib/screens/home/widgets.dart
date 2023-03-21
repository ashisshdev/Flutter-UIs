import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app_login_screen/dummy_data/data.dart';
import 'package:travel_app_login_screen/models/destination.dart';
import 'package:travel_app_login_screen/models/hotel.dart';

// What you would like to find
class HomePageTopText extends StatelessWidget {
  const HomePageTopText({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text(
        "What you would like to find?",
        maxLines: 2,
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// Top Destinations / Exclusive Hotels / Exciting Activities / Famous Sights
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, right: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const Text(
            "See All",
            textScaleFactor: 1.1,
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}


class ScrollingTopDestinations extends StatefulWidget {
  const ScrollingTopDestinations({super.key});

  @override
  ScrollingTopDestinationsState createState() => ScrollingTopDestinationsState();
}

class ScrollingTopDestinationsState extends State<ScrollingTopDestinations> {
  final List<Destination> _list = topDestinations;

  late PageController pageController;

  double viewportFraction = 0.95;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: viewportFraction)
      ..addListener(() {
        setState(() {
          pageOffset = pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      itemCount: _list.length,
      itemBuilder: (context, index) {
        // to scale the image in forcus and downscale others
        // double scale =
        //     max(viewportFraction, (1 - (pageOffset - index).abs()) + viewportFraction);

        double angle = (pageOffset - index).abs();

        if (angle > 0.5) {
          angle = 1 - angle;
        }
        return Container(
          padding: const EdgeInsets.only(
            right: 10,
            top: 10,
            // top: 100 - scale * 25,
            bottom: 10,
          ),
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(
                3,
                2,
                0.001,
              )
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    _list[index].imageUrl,
                    width: MediaQuery.of(context).size.width,
                    // for parallax, image fir should be BoxFit.none and images should be wide
                    fit: BoxFit.cover,
                    //alignemnt for parallax effect
                    alignment: Alignment((pageOffset - index).abs() * 0.5, 0),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 20,
                  child: AnimatedOpacity(
                    opacity: angle == 0 ? 1 : 0,
                    duration: const Duration(
                      milliseconds: 100,
                    ),
                    child: Text(
                      _list[index].country,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// For Top Destinations
class ScrollingDestinationCards extends StatelessWidget {
  final List<Destination> destinationsList;
  const ScrollingDestinationCards({super.key, required this.destinationsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: destinationsList.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.black45,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)), //<--custom shape

            elevation: 2,
            child: SizedBox(
              width: 200,
              child: DestinationCardTile(destination: destinationsList[index]),
            ),
          );
        });
  }
}

// Destinations
class DestinationCardTile extends StatelessWidget {
  final Destination destination;

  const DestinationCardTile({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          /// Image and name
          Container(
            height: 200,
            width: 200,
            padding: const EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(destination.imageUrl), fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 9),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.city,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 15,
                        color: Colors.white,
                      ),
                      Text(
                        "  ${destination.country}",
                        style: const TextStyle(fontSize: 15, color: Colors.white70),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          /// Details

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${destination.activities.length + 11} activities',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  destination.description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// For Exclusive Hotels
class ScrollingHotelsCards extends StatefulWidget {
  final List<Hotel> hotels;

  const ScrollingHotelsCards({
    Key? key,
    required this.hotels,
  }) : super(key: key);

  @override
  State<ScrollingHotelsCards> createState() => _ScrollingHotelCardsState();
}

class _ScrollingHotelCardsState extends State<ScrollingHotelsCards> {
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
                        return HotelCard(
                          hotel: hotel,
                          xFactor: -pageController.page!.abs() + index,
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
class HotelCard extends StatelessWidget {
  final Hotel hotel;
  final double xFactor;

  const HotelCard({
    Key? key,
    required this.hotel,
    required this.xFactor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
                      color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  hotel.address,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Text(
              "\$${hotel.price}",
              style: const TextStyle(
                  color: Colors.white, fontSize: 25, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
