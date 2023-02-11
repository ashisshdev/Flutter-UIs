import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.deepPurpleAccent
  ];

  int currentColor = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1),
        (timer) {
      setState(() {
        currentColor == 3
            ? currentColor = 0
            : currentColor = currentColor + 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[currentColor],
      body: SafeArea(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 800),
          child: const Center(
            child: ImageSequence(),
          ),
        ),
      ),
    );
  }
}

class ImageSequence extends StatefulWidget {
  const ImageSequence({Key? key}) : super(key: key);

  @override
  State<ImageSequence> createState() =>
      _ImageSequenceState();
}

class _ImageSequenceState extends State<ImageSequence>
    with SingleTickerProviderStateMixin {
  List allImages = [];
  int currentImage = 0;

  @override
  void initState() {
    super.initState();

    if (allImages.isEmpty) {
      for (int i = 0; i < 15; i++) {
        allImages.add(
            "assets/duckimages/image${i.toString()}.png");
      }
    }

    Timer.periodic(const Duration(milliseconds: 70),
        (timer) {
      setState(() {
        currentImage < 14
            ? currentImage = currentImage + 1
            : currentImage = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      allImages[currentImage],
    );
  }
}

/// Alternative Implementations
/// 1 - using Animated Switcher
// class _ImageSequenceState extends State<ImageSequence> with SingleTickerProviderStateMixin {
//   List<Widget> allImages = [];
//   int currentImage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     if (allImages.isEmpty) {
//       for (int i = 0; i < 15; i++) {
//         allImages.add(Image.asset("assets/duckimages/image${i.toString()}.png"));
//       }
//     }
//
//     Timer.periodic(const Duration(milliseconds: 100), (timer) {
//       setState(() {
//         currentImage < 14 ? currentImage = currentImage + 1 : currentImage = 0;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 0),
//       child: allImages[currentImage],
//     );
//   }
// }
///2 - using Animated Builder
// class _ImageSequenceState extends State<ImageSequence> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   List allImages = [];
//   int currentImage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _animationController = AnimationController(vsync: this)
//       ..duration = const Duration(milliseconds: 1000)
//       ..repeat();
//
//     _animation = Tween<double>(begin: 0, end: 14).animate(_animationController);
//
//     if (allImages.isEmpty) {
//       for (int i = 0; i < 15; i++) {
//         allImages.add("assets/duckimages/image${i.toString()}.png");
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (BuildContext context, Widget? child) {
//         return Image.asset(
//           allImages[int.parse(_animation.value.round().toString())],
//         );
//       },
//     );
//   }
// }

//
// ======================================================================
