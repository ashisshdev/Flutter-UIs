import 'package:book_reading_app/data/models/book.dart';
import 'package:book_reading_app/ui/screens/book_playing/widgets.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BookPlayingScreen extends StatefulWidget {
  final Book book;
  const BookPlayingScreen({super.key, required this.book});

  @override
  State<BookPlayingScreen> createState() => _BookPlayingScreenState();
}

class _BookPlayingScreenState extends State<BookPlayingScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        toolbarHeight: 80,
        title: SizedBox(
          width: w * .7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.book.name,
                textScaleFactor: 1.4,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                widget.book.author,
                style: const TextStyle(fontWeight: FontWeight.w500, color: mainColor),
              )
            ],
          ),
        ),
        elevation: 0,
        leadingWidth: 0,
        leading: const Padding(
            padding: EdgeInsets.only(left: 10, bottom: 20),
            child: Icon(IconsaxOutline.arrow_left, color: Colors.white)),
        actions: const [
          Padding(
              padding: EdgeInsets.only(right: 10, bottom: 20),
              child: Icon(IconsaxOutline.more, color: Colors.white))
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: widget.book.image,
              child: Container(
                height: h * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.book.image),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.transparent,
                        mainColorLight,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ControlsBox(),
          )
        ],
      ),
    );
  }
}
