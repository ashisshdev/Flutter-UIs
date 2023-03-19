import 'package:fashion_app/screens/onboarding/widgets.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
                ScrollingImages(startingIndex: 0),
                ScrollingImages(startingIndex: 1),
                ScrollingImages(startingIndex: 2),
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
