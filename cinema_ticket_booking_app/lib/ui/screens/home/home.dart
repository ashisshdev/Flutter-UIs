import 'package:cinema_ticket_booking_app/data/data.dart';
import 'package:cinema_ticket_booking_app/model/movie.dart';
import 'package:cinema_ticket_booking_app/ui/screens/movie_detail/movie_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 0.8, initialPage: currentIndex)
      ..addListener(() {
        setState(() {
          pageValue = pageController.page!;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark, statusBarColor: Colors.transparent),
        child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Stack(
                  children: thisFridayMovies.reversed.map((movie) {
                    return ImageSlider(
                      pageValue: pageValue,
                      image: movie.image,
                      index: thisFridayMovies.indexOf(movie),
                    );
                  }).toList(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.transparent,
                          Colors.white24,
                          Colors.white54,
                          Colors.white70,
                          Colors.white
                        ])),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PageView.builder(
                    itemCount: thisFridayMovies.length,
                    controller: pageController,
                    onPageChanged: (index) {
                      currentIndex = index;
                    },
                    itemBuilder: (context, index) {
                      final Widget child = InkWell(
                          onTap: () {
                            Navigator.of(context).push(PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) {
                                final curvedAnimation = CurvedAnimation(
                                    parent: animation, curve: const Interval(0, 0.5));
                                return FadeTransition(
                                  opacity: curvedAnimation,
                                  child: MovieDetailScreen(index: index),
                                );
                              },
                            ));
                          },
                          child: MoviePoster(thisFridayMovies[index]));

                      /// Sliding the movie card in focus a little but up
                      if (index == pageValue.floor() + 1 ||
                          index == pageValue.floor() + 2) {
                        return Transform.translate(
                          offset: Offset(0.0, 100 * (index - pageValue)),
                          child: child,
                        );
                      } else if (index == pageValue.floor() ||
                          index == pageValue.floor() - 1) {
                        return Transform.translate(
                          offset: Offset(0.0, 100 * (pageValue - index)),
                          child: child,
                        );
                      } else {
                        return child;
                      }
                    },
                  ),
                ),
              ],
            )));
  }
}

class ImageSlider extends StatelessWidget {
  final int index;
  final String image;
  final double pageValue;

  const ImageSlider({
    Key? key,
    required this.index,
    required this.image,
    required this.pageValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ImageClipper(progress: getProgress()),
      child: Image.asset(
        image,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  double getProgress() {
    if (index == pageValue.floor()) {
      return 1.0 - (pageValue - index);
    } else if (index < pageValue.floor()) {
      return 0.0;
    } else {
      return 1.0;
    }
  }
}

class ImageClipper extends CustomClipper<Path> {
  ImageClipper({required this.progress});

  final double progress;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(
      Rect.fromLTRB(
        size.width - (size.width * progress),
        0,
        size.width,
        size.height,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class MoviePoster extends StatelessWidget {
  final Movie movie;
  const MoviePoster(this.movie, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 250, 8.0, 0.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 4.0),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(32),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio: 27 / 40,
                  child: Hero(
                    tag: movie.image,
                    child: Image.asset(
                      movie.image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Hero(
            tag: movie.name,
            child: FittedBox(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Material(
                      type: MaterialType.transparency,
                      child: Text(
                        movie.name,
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
                  SizedBox(
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: List.generate(
                        movie.genre.length,
                        (index) => FittedBox(
                          child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                border:
                                    Border.all(color: Colors.grey.shade400, width: 1)),
                            child: Center(
                                child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                movie.genre[index],
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
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: movie.rating,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text("${(movie.rating / 2).floorToDouble()}  "),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Hero(
                    tag: "${movie.name}stars$index",
                    child: const Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            ". . .",
            textScaleFactor: 1.5,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: BuyButtonWidget(),
          ),
        ],
      ),
    );
  }
}

class BuyButtonWidget extends StatelessWidget {
  const BuyButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 200,
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black54)),
          child: const Text(
            'View Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}
