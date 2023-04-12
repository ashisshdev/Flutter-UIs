import 'package:flutter/material.dart';

import 'data.dart';

class TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height) // Add line p1p2
      ..lineTo(size.width, size.height) // Add line p2p3
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

Widget blackBall(double size) => Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    );

Widget greyBall(double size) => Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(color: Colors.white38, shape: BoxShape.circle),
    );

Widget element3 = Image.asset(tube1Asset);




class TubePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final h = size.height;
    final w = size.width;

    Path path = Path()
      ..moveTo(w, w / 5)
      ..arcToPoint(Offset(w / 5, h), radius: Radius.circular(w))
      ..arcToPoint(Offset(w / 5, h - w / 5), radius: Radius.circular(w / 10))
      ..arcToPoint(Offset(w - w / 5, w / 5), radius: Radius.circular(w), clockwise: false)
      ..arcToPoint(Offset(w, w / 5), radius: Radius.circular(w / 10))

      // ..arcToPoint(Offset(size.width - 50, size.height), radius: Radius.circular(w/10))
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
