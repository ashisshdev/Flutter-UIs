import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skateboard_shop/data/data.dart';

class AnimatedCustomAppBar extends StatelessWidget {
  const AnimatedCustomAppBar({
    Key? key,
    required this.animate,
  }) : super(key: key);

  final bool animate;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 600),
      transform: Matrix4.translationValues(0, animate ? 0 : -100, 0),
      child: AnimatedOpacity(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 600),
        opacity: animate ? 1 : 0,
        child: SizedBox(
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Skateboards',
                  textScaleFactor: 2.0,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  color: Colors.grey[800],
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkateSlide extends StatelessWidget {
  final double delta;
  final SkateBaoard skateBaoard;
  final VoidCallback onTapSpec;

  const SkateSlide(
      {super.key,
      required this.skateBaoard,
      required this.delta,
      required this.onTapSpec});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Opacity(
      opacity: (1 - delta).clamp(0.0, 1.0),
      child: Column(
        children: [
          SizedBox(height: h * 0.05),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 0))
                      ]),
                ),
                Transform.rotate(
                  angle: 2 * pi * delta,
                  child: Transform.scale(
                    scale: lerpDouble(1.0, 0.7, delta),
                    // scale: lerpDouble(1.0, 0.7, delta)!,
                    child: Hero(
                      tag: skateBaoard.name,
                      child: Image.asset(skateBaoard.fImage, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: h * 0.08),
          Text(
            skateBaoard.name,
            textScaleFactor: 2.0,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          //------------------------------
          // Owner boat
          //------------------------------
          Text.rich(
            textScaleFactor: 1.2,
            TextSpan(
              text: 'By ',
              children: [
                TextSpan(
                  text: skateBaoard.by,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              ],
              style: TextStyle(color: Colors.grey[600], height: 1),
            ),
          ),
          //-----------------------------
          // See Specs Button
          //-----------------------------
          TextButton.icon(
            label: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 26,
            ),
            icon: const Text(
              'SPEC',
              textScaleFactor: 1.2,
            ),
            onPressed: onTapSpec,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.blue[900]!,
              ),
            ),
          ),
          SizedBox(height: h * 0.1),
        ],
      ),
    );
  }
}
