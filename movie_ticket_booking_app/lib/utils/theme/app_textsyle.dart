import 'package:flutter/material.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();

  TextStyle displayLarge = const TextStyle(
    color: Colors.black,
    fontSize: 57,
    fontWeight: FontWeight.bold,
  );
  TextStyle displayMedium = const TextStyle(
    color: Colors.black,
    fontSize: 45,
    fontWeight: FontWeight.bold,
  );
  TextStyle displaySmall = const TextStyle(
    color: Colors.black,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineLarge = const TextStyle(
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineMedium = const TextStyle(
    color: Colors.black,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );
  TextStyle headlineSmall = const TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
  TextStyle titleLarge = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 22,
  );
  TextStyle titleMedium = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 18,
  );
  TextStyle titleSmall = const TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
  TextStyle labelLarge = const TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
  TextStyle labelMedium = const TextStyle(
    color: Colors.black,
    fontSize: 12,
  );
  TextStyle labelSmall = const TextStyle(
    color: Colors.black,
    fontSize: 11,
  );
  TextStyle bodyLarge = const TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 16,
  );
  TextStyle bodyMedium = const TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
  TextStyle bodySmall = const TextStyle(
    color: Colors.black,
    fontSize: 12,
  );
}

Widget textThemeSample(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "displayLarge",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          "displayMedium",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          "displaySmall",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          "headlineLarge",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "headlineMedium",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          "headlineSmall",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          "titleLarge",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          "titleMedium",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          "titleSmall",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          "labelLarge",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          "labelMedium",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          "labelSmall",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          "bodyLarge",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          "bodyMedium",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          "bodySmall",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ),
  );
}
