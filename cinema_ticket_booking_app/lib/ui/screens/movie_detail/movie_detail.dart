import 'package:animations/animations.dart';
import 'package:cinema_ticket_booking_app/data/data.dart';
import 'package:cinema_ticket_booking_app/ui/screens/book_seat/book_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MovieDetailScreen extends StatefulWidget {
  final int index;

  const MovieDetailScreen({super.key, required this.index});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late PageController pageController;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark, statusBarColor: Colors.transparent));
    pageController = PageController(viewportFraction: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentMovie = thisFridayMovies[widget.index];
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: h * 0.35,
              width: w,
              color: Colors.black,
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                child: Hero(
                  tag: currentMovie.image,
                  child: Image.asset(
                    currentMovie.image,
                    width: w,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.5, end: 1.0),
              curve: Curves.ease,
              duration: const Duration(milliseconds: 300),
              builder: (context, value, child) {
                return Container(
                  height: value * h * 0.7,
                  width: w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(30), left: Radius.circular(30)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 50),
                      child: Column(
                        children: [
                          Hero(
                            tag: currentMovie.name,
                            child: FittedBox(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: Text(
                                        currentMovie.name,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Wrap(
                                    direction: Axis.horizontal,
                                    alignment: WrapAlignment.center,
                                    children: List.generate(
                                      currentMovie.genre.length,
                                      (index) => FittedBox(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 2, vertical: 1),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              border: Border.all(
                                                  color: Colors.grey.shade400, width: 1)),
                                          child: Center(
                                              child: Material(
                                            type: MaterialType.transparency,
                                            child: Text(
                                              currentMovie.genre[index],
                                              textScaleFactor: 0.9,
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                  tag: currentMovie.rating,
                                  child: Material(
                                    type: MaterialType.transparency,
                                    child: Text(
                                        "${(currentMovie.rating / 2).floorToDouble()}  "),
                                  )),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  5,
                                  (index) => TweenAnimationBuilder(
                                    tween: Tween<double>(begin: 1, end: 0),
                                    duration: Duration(milliseconds: 200 + 100 * index),
                                    curve: Curves.easeOutBack,
                                    builder: (context, value, child) {
                                      return Transform.translate(
                                        offset: Offset(0, value * 300),
                                        child: child,
                                      );
                                    },
                                    child: Hero(
                                      tag:
                                          "${thisFridayMovies[widget.index].name}stars$index",
                                      child: const Icon(
                                        Icons.star,
                                        size: 20,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          SlideAndFadeElements(
                              child: Text("Director / ${currentMovie.director}")),
                          const SizedBox(height: 30),
                          SlideAndFadeElements(
                            child: SizedBox(
                              width: w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      "Actors",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      padding: EdgeInsets.zero,
                                      child: Row(
                                        children: currentMovie.castList
                                            .map((e) => Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      vertical: 15, horizontal: 5),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 110,
                                                        width: 110,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                const BorderRadius.all(
                                                                    Radius.circular(15)),
                                                            image: DecorationImage(
                                                                image:
                                                                    AssetImage(e.image))),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      SizedBox(
                                                          width: 100,
                                                          child: FittedBox(
                                                              child: Text(e.name))),
                                                      //                                                    Text("(${e.role})"),
                                                    ],
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20),
                                    child: Text(
                                      "Movie Plot",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    child: Text(
                                      currentMovie.description + currentMovie.description,
                                      textScaleFactor: 1.3,
                                      style: const TextStyle(
                                          height: 1.3, color: Colors.black45),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            left: 20,
            child: InkWell(
              onTap: () {
                // Navigator.of(context).push(
                //   // MaterialPageRoute(
                //   //   builder: (context) => MovieBookingScreen(
                //   //       movieTitle: currentMovie.name,
                //   //       movieImage: currentMovie.image))

                //   MyCustomAnimatedRoute(
                //     enterWidget: MovieBookingScreen(
                //         movieTitle: currentMovie.name, movieImage: currentMovie.image),
                //   ),
                // );
              },
              child: OpenContainer(
                transitionType: ContainerTransitionType.fade,
                transitionDuration: const Duration(seconds: 1),
                openBuilder: (context, _) => MovieBookingScreen(
                    movieTitle: currentMovie.name, movieImage: currentMovie.image),
                openColor: Colors.black,
                closedElevation: 0,
                closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: const BorderSide(color: Colors.white, width: 1)),
                closedColor: Colors.black,
                closedBuilder: (context, _) => Container(
                  width: 200,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Book Tickets',
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SlideAndFadeElements extends StatelessWidget {
  final Widget child;
  const SlideAndFadeElements({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0.0, end: 1),
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 500),
            tween: Tween<Offset>(begin: const Offset(0, 200), end: const Offset(0, 0)),
            builder: (context, value, child) {
              return Transform.translate(offset: value, child: child);
            },
            child: child,
          ),
        );
      },
    );
  }
}

class MyCustomAnimatedRoute extends PageRouteBuilder {
  final Widget enterWidget;

  MyCustomAnimatedRoute({required this.enterWidget})
      : super(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) => enterWidget,
          transitionDuration: const Duration(milliseconds: 1500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation = CurvedAnimation(
                parent: animation,
                curve: Curves.fastLinearToSlowEaseIn,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
                alignment: const Alignment(0.0, 0.87), scale: animation, child: child);
          },
        );
}
