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
      // appBar: AppBar(
      //   backgroundColor: mainColor,
      //   elevation: 0,
      //   leadingWidth: 0,
      //   systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: mainColor),
      //   leading: const Padding(
      //     padding: EdgeInsets.only(left: 5),
      //     child: Icon(
      //       IconsaxOutline.arrow_left_2,
      //       color: Colors.black,
      //       size: 25,
      //     ),
      //   ),
      //   actions: const [
      //     Padding(
      //       padding: EdgeInsets.only(right: 15),
      //       child: Icon(
      //         IconsaxOutline.bookmark_2,
      //         color: Colors.black,
      //         size: 25,
      //       ),
      //     )
      //   ],
      // ),
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: mainColor),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: const [
              // Container(
              //   color: Colors.green,
              //   height: h * 0.68,
              //   child: Stack(
              //     children: [
              //       Positioned(
              //         top: h * 0.53,
              //         left: 0,
              //         right: 0,
              //         height: h * .1,
              //         child: Container(
              //           width: h * .1,
              //           decoration: const BoxDecoration(
              //             color: Colors.red,
              //             shape: BoxShape.circle,
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         top: 0,
              //         left: 0,
              //         right: 0,
              //         height: h * 0.58,
              //         child: Container(
              //           color: Colors.black,
              //         ),
              //       )
              //     ],
              //   ),
              // )

              CustomShapeContainer()
            ],
          ),
        )),
      ),
    );
  }
}
