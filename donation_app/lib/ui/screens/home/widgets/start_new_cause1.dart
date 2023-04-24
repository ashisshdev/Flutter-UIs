import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class StartNewCause1 extends StatelessWidget {
  const StartNewCause1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Start New Cause",
                textScaleFactor: 1.4,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              SizedBox(
                height: 20,
                child: DefaultTextStyle(
                  style: const TextStyle(fontSize: 15.0, color: Colors.grey),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(seconds: 12),
                    animatedTexts: [
                      TypewriterAnimatedText("...for Children's education",
                          speed: const Duration(milliseconds: 80)),
                      TypewriterAnimatedText("...for women empowerment",
                          speed: const Duration(milliseconds: 80)),
                      TypewriterAnimatedText("...for stopping animal cruelity",
                          speed: const Duration(milliseconds: 80)),
                      TypewriterAnimatedText("...for helping minority groups",
                          speed: const Duration(milliseconds: 80)),
                      TypewriterAnimatedText("and invite people to help!",
                          speed: const Duration(milliseconds: 80)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              padding: const EdgeInsets.all(15),
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2F44CC)),
              child: const Icon(Icons.add, size: 30, color: Colors.white))
        ],
      ),
    );
  }
}
