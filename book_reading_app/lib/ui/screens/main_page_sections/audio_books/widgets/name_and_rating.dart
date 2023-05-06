import 'package:book_reading_app/data/models/book.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';

class BookNameAndRating extends StatelessWidget {
  final Book book;
  const BookNameAndRating({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                book.name,
                textScaleFactor: 1.8,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < book.rating; i++) ...[
                      const Icon(
                        IconsaxBulk.star,
                        size: 35,
                        color: mainDark,
                      ),
                    ],
                    const SizedBox(width: 5),
                    for (int i = 0; i < 5 - book.rating; i++) ...[
                      const Icon(
                        IconsaxOutline.star,
                        size: 25,
                        color: mainDark,
                      ),
                    ],
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
