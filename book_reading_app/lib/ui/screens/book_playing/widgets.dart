import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class ControlsBox extends StatelessWidget {
  const ControlsBox({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      height: h * .25,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
      decoration: const BoxDecoration(
          color: blackColor,
          borderRadius:
              BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: mainColor,
                  inactiveTrackColor: Colors.white.withOpacity(.5),
                  trackHeight: 6.5,
                  thumbShape: const CustomSliderThumbCircle(
                    thumbRadius: 11,
                  ),
                  overlayColor: Colors.white.withOpacity(.4),
                ),
                child: Slider(
                  value: 0.55,
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "09:32",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "18:20",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  IconsaxBold.previous,
                  color: Colors.white70,
                ),
                const Icon(
                  IconsaxBold.backward_15_seconds,
                  color: Colors.white70,
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: mainColor),
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 50,
                    ),
                  ),
                ),
                const Icon(
                  IconsaxBold.forward_15_seconds,
                  color: Colors.white70,
                ),
                const Icon(
                  IconsaxBold.next,
                  color: Colors.white70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 5,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint1 = Paint()
      ..color = mainColor //Thumb Background Color
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = blackColor //Thumb Background Color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, paint1);
    canvas.drawCircle(center, thumbRadius * .6, paint2);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
