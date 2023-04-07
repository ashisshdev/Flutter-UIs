import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skateboard_shop/data/data.dart';

class HeroSkate extends StatelessWidget {
  static const _angleRotateBoat = (pi * -.5);
  static const _dxTranslate = 80.0;
  static const _dyTranslate = -10.0;

  final SkateBoard board;
  const HeroSkate({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Hero(
      tag: board.fImage,
      flightShuttleBuilder: (_, animation, flightDirection, ___, ____) {
        // we can change the curve by knowing if the widget is coming from previous screen on going back to previous screen
        // final isPop = flightDirection == HeroFlightDirection.pop;
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final value = Curves.ease.transform(animation.value);
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..translate(_dxTranslate * value, _dyTranslate * value, 0)
                ..rotateZ(_angleRotateBoat * value),
              child: child,
            );
          },
          child: Image.asset(
            board.fImage,
            // height: w,
            // fit: BoxFit.cover,
          ),
        );
      },
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(_dxTranslate, _dyTranslate, 0)
          ..rotateZ(_angleRotateBoat),
        child: Image.asset(
          board.fImage,
          height: w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AvailableSizes extends StatelessWidget {
  final List<String> availableSizes;

  const AvailableSizes({super.key, required this.availableSizes});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Sizes :",
          textScaleFactor: 1.4,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: availableSizes
                .map((e) => Container(
                      margin: const EdgeInsets.only(right: 20, top: 13),
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1.2),
                          borderRadius: const BorderRadius.all(Radius.circular(15))),
                      child: Text(
                        e,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class CoreFeatures extends StatelessWidget {
  const CoreFeatures({super.key, required this.features});
  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Core Features :",
          textScaleFactor: 1.4,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2, top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: coreFeatures
                .map((e) => Container(
                      margin: const EdgeInsets.only(bottom: 3),
                      child: Wrap(
                        children: [
                          const Text(
                            "• ",
                            textScaleFactor: 1.5,
                          ),
                          Text(
                            e,
                            textScaleFactor: 1.3,
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class Description extends StatefulWidget {
  const Description({super.key, required this.text});
  final String text;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool isFull = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description :",
          textScaleFactor: 1.4,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isFull = !isFull;
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 2, top: 5),
            child: isFull
                ? Text(
                    "  ${widget.text}",
                    textScaleFactor: 1.3,
                    style: TextStyle(color: Colors.black.withOpacity(0.75), height: 1.1),
                  )
                : Text(
                    "  ${widget.text}",
                    textScaleFactor: 1.3,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black.withOpacity(0.75), height: 1.1),
                  ),
          ),
        ),
      ],
    );
  }
}
