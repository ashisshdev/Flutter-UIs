import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_ticket_booking_app/data/dummy_data.dart';
import 'package:movie_ticket_booking_app/models/movie.dart';
import 'package:movie_ticket_booking_app/screens/movie_booking/movie_booking_screen.dart';

class MoviesThisFriday extends StatefulWidget {
  const MoviesThisFriday({super.key, required this.initialIndex});
  final int initialIndex;

  @override
  State<MoviesThisFriday> createState() => _MoviesThisFridayState();
}

class _MoviesThisFridayState extends State<MoviesThisFriday> {
  late PageController pageController;
  int currentIndex = 0;
  double pageValue = 0.0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    pageValue = widget.initialIndex.toDouble();

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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MovieBookingScreen(
                                      movieImage: thisFridayMovies[index].image,
                                      movieTitle: thisFridayMovies[index].name,
                                    )));
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
  final MovieModel movie;
  const MoviePoster(this.movie, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 250, 8.0, 0.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(
                0.08,
              ),
              blurRadius: 4.0),
        ],
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(32),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: Hero(
                tag: movie.image,
                child: AspectRatio(
                  aspectRatio: 27 / 40,
                  child: Image.asset(
                    movie.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Icon(
                Icons.star,
                size: 20,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
