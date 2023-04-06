import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skateboard_shop/data/data.dart';

class DetailPage extends StatelessWidget {
  static const _angleRotateBoat = (pi * -.5);
  static const _dxTranslate = 80.0;
  static const _dyTranslate = -10.0;

  final SkateBaoard board;
  const DetailPage({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(left: 10, top: 10, child: Icon(Icons.close)),
                    Positioned(
                      right: w * 0.40,
                      child: Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: Hero(
                          tag: board.name,
                          flightShuttleBuilder:
                              (_, animation, flightDirection, ___, ____) {
                            // we can change the curve by knowing if the widget is coming from previous screen on going back to previous screen 
                            // final isPop = flightDirection == HeroFlightDirection.pop;
                            return AnimatedBuilder(
                              animation: animation,
                              builder: (context, child) {
                                final value = Curves.ease.transform(animation.value);
                                return Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()
                                    ..translate(
                                        _dxTranslate * value, _dyTranslate * value, 0)
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
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
