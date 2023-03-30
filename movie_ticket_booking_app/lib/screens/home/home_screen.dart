import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/screens/home/home_screen_widgets.dart';
import 'package:movie_ticket_booking_app/screens/this_friday/this_friday_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Welcome Dandi",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Book your favorite Movie here!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: BannerWidget(),
              ),
              const SizedBox(height: 16),

              /// categories
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SectionTitleWidget(title: "Category"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: CategoryWidget(),
              ),

              /// now playing
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SectionTitleWidget(title: "Now Playing"),
              ),
              const SizedBox(height: 16),
              const NowPlayingMovieWidget(),



              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 20,
                  thickness: 2,
                ),
              ),

              /// this friday
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MoviesThisFriday(
                                initialIndex: 0,
                              )));
                    },
                    child:
                        const SectionTitleWidget(title: "This Friday at your Location")),
              ),
              const SizedBox(height: 16),
              const ThisFridayItems(),

              /// upcoming
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SectionTitleWidget(title: "Upcoming"),
              ),
              const SizedBox(height: 16),
              const UpcomingMovieWidget(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
