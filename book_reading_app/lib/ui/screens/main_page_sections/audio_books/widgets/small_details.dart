import 'package:flutter/material.dart';

class BookDetailWIdget extends StatelessWidget {
  final String title;
  final String value;
  const BookDetailWIdget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        Text(
          title,
          textScaleFactor: 1.3,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          value,
          textScaleFactor: 1.4,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
