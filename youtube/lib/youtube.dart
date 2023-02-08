// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Youtube extends StatelessWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.red,
                  title: Text(
                    "Search Youtube",
                    style: TextStyle(color: Colors.white70),
                  ),
                  actions: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Icon(Icons.cast),
                    SizedBox(width: 20),
                    Icon(Icons.notifications_none_outlined),
                    SizedBox(width: 20),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: AssetImage('assets/hehe.png'),
                    ),
                    SizedBox(width: 12),
                  ],
                  elevation: 0,
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50),
                    child: Expanded(
                      child: Container(
                        color: Colors.white,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Row(
                              children: [
                                ExploreButton(),
                                Padding(
                                  padding: EdgeInsets.symmetric(
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
                              children: topics.map((topic) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3),
                                  child: topic == "All"
                                      ? ActiveChip(
                                          topic: topic,
                                        )
                                      : InactiveChip(
                                          topic: topic,
                                        ),
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ];
          },
          body: ListView.builder(
              padding: const EdgeInsets.only(top: 0, bottom: 5),
              physics: const BouncingScrollPhysics(),
              itemCount: videos.length + 1,
              itemBuilder: (context, index) {
                if (index == 6) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return Column(
                    children: [
                      ThumbnailImage(
                        thumbImage: videos[index].videoThumbnail,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                  videos[index].channelImage),
                            ),
                          ),
                          Column(
                            mainAxisAlignment:
                                MainAxisAlignment.start,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                videoTitle: videos[index].videoTitle,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  SubtitleText(
                                      subtitleText:
                                          videos[index].channelName),
                                  SubtitleText(
                                      subtitleText:
                                          videos[index].views),
                                  SubtitleText(
                                      subtitleText:
                                          videos[index].date),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Divider(
                        height: 5,
                        thickness: 1,
                        color: Colors.black12,
                      )
                    ],
                  );
                }
              })),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.4,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: <BottomNavigationBarItem>[
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
    );
  }
}

/// Useful Widgets

class ExploreButton extends StatelessWidget {
  const ExploreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: 40,
      width: 110,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.09),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.explore_outlined,
            size: 25,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Explore",
            textScaleFactor: 1.1,
          ),
        ],
      ),
    );
  }
}

class ActiveChip extends StatelessWidget {
  final String topic;

  const ActiveChip({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(width: 1),
      backgroundColor: Colors.black54,
      label: Text(
        topic,
        textScaleFactor: 1.1,
        style: TextStyle(
            fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }
}

class InactiveChip extends StatelessWidget {
  final String topic;

  const InactiveChip({
    Key? key,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(width: 1),
      backgroundColor: Colors.black.withOpacity(0.05),
      label: Text(topic,
          textScaleFactor: 1.1,
          style: TextStyle(
            fontWeight: FontWeight.w400,
          )),
    );
  }
}

class ThumbnailImage extends StatelessWidget {
  final String thumbImage;

  const ThumbnailImage({
    Key? key,
    required this.thumbImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 220,
      child: Image.asset(
        thumbImage,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String videoTitle;
  const TitleText({
    Key? key,
    required this.videoTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .8,
      padding: const EdgeInsets.only(bottom: 2.0),
      child: Text(
        videoTitle,
        textAlign: TextAlign.left,
        maxLines: 2,
        textScaleFactor: 1.2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String subtitleText;

  const SubtitleText({
    Key? key,
    required this.subtitleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitleText,
      maxLines: 1,
      style: TextStyle(overflow: TextOverflow.ellipsis),
    );
  }
}

class DotSeperator extends StatelessWidget {
  const DotSeperator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey,
      ),
      margin: EdgeInsets.symmetric(horizontal: 7),
    );
  }
}

List<String> topics = [
  "All",
  "Flutter",
  "Google",
  "DSA",
  "Naruto",
  "India",
  "News",
  "Mobile Gaming",
  "Politics",
  "Trump",
  "Music",
  "Motivation",
  "Study"
];

List<Video> videos = [
  Video(
      channelName: "freeCodeCamp.org",
      channelImage: "assets/dummy_data/channels/1.jpg",
      videoTitle:
          "Flutter Mobile App + Node.js Back End Tutorial – Code an Amazon Clone [Full Course]",
      videoThumbnail: "assets/dummy_data/thumbs/1.jpg",
      date: "10 days ago",
      views: "184K views"),
  Video(
      channelName: "The Flutter Way",
      channelImage: "assets/dummy_data/channels/2.jpg",
      videoTitle: "Online Shop App - Flutter UI - Speed Code",
      videoThumbnail: "assets/dummy_data/thumbs/2.jpg",
      date: "55 minutes ago",
      views: "75K views"),
  Video(
      channelName: "Oggy Hindi - हिन्दी",
      channelImage: "assets/dummy_data/channels/3.jpg",
      videoTitle:
          "Oggy and the Cockroaches 🔧 KEYS & IDEAS 🔧 Hindi Cartoons for Kids",
      videoThumbnail: "assets/dummy_data/thumbs/3.jpg",
      date: "1 year ago",
      views: "54M views"),
  Video(
      channelName: "Mitch Koko",
      channelImage: "assets/dummy_data/channels/4.jpg",
      videoTitle: "📱Minimal Login UI • Flutter Tutorial ♡",
      videoThumbnail: "assets/dummy_data/thumbs/4.jpg",
      date: "3 hours ago",
      views: "1.3K views"),
  Video(
      channelName: "Sony PAL",
      channelImage: "assets/dummy_data/channels/5.jpg",
      videoTitle:
          "Taarak Mehta Ka Ooltah Chashmah - तारक मेहता - Episode 853 - 24th November, 2017",
      videoThumbnail: "assets/dummy_data/thumbs/5.jpg",
      date: "5 years ago",
      views: "15M views"),
  Video(
      channelName: "WWE",
      channelImage: "assets/dummy_data/channels/6.jpg",
      videoTitle:
          "FULL MATCH – Royal Rumble Match: Royal Rumble 2015",
      videoThumbnail: "assets/dummy_data/thumbs/6.jpg",
      date: "8 days ago",
      views: "3.6M views"),
];

class Video {
  final String channelName;
  final String channelImage;
  final String videoTitle;
  final String videoThumbnail;
  final String date;
  final String views;
  final String? url;

  Video(
      {required this.channelName,
      required this.channelImage,
      required this.videoTitle,
      required this.videoThumbnail,
      required this.date,
      required this.views,
      this.url});
}
