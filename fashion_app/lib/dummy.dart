import 'dart:async';
import 'dart:math';

import 'package:fashion_app/data/data.dart';
import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -10,
            left: -160,
            child: Row(
              children: const [
                OnboardingScrollingImages(startingIndex: 0),
                OnboardingScrollingImages(startingIndex: 1),
                OnboardingScrollingImages(startingIndex: 2),
              ],
            ),
          ),
          const Positioned(
              top: 50,
              child: Text(
                "MNIML Fashion",
                textScaleFactor: 2.0,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.6,
                width: w,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      Colors.white38,
                      Colors.white,
                      Colors.white
                    ], begin: Alignment.topCenter, end: Alignment.center)),
                child: Column(
                  children: [
                    const Spacer(),
                    const Text(
                      "Your Appearance\nShows Your Quality",
                      textScaleFactor: 2.5,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Change the Quality of your\nAppearance with MNIML Fashion now.",
                      textScaleFactor: 1.2,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(color: Colors.black54, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      height: 70,
                      width: w * 0.8,
                      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: const Center(
                          child: Text(
                        "Sign Up with Email",
                        textScaleFactor: 1.3,
                      )),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class OnboardingScrollingImages extends StatefulWidget {
  final int startingIndex;

  const OnboardingScrollingImages({
    Key? key,
    required this.startingIndex,
  }) : super(key: key);

  @override
  State<OnboardingScrollingImages> createState() => _ScrollingImagesState();
}

class _ScrollingImagesState extends State<OnboardingScrollingImages> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.offset == _scrollController.position.minScrollExtent) {
        _autoScrollForward();
      } else if (_scrollController.offset == _scrollController.position.maxScrollExtent) {
        _autoScrollbackward();
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _autoScrollForward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _autoScrollForward() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.startingIndex + 2),
          curve: Curves.linear);
    });
  }

  _autoScrollbackward() {
    final currentPosition = _scrollController.offset;
    final endPosition = _scrollController.position.minScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(currentPosition == endPosition ? 0 : endPosition,
          duration: Duration(seconds: 20 + widget.startingIndex + 2),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: h * 0.6,
        width: w * 0.6,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 8, left: 8, top: 10),
              height: h * 0.6,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(modelsImages[index + widget.startingIndex]),
                      fit: BoxFit.cover)),
            );
          },
        ),
      ),
    );
  }
}
