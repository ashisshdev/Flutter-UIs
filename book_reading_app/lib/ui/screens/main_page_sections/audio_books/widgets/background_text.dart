import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class BackGroundText extends StatelessWidget {
  final String text;
  const BackGroundText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.fill,
        child: FittedBox(
          /// or we can just remove this fitted box
          fit: BoxFit.fitHeight,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: Text(
              text,
              key: UniqueKey(),
              textAlign: TextAlign.center,
              // style: GoogleFonts.anton(
              //     textStyle: TextStyle(
              //         foreground: Paint()
              //           ..style = PaintingStyle.stroke
              //           ..strokeWidth = .1
              //           ..color = mainColorDark)),
              style: TextStyle(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = .1
                    ..color = mainColorDark),
            ),
          ),
        ),
      ),
    );
  }
}
