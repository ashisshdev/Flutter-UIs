// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:youtube/youtube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: YoutubeApp(),
    );
  }
}

class YoutubeApp extends StatelessWidget {
  const YoutubeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(
              Icons.home,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_fire_department),
              label: "Trending",
              activeIcon: Icon(
                Icons.local_fire_department_rounded,
                color: Colors.red,
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: "Subscriptions",
              activeIcon: Icon(
                Icons.subscriptions_rounded,
                color: Colors.red,
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: "Library",
            activeIcon: Icon(
              Icons.video_library,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              snap: true,
              floating: true,
              backgroundColor: Colors.red,
              title: const Text(
                "Search Youtube ",
                style: TextStyle(color: Colors.white70),
              ),
              actions: const [
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.cast),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.notifications_none_outlined),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/hehe.png'),
                )
              ],
              elevation: 0,
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Expanded(
                      child: Container(
                    color: Colors.white,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Row(
                          children: [
                            const ExploreButton(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10),
                              child: Container(
                                height: 30,
                                width: 1,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                        ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: topics
                              .map((e) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 3),
                                    child: e == "All"
                                        ? ActiveChip(topic: e)
                                        : InactiveChip(topic: e),
                                  ))
                              .toList(),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ))),
            )
          ];
        },
        body: ListView.builder(
          padding: const EdgeInsets.only(top: 0, bottom: 10),
          physics: const BouncingScrollPhysics(),
          itemCount: videos.length + 1,
          itemBuilder: (context, index) {
            if (index == 6) {
              return const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Column(
              children: [
                ThumbnailImage(
                    thumbImage: videos[index].videoThumbnail),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage(videos[index].channelImage),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(
                            videoTitle: videos[index].videoTitle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SubtitleText(
                                subtitleText:
                                    videos[index].channelName),
                            const DotSeperator(),
                            SubtitleText(
                                subtitleText: videos[index].views),
                            const DotSeperator(),
                            SubtitleText(
                                subtitleText: videos[index].date)
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const Divider(
                  height: 5,
                  thickness: 1,
                  color: Colors.black12,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
