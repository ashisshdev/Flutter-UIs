import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/screens/home/home_screen_widgets.dart';

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Welcome Dandi",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SectionTitleWidget(title: "Category"),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 24, vertical: 16),
                child: CategoryWidget(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: SectionTitleWidget(title: "Now Playing"),
              ),
              const SizedBox(height: 16),
              const NowPlayingMovieWidget(),
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
