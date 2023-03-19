import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/utils/theme/page_transitions.dart';

import 'app_color.dart';
import 'app_textsyle.dart';

class AppTheme {
  static final AppTextStyle _textStyle = AppTextStyle.instance;

  static ThemeData light = ThemeData(
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.white,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomSlideFadeTransition(),
        TargetPlatform.iOS: CustomSlideFadeTransition(),
      },
    ),
    textTheme: TextTheme(
      displayLarge: _textStyle.displayLarge,
      displayMedium: _textStyle.displayMedium,
      displaySmall: _textStyle.displaySmall,
      headlineLarge: _textStyle.headlineLarge,
      headlineMedium: _textStyle.headlineMedium,
      headlineSmall: _textStyle.headlineSmall,
      titleLarge: _textStyle.titleLarge,
      titleSmall: _textStyle.titleSmall,
      titleMedium: _textStyle.titleMedium,
      labelLarge: _textStyle.labelLarge,
      labelMedium: _textStyle.labelMedium,
      labelSmall: _textStyle.labelSmall,
      bodyLarge: _textStyle.bodyLarge,
      bodyMedium: _textStyle.bodyMedium,
      bodySmall: _textStyle.bodySmall,
    ),
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: AppColor.primarySwatch)
        .copyWith(background: AppColor.backgroundGray),
  );

  static ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundBlack,
    primaryColor: AppColor.primaryColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomSlideFadeTransition(),
        TargetPlatform.iOS: CustomSlideFadeTransition(),
      },
    ),
    textTheme: TextTheme(
      displayLarge: _textStyle.displayLarge
          .copyWith(color: AppColor.white),
      displayMedium: _textStyle.displayMedium
          .copyWith(color: AppColor.white),
      displaySmall: _textStyle.displaySmall
          .copyWith(color: AppColor.white),
      headlineLarge: _textStyle.headlineLarge
          .copyWith(color: AppColor.white),
      headlineMedium: _textStyle.headlineMedium
          .copyWith(color: AppColor.white),
      headlineSmall: _textStyle.headlineSmall
          .copyWith(color: AppColor.white),
      titleLarge:
          _textStyle.titleLarge.copyWith(color: AppColor.white),
      titleSmall:
          _textStyle.titleSmall.copyWith(color: AppColor.white),
      titleMedium:
          _textStyle.titleMedium.copyWith(color: AppColor.white),
      labelLarge:
          _textStyle.labelLarge.copyWith(color: AppColor.white),
      labelMedium:
          _textStyle.labelMedium.copyWith(color: AppColor.white),
      labelSmall:
          _textStyle.labelSmall.copyWith(color: AppColor.white),
      bodyLarge:
          _textStyle.bodyLarge.copyWith(color: AppColor.white),
      bodyMedium:
          _textStyle.bodyMedium.copyWith(color: AppColor.white),
      bodySmall:
          _textStyle.bodySmall.copyWith(color: AppColor.white),
    ),
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: AppColor.primarySwatch)
        .copyWith(background: AppColor.backgroundBlack),
  );
}
