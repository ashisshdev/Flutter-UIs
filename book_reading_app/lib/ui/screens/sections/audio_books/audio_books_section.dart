import 'package:book_reading_app/data/data.dart';
import 'package:book_reading_app/ui/screens/sections/audio_books/audio_books_section_widgets.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AudioBooksSection extends StatefulWidget {
  const AudioBooksSection({super.key});

  @override
  State<AudioBooksSection> createState() => _AudioBooksSectionState();
}

class _AudioBooksSectionState extends State<AudioBooksSection> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white60,
          Colors.white30,
          Colors.transparent,
        ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: mainColor),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomShapeContainer(),
                Column(
                  children: [
                    SizedBox(
                      height: h * .09,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          BookDetailWIdget(title: "Hours", value: "4h 30min"),
                          BookDetailWIdget(title: "Author", value: "Hello AUth"),
                          BookDetailWIdget(title: "Genre", value: "Adventure"),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: OverViewWidget(text: descriptions[0]),
                ),
                SizedBox(height: h * .1)
              ],
            ),
          )),
        ),
      ),
    );
  }
}

class OverViewWidget extends StatefulWidget {
  final String text;
  const OverViewWidget({super.key, required this.text});

  @override
  State<OverViewWidget> createState() => _OverViewWidgetState();
}

class _OverViewWidgetState extends State<OverViewWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overview",
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: showMore
              ? Text(
                  widget.text,
                  textScaleFactor: 1.1,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              : Text(
                  widget.text,
                  textScaleFactor: 1.1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
        )
      ],
    );
  }
}

class BookDetailWIdget extends StatelessWidget {
  final String title;
  final String value;
  const BookDetailWIdget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        Text(
          title,
          textScaleFactor: 1.3,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          textScaleFactor: 1.4,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
