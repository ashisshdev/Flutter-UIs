import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_ticket_booking_app/models/movie.dart';
import 'package:movie_ticket_booking_app/screens/movie_booking/movie_booking_screen.dart';
import 'package:movie_ticket_booking_app/screens/movie_details/movie_detail_screen_widgets.dart';
import 'package:movie_ticket_booking_app/utils/theme/app_color.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Movie Detail",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Row(
                children: [
                  Expanded(
                    child: Hero(
                      tag: movie.assetImage,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(
                              movie.assetImage,
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MovieInfoWidget(
                        iconData: Icons.videocam_rounded,
                        title: "Genre",
                        value: movie.type,
                      ),
                      MovieInfoWidget(
                        iconData: Icons.access_time_filled_rounded,
                        title: "Duration",
                        value: movie.duration,
                      ),
                      MovieInfoWidget(
                        iconData: Icons.stars_rounded,
                        title: "Rating",
                        value: movie.rating,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            SlideAndFadeElements(
              child: Text(
                movie.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const Divider(height: 32),
            SlideAndFadeElements(
              child: Text(
                "Synopsis",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 8),
            SlideAndFadeElements(
              child: Text(
                movie.synopsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MovieBookingScreen(
                    movie: movie,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Text(
            "Booking Now",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
