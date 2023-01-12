import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with TickerProviderStateMixin {
  late AnimationController controller1;
  late Animation<double> startingHeightFactorAnimation;

  late AnimationController controller2;
  late Animation<double> endingHeightFactorAnimation;

  late AnimationController controller3;
  late Animation<double>
      firstCurveHeightFactorAnimation;

  late AnimationController controller4;
  late Animation<double>
      secondCurveHeightFactorAnimation;

  @override
  void initState() {
    super.initState();

    controller1 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500));
    startingHeightFactorAnimation =
        Tween<double>(begin: 0.51, end: 0.46).animate(
            CurvedAnimation(
                parent: controller1,
                curve: Curves.easeInOut))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller1.reverse();
            } else if (status ==
                AnimationStatus.dismissed) {
              controller1.forward();
            }
          });

    controller2 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500));
    endingHeightFactorAnimation =
        Tween<double>(begin: 0.46, end: 0.50).animate(
            CurvedAnimation(
                parent: controller2,
                curve: Curves.easeInOut))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller2.reverse();
            } else if (status ==
                AnimationStatus.dismissed) {
              controller2.forward();
            }
          });

    controller3 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500));
    firstCurveHeightFactorAnimation =
        Tween<double>(begin: 0.38, end: 0.65).animate(
            CurvedAnimation(
                parent: controller3,
                curve: Curves.easeInOut))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller3.reverse();
            } else if (status ==
                AnimationStatus.dismissed) {
              controller3.forward();
            }
          });

    controller4 = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500));
    secondCurveHeightFactorAnimation =
        Tween<double>(begin: 0.60, end: 0.35).animate(
            CurvedAnimation(
                parent: controller4,
                curve: Curves.easeInOut))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller4.reverse();
            } else if (status ==
                AnimationStatus.dismissed) {
              controller4.forward();
            }
          });

    controller4.forward();

    Timer(const Duration(milliseconds: 800), () {
      controller3.forward();
    });
    //
    Timer(const Duration(milliseconds: 1200), () {
      controller2.forward();
    });
    //
    Timer(const Duration(milliseconds: 1600), () {
      controller1.forward();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hehe"),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
                top: 100,
                child: SizedBox(
                  height: MediaQuery.of(context)
                      .size
                      .height,
                  width: MediaQuery.of(context)
                      .size
                      .width,
                  child: CustomPaint(
                    painter: WavePainter(
                        widthFactor: 0.3,
                        startingHeightFactor:
                            startingHeightFactorAnimation
                                .value,
                        height2Factor:
                            firstCurveHeightFactorAnimation
                                .value,
                        height3Factor:
                            secondCurveHeightFactorAnimation
                                .value,
                        endingHeightFactor:
                            endingHeightFactorAnimation
                                .value,
                        waveColor: Colors.blue
                            .withOpacity(0.7)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  // here factor means what number should I be
  // multiplying the height and width of the canvas
  // basically what percent of canvas height/width

  final double widthFactor;
  final double startingHeightFactor;
  final double height2Factor;
  final double height3Factor;
  final double endingHeightFactor;
  final Color waveColor;

  WavePainter(
      {required this.widthFactor,
      required this.startingHeightFactor,
      required this.height2Factor,
      required this.height3Factor,
      required this.endingHeightFactor,
      required this.waveColor});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint
      ..color = waveColor
      ..style = PaintingStyle.fill;

    // we need 4 points here
    var path = Path();

    // point 1 -> where it all starts
    path.moveTo(0, size.height * startingHeightFactor);

    path.cubicTo(
        // point 2 -> where we make first curve
        // here we need to change width in negligible
        // amount
        // but height in little more
        size.width * widthFactor,
        size.height * height2Factor,

        // point 3 -> where we make second curve
        size.width * (widthFactor + 0.4),
        size.height * height3Factor,

        // point 4 -> where it all stops
        size.width,
        size.height * endingHeightFactor);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(
      covariant CustomPainter oldDelegate) {
    return true;
  }
}
