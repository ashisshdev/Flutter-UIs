import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app_challenge/data/data.dart';

class CartItemCard extends StatelessWidget {
  final Food item;
  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      height: 100,
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      // margin: EdgeInsets.only(bottom: value),
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: SizedBox(
              height: 80,
              width: 100,
              child: Transform.scale(
                scale: 1.2,
                child: Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                textScaleFactor: 1.4,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 5),
              Text(
                "\$${item.price}",
                textScaleFactor: 1.4,
                style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.pink),
              ),
              const SizedBox(height: 10),
            ],
          ),
          const Spacer(),
          Container(
              height: 33,
              width: 33,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),

              /// tween animation here, rotates the remove icon by 180*
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 1),
                tween: Tween<double>(begin: 0, end: 2),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.rotate(
                    angle: value * pi,
                    child: child,
                  );
                },
                child: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 25,
                ),
              )),
        ],
      ),
    );
  }
}
