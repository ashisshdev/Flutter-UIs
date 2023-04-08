import 'package:flutter/material.dart';
import 'package:kayak_booking_app/models/kayak.dart';
import 'package:simple_shadow/simple_shadow.dart';

class DetailedView extends StatelessWidget {
  final Kayak kayak;

  const DetailedView({super.key, required this.kayak});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Hero(
                    tag: kayak.color,
                    child: Container(
                      height: h / 1.5,
                      width: w,
                      decoration: BoxDecoration(
                          color: kayak.color.withOpacity(0.9),
                          borderRadius:
                              const BorderRadius.vertical(top: Radius.circular(20))),
                    ),
                  ),
                ),
                Positioned(
                  bottom: h * 0.05,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: [
                        Hero(
                          tag: kayak.name,
                          child: Material(
                            type: MaterialType.transparency,
                            child: Text(kayak.name,
                                textScaleFactor: 2.0,
                                style: const TextStyle(color: Colors.white)),
                          ),
                        ),
                        Container(
                          width: w * 0.35,
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          padding:
                              const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.remove,
                                color: kayak.color,
                              ),
                              const Text(
                                '1',
                                textScaleFactor: 1.5,
                              ),
                              Icon(
                                Icons.add,
                                color: kayak.color,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: h * 0.25,
                  height: h * 0.65,
                  child: Center(
                      child: Hero(
                    tag: kayak.image,
                    flightShuttleBuilder: (_, animation, flightDirection, ___, ____) {
                      return AnimatedBuilder(
                        animation: animation,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle: -.9 * (1 - animation.value),
                            alignment: Alignment.center,
                            child: child,
                          );
                        },
                        child: SimpleShadow(
                          opacity: 0.3,
                          color: Colors.black,
                          offset: const Offset(-15, 10),
                          child: Image.asset(
                            kayak.image,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      );
                    },
                    child: SimpleShadow(
                      opacity: 0.3,
                      color: Colors.black,
                      offset: const Offset(-15, 10),
                      child: Image.asset(
                        kayak.image,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  )),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
