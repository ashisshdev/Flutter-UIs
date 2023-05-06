import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String image;
  const BookImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
