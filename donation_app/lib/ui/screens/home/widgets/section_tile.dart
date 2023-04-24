import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textScaleFactor: 1.4,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          "view all",
          textScaleFactor: 1,
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.75)),
        )
      ],
    );
  }
}
