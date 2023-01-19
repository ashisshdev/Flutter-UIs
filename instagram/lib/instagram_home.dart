// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

/// First create a

class InstagramHome extends StatelessWidget {
  const InstagramHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.camera_alt,
          color: Colors.black,
          size: 30,
        ),
        title: Image.asset("assets/logo.PNG"),
        centerTitle: true,
        actions: [RotatedSendMessageIcon(size: 30)],
        elevation: 0.3,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 31,
        elevation: 1,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Reels",
            icon: Icon(Icons.video_call),
          ),
          BottomNavigationBarItem(
            label: "Activity",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: ListView(
        // or a Column inside a SingleChildScrollView will do the job
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(1),
            height: 98,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  return StoryWidget(
                    assetName: stories[stories.length - index - 1],
                    username: usernames[index],
                  );
                }),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
                // both physics works
                // physics: NeverScrollableScrollPhysics(),
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: dummyPosts.length,
                itemBuilder: (context, index) {
                  return PostWidget(index: index);
                }),
          )
        ],
      ),
    );
  }
}

/// Widgets

class StoryWidget extends StatelessWidget {
  final String assetName;
  final String username;

  const StoryWidget(
      {Key? key, required this.assetName, required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
//                          borderRadius: BorderRadius.all(Radius.circular(45)),
              gradient: LinearGradient(colors: colors),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(assetName),
              radius: 28,
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            username,
            textScaleFactor: 0.8,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black87),
          )
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final int index;

  const PostWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          /// user image and username
          Container(
            margin: EdgeInsets.only(bottom: 3, top: 2),
            child: Row(
              children: [
                SizedBox(
                  width: 3,
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: colors),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        stories[stories.length - index - 1]),
                    radius: 15,
                  ),
                ),
                Text(
                  " ${dummyPosts[index].username}",
                  textScaleFactor: 1.2,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                Spacer(),
                Icon(
                  Icons.more_vert,
                  color: Colors.black.withOpacity(0.6),
                )
              ],
            ),
          ),

          /// main content - image
          Image.asset(
            dummyPosts[index].image,
            fit: BoxFit.fitHeight,
          ),

          /// like,comment,share, ... , save
          Row(
            children: [
              dummyPosts[index].isLiked
                  ? PostWidgetIcon(
                      icon: Icons.favorite, color: Colors.red)
                  : PostWidgetIcon(icon: Icons.favorite_border),
              PostWidgetIcon(icon: Icons.comment_bank_rounded),
              RotatedSendMessageIcon(size: 35),
              Spacer(),
              PostWidgetIcon(icon: Icons.bookmark_border),
              Divider(),
            ],
          ),

          /// Captions and stuff
          Container(
            padding: EdgeInsets.only(left: 12),
            alignment: Alignment.centerLeft,
            child: RichText(
              maxLines: 2,
              text: TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis),
                children: <TextSpan>[
                  TextSpan(
                      text: dummyPosts[index].username.toString(),
                      style: TextStyle(fontWeight: FontWeight.w700)),
                  TextSpan(text: '   ${dummyPosts[index].caption}'),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 10,
            thickness: 0.5,
            color: Colors.black26,
          )
        ],
      ),
    );
  }
}

/// small helper widgets
class PostWidgetIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const PostWidgetIcon(
      {Key? key, required this.icon, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Icon(
        icon,
        size: 35,
        color: color,
      ),
    );
  }
}

class RotatedSendMessageIcon extends StatelessWidget {
  final double size;

  const RotatedSendMessageIcon({Key? key, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Transform.rotate(
          angle: 320 * math.pi / 180,
          child: Icon(
            Icons.send_sharp,
            size: size,
            color: Colors.black,
          )),
    );
  }
}

/// Data
List usernames = [
  "ashiish.dev",
  "theflutterway",
  "hello_world",
  "heaven",
  "random_tiktoker",
  "tech_reviews",
  "s_ghasghas",
  "blade_runner"
];

List<String> captions = [
  "I'm an original and that's perfection in itself",
  "You can't dull my sparkle ✨",
  "An apple a day will keep anyone away if you throw it hard enough.",
  "Give second chances but not for the same mistake",
  "Life is the biggest party you'll ever be at.",
  "I'm an original and that's perfection in itself",
  "You can't dull my sparkle ✨",
  "An apple a day will keep anyone away if you throw it hard enough."
];

List<Color> colors = [
  Color(0xFFF58529),
  Color(0xFFFEDA77),
  Color(0xFFDD2A7B),
  Color(0xFF8134AF),
  Color(0xFF515BD4),
];

/// Generators

List stories = List<String>.generate(
    8, (index) => "assets/people/${index + 1}.jfif");

double falseProbability = .3;

List<PostModel> dummyPosts = List<PostModel>.generate(8, (i) {
  return PostModel(
      usernames[i].toString().toLowerCase(),
      "assets/posts/${i + 1}.png",
      Random().nextDouble() > falseProbability,
      int.parse(Random().nextInt(500).toString()) + 500,
      captions[i]);
});

/// Models
class PostModel {
  final String username;
  final String image;
  final bool isLiked;
  final int likes;
  final String caption;

  PostModel(this.username, this.image, this.isLiked, this.likes,
      this.caption);
}
