import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:lottie/lottie.dart';

class ChristmasCard extends StatefulWidget {
  const ChristmasCard({Key? key}) : super(key: key);

  @override
  State<ChristmasCard> createState() => _ChristmasCardState();
}

class AnimatedBackground extends StatefulWidget {
  final Widget child;

  const AnimatedBackground({super.key, required this.child});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  List<Color> colorList = [
    const Color(0xff171B70),
    const Color(0xff410D75),
    const Color(0xff032340),
    const Color(0xff050340),
    const Color(0xff2C0340),
  ];
  List<Alignment> alignmentList = [Alignment.topCenter, Alignment.bottomCenter];
  int index = 0;
  Color bottomColor = const Color(0xff092646);
  Color topColor = const Color(0xff410D75);
  Alignment begin = Alignment.bottomCenter;
  Alignment end = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(microseconds: 0),
      () {
        setState(
          () {
            bottomColor = const Color(0xff33267C);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      onEnd: () {
        setState(
          () {
            index = index + 1;
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];
          },
        );
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [bottomColor, topColor],
        ),
      ),
      child: widget.child,
    );
  }
}

class _ChristmasCardState extends State<ChristmasCard> with TickerProviderStateMixin {
  final controller = FlipCardController();
  bool flipRight = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlipCard(
                    axis: FlipAxis.vertical,
                    frontWidget: const CardFront(),
                    backWidget: const CardBack(),
                    controller: controller,
                    onTapFlipping: true,
                    rotateSide: flipRight ? RotateSide.left : RotateSide.right),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: OutlinedButton(
                    child: const Text("Flip Card"),
                    onPressed: () {
                      controller.flipcard();
                      setState(() {
                        flipRight = !flipRight;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class CardFront extends StatelessWidget {
  const CardFront({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 500,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black26, width: 2, style: BorderStyle.solid),
          borderRadius: const BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Stack(
        children: [
          Positioned(
              top: -50,
              right: 0,
              child: SizedBox(height: 400, width: 300, child: Lottie.asset('assets/lottie_animations/lottie1.json'))),
          Positioned(
              bottom: -60,
              left: -30,
              child: SizedBox(height: 380, width: 250, child: Lottie.asset('assets/lottie_animations/lottie3.json')))
        ],
      ),
    );
  }
}

class CardBack extends StatelessWidget {
  const CardBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 500,
      width: 350,
      decoration: BoxDecoration(
          color: Colors.white70,
          border: Border.all(color: Colors.black26, width: 2, style: BorderStyle.solid),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
      child: Stack(
        children: [
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Text(
              messages[random(messages.length)],
              textScaleFactor: 2.0,
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
              bottom: -40,
              left: 0,
              right: 0,
              child: SizedBox(height: 400, width: 400, child: Lottie.asset('assets/lottie_animations/lottie5.json')))
        ],
      ),
    );
  }
}

random(int max) => Random().nextInt(max);

var messages = [
  "Merry Christmas! I put so much thought into your gift that now it's too late to get it.",
  "Eat. Drink. Be Merry. \nHave a wonderful Christmas!",
  "May the Christmas Season bring only happiness and joy to you and your family.",
  "The gift of love. The gift of peace. The gift of happiness. May all these be yours at Christmas.",
  "Wishing you a season full of light and laughter for you and your family.",
  "Best wishes for a joyous Christmas filled with love, happiness and prosperity!",
  "May your family have a holiday season that is full of wonderful surprises, treats and nonstop laughter.",
  "Our family wishes you love, joy and peace … today, tomorrow and always.",
  "I hope the magic of Christmas fills every corner of your heart and home with joy — now and always.",
  "May your holidays sparkle with joy and laughter.",
  "Wishing you a Christmas that's merry and bright!",
  "I hope you have a safe and relaxing holiday season.",
  "I hope your holiday season is full of peace, joy and happiness.",
  "I hope your Christmas is filled with joy this year!",
  "Happy Holidays! I hope all of your Christmas wishes come true.",
  "Jesus is the reason for the season. Merry Christmas!",
  "May God fill your Yuletide season and all your days with immeasurable prosperity and joy! Merry Christmas!",
  "May you have the gift of faith, the blessing of hope and the peace of His love at Christmas and always!",
  "Merry Christmas! I hope you receive one blessing after another this coming year.",
  "May the Lord grant you and all your loved ones peace, joy and goodwill.",
  "Wishing you a season that’s merry and bright with the light of God’s love.",
  "May the true spirit of Christmas shine in your heart and light your path.",
  "May God bless your life with love and joy this holiday season."
];
