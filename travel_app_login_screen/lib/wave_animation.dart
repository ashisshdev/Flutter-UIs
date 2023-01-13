import 'dart:async';

import 'package:flutter/material.dart';

class WaveAnimation extends StatefulWidget {
  // receive wave's height start min,max
  // receive wave's first rise min,max
  // receive wave's second rise min,max
  // receive wave's height end min,max

  // default values if no values are provided

  final double heightStartMin;
  final double heightStartMax;
  final double firstRiseStartMin;
  final double firstRiseStartMax;
  final double secondRiseStartMin;
  final double secondRiseStartMax;
  final double heightEndMin;
  final double heightEndMax;
  final int delay;
  final Color color;

  const WaveAnimation(
      {super.key,
      this.heightStartMin = 1.25,
      this.heightStartMax = 1.30,
      this.firstRiseStartMin = 1.2,
      this.firstRiseStartMax = 1.35,
      this.secondRiseStartMin = 1.2,
      this.secondRiseStartMax = 1.35,
      this.heightEndMin = 1.25,
      this.heightEndMax = 1.30,
      this.delay = 800,
      required this.color});

  @override
  State<WaveAnimation> createState() =>
      _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with TickerProviderStateMixin {
  late AnimationController firstController;
  late Animation<double> firstAnimation;

  late AnimationController secondController;
  late Animation<double> secondAnimation;

  late AnimationController thirdController;
  late Animation<double> thirdAnimation;

  late AnimationController fourthController;
  late Animation<double> fourthAnimation;

  @override
  void initState() {
    super.initState();

    firstController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500));
    firstAnimation = Tween<double>(
            begin: widget.heightStartMin,
            end: widget.heightStartMax)
        .animate(CurvedAnimation(
            parent: firstController,
            curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstController.reverse();
        } else if (status ==
            AnimationStatus.dismissed) {
          firstController.forward();
        }
      });

    secondController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500));
    secondAnimation = Tween<double>(
            begin: widget.firstRiseStartMin,
            end: widget.firstRiseStartMax)
        .animate(CurvedAnimation(
            parent: secondController,
            curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondController.reverse();
        } else if (status ==
            AnimationStatus.dismissed) {
          secondController.forward();
        }
      });

    thirdController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500));
    thirdAnimation = Tween<double>(
            begin: widget.secondRiseStartMin,
            end: widget.secondRiseStartMax)
        .animate(CurvedAnimation(
            parent: thirdController,
            curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdController.reverse();
        } else if (status ==
            AnimationStatus.dismissed) {
          thirdController.forward();
        }
      });

    fourthController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500));
    fourthAnimation = Tween<double>(
            begin: widget.heightEndMin,
            end: widget.heightEndMax)
        .animate(CurvedAnimation(
            parent: fourthController,
            curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          fourthController.reverse();
        } else if (status ==
            AnimationStatus.dismissed) {
          fourthController.forward();
        }
      });

    Timer(Duration(milliseconds: 1200 + widget.delay),
        () {
      firstController.forward();
    });

    Timer(Duration(milliseconds: widget.delay + 800),
        () {
      secondController.forward();
    });

    Timer(Duration(milliseconds: widget.delay), () {
      thirdController.forward();
    });

    fourthController.forward();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomPaint(
        painter: WavePainter(
            firstValue: firstAnimation.value,
            secondValue: secondAnimation.value,
            thirdValue: thirdAnimation.value,
            fourthValue: fourthAnimation.value,
            color: widget.color),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;
  final Color color;

  WavePainter({
    required this.firstValue,
    required this.secondValue,
    required this.thirdValue,
    required this.fourthValue,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(
          // point 2
          size.width * .4,
          size.height / secondValue,
          // point 3
          size.width * .7,
          size.height / thirdValue,
          // point 4
          size.width,
          size.height / fourthValue)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate) {
    return true;
  }
}
