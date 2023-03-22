import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yatch_booking_app/models/boat_model.dart';

class DetailsPage extends StatelessWidget {
  final Boat boat;

  const DetailsPage({
    Key? key,
    required this.boat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: SizedBox(
                      child: Hero(
                        tag: boat.urlImage,
                        child: Transform.rotate(
                          angle: pi / 180 * (-90),
                          child: Image.asset(
                            boat.urlImage,
                            alignment: Alignment.bottomCenter,
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: MediaQuery.of(context).size.width - 90,
                            fit: BoxFit.contain,
                            //                    height: value == 0 ? size.height * .6 : size.height * .4,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
