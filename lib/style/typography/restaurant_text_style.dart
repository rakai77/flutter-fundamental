import 'package:flutter/widgets.dart';

class RestaurantTextStyle {
  static const TextStyle _fontStyle = TextStyle(fontFamily: 'Poppins');

  /// displayLarge Text Style
  static TextStyle displayLarge = _fontStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    height: 1.11,
    letterSpacing: -2,
  );

  /// displayMedium Text Style
  static TextStyle displayMedium = _fontStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w600,
    height: 1.17,
    letterSpacing: -1,
  );

  /// displaySmall Text Style
  static TextStyle displaySmall = _fontStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: -1,
  );

  /// headlineLarge Text Style
  static TextStyle headlineLarge = _fontStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: -1,
  );

  /// headlineMedium Text Style
  static TextStyle headlineMedium = _fontStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: -1,
  );

  /// headlineMedium Text Style
  static TextStyle headlineSmall = _fontStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 1.0,
    letterSpacing: -1,
  );

  /// titleLarge Text Style
  static TextStyle titleLarge = _fontStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// titleMedium Text Style
  static TextStyle titleMedium = _fontStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// titleSmall Text Style
  static TextStyle titleSmall = _fontStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// bodyLargeBold Text Style
  static TextStyle bodyLargeBold = _fontStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.56,
  );

  /// bodyLargeMedium Text Style
  static TextStyle bodyLargeMedium = _fontStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.56,
  );

  /// bodyLargeRegular Text Style
  static TextStyle bodyLargeRegular = _fontStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.56,
  );

  /// labelLarge Text Style
  static TextStyle labelLarge = _fontStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.71,
    letterSpacing: 1.3,
  );

  /// labelMedium Text Style
  static TextStyle labelMedium = _fontStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.4,
    letterSpacing: 1.3,
  );

  /// labelSmall Text Style
  static TextStyle labelSmall = _fontStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w100,
    height: 1.2,
    letterSpacing: 1.3,
  );
}
