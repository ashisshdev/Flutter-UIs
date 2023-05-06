import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  final String title;
  final bool showArrow;
  const SectionTile({super.key, required this.title, required this.showArrow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          textScaleFactor: 1.8,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        showArrow
            ? Icon(
                Icons.arrow_forward,
                size: 30,
                color: Colors.black.withOpacity(0.7),
              )
            : SizedBox.fromSize()
      ],
    );
  }
}
