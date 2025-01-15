import 'package:flutter/material.dart';
import 'package:restaurant_app/style/color/restaurant_colors.dart';
import 'package:restaurant_app/style/typography/restaurant_text_style.dart';

class RestaurantTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: RestaurantColors.yellow.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        colorSchemeSeed: RestaurantColors.yellow.color,
        brightness: Brightness.dark,
        textTheme: _textTheme,
        useMaterial3: true,
        appBarTheme: _appBarTheme
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: RestaurantTextStyle.displayLarge,
      displayMedium: RestaurantTextStyle.displayMedium,
      displaySmall: RestaurantTextStyle.displaySmall,
      headlineLarge: RestaurantTextStyle.headlineLarge,
      headlineMedium: RestaurantTextStyle.headlineMedium,
      headlineSmall: RestaurantTextStyle.headlineSmall,
      titleLarge: RestaurantTextStyle.titleLarge,
      titleMedium: RestaurantTextStyle.titleMedium,
      titleSmall: RestaurantTextStyle.titleSmall,
      bodyLarge: RestaurantTextStyle.bodyLargeBold,
      bodyMedium: RestaurantTextStyle.bodyLargeMedium,
      bodySmall: RestaurantTextStyle.bodyLargeRegular,
      labelLarge: RestaurantTextStyle.labelLarge,
      labelMedium: RestaurantTextStyle.labelMedium,
      labelSmall: RestaurantTextStyle.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: _textTheme.titleLarge,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        )
      )
    );
  }

}