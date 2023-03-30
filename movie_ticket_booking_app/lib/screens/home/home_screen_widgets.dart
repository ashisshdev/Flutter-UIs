import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/data/dummy_data.dart';
import 'package:movie_ticket_booking_app/models/movie.dart';
import 'package:movie_ticket_booking_app/screens/movie_details/movie_details_screen.dart';
import 'package:movie_ticket_booking_app/screens/this_friday/this_friday_movies.dart';
import 'package:movie_ticket_booking_app/utils/theme/app_color.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int showedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: banners.length,
            options: CarouselOptions(
              initialPage: showedIndex,
              viewportFraction: 1,
              aspectRatio: 5 / 2.5,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  showedIndex = index;
                });
              },
            ),
            itemBuilder: (context, index, _) {
              return Image(
                image: AssetImage(
                  banners[index],
                ),
                fit: BoxFit.fill,
              );
            },
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Row(
              children: List.generate(
                banners.length,
                (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: showedIndex == index ? 24 : 10,
                    height: 10,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                      color: showedIndex == index
                          ? Theme.of(context).primaryColor
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key,
    required this.title,
    this.sufixText = "See all",
    this.onSufixClick,
  });

  final String title;
  final String sufixText;
  final void Function()? onSufixClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        InkWell(
          onTap: onSufixClick,
          child: Text(
            sufixText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          categories.length,
          (index) {
            return Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                categories[index],
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          },
        ),
      ),
    );
  }
}

class NowPlayingMovieWidget extends StatefulWidget {
  const NowPlayingMovieWidget({super.key});

  @override
  State<NowPlayingMovieWidget> createState() => _NowPlayingMovieWidgetState();
}

class _NowPlayingMovieWidgetState extends State<NowPlayingMovieWidget> {
  int centerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: CarouselSlider.builder(
        itemCount: upcoming.length,
        options: CarouselOptions(
          height: 400,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          initialPage: centerIndex,
          viewportFraction: 0.7,
          enableInfiniteScroll: false,
          padEnds: false,
          onPageChanged: (index, reason) {
            setState(() {
              centerIndex = index;
            });
          },
        ),
        itemBuilder: (context, index, _) {
          return _NowPlayingItem(
            movie: nowPlayingMovie[index],
            isCenter: index == centerIndex,
          );
        },
      ),
    );
  }
}

class _NowPlayingItem extends StatelessWidget {
  const _NowPlayingItem({
    required this.movie,
    this.isCenter = false,
  });

  final Movie movie;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(
                    movie.assetImage,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: isCenter
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColor.secondaryColor,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          "Buy Ticket",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColor.primaryColor),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            movie.title,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

class UpcomingMovieWidget extends StatelessWidget {
  const UpcomingMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: CarouselSlider.builder(
        itemCount: upcoming.length,
        options: CarouselOptions(
          height: 360,
          viewportFraction: 0.6,
          enableInfiniteScroll: false,
          padEnds: false,
        ),
        itemBuilder: (context, index, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: upcoming[index])));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(
                          upcoming[index].assetImage,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                upcoming[index].title,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}

class ThisFridayItems extends StatelessWidget {
  const ThisFridayItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: CarouselSlider.builder(
        itemCount: thisFridayMovies.length,
        options: CarouselOptions(
          height: 380,
          viewportFraction: 0.6,
          enableInfiniteScroll: false,
          padEnds: false,
        ),
        itemBuilder: (context, index, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MoviesThisFriday(
                              initialIndex: index,
                            )));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(
                          thisFridayMovies[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  thisFridayMovies[index].name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
