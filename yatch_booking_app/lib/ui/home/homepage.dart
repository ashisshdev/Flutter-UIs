import 'package:flutter/material.dart';
import 'package:yatch_booking_app/data/dummy_data.dart';
import 'package:yatch_booking_app/models/boat_model.dart';
import 'package:yatch_booking_app/ui/details/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  double page = 0.0;

  @override
  void initState() {
    _pageController.addListener(_listenScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_listenScroll);
    _pageController.dispose();
    super.dispose();
  }

  void _listenScroll() {
    setState(() {
      page = _pageController.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(
        top: 70,
        left: 20,
        right: 20,
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            top: 0,
            child: SizedBox(
              width: size.width,
              child: const Text(
                "Boats",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width,
            height: size.height - 110,
            child: PageView.builder(
              controller: _pageController,
              itemCount: boatsData.length,
              itemBuilder: (BuildContext context, int index) {
                final percent = (page - index).abs().clamp(0.0, 1.0);
                final scale = (page - index).abs().clamp(0.0, 0.3);

                final opacity = percent.clamp(0.0, 0.6);

                final boat = boatsData[index];

                return Transform.scale(
                  scale: 1 - scale,
                  child: Opacity(
                    opacity: (1 - opacity),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailsPage(boat: boat)));
                      },
                      child: boatWidget(
                        boat: boat,
                        size: size,
                        onTap: () => () {},
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  Widget boatWidget({required Boat boat, required Size size, required Function onTap}) {
    return Container(
      width: size.width * .8,
      height: size.height * .8,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Hero(
            tag: boat.urlImage,
            child: Image.asset(
              boat.urlImage,
              width: size.width * .35,
              height: size.height * .6,
            ),
          ),
          Text(
            boat.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "By ${boat.by}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              onTap;
            },
            child: const Text(
              "SPEC >",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4540A4),
                letterSpacing: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
