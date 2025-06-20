import 'package:flutter/material.dart';

const Color blackBottomSheet = Color(0xff1f2a37);
const Color blackPopUp = Color(0xff1f2a37);
const Color primaryLine = Color(0xff6D6C69);
const Color primaryWhite = Colors.white;
const Color splashBackground = Color(0xfffd7000);
const Color snackBarBackground = Color(0xffDAF8E6);

/* Primary */
const Color primary50 = Color(0xffffefed);
const Color primary100 = Color(0xffffcfc6);
const Color primary200 = Color(0xffffb7aa);
const Color primary300 = Color(0xffff9684);
const Color primary400 = Color(0xffff826c);
const Color primary500 = Color(0xffff6347);
const Color primary600 = Color(0xffe85a41);
const Color primary700 = Color(0xffb54632);
const Color primary800 = Color(0xff8c3627);
const Color primary900 = Color(0xff6b2a1e);

/* Secondary */
const Color secondary50 = Color(0xfffff9e6);
const Color secondary100 = Color(0xffffeeb0);
const Color secondary200 = Color(0xffffe58a);
const Color secondary300 = Color(0xffffd954);
const Color secondary400 = Color(0xffffd233);
const Color secondary500 = Color(0xffffc700);
const Color secondary600 = Color(0xffe8b500);
const Color secondary700 = Color(0xffb58d00);
const Color secondary800 = Color(0xff8c6d00);
const Color secondary900 = Color(0xff6b5400);

/* Green */
const Color green50 = Color(0xffe7f9f5);
const Color green100 = Color(0xffb6ecde);
const Color green200 = Color(0xff92e3cf);
const Color green300 = Color(0xff61d6b9);
const Color green400 = Color(0xff42ceab);
const Color green500 = Color(0xff13c296);

const Color green600 = Color(0xff11b189);
const Color green700 = Color(0xff0d8a6b);
const Color green800 = Color(0xff0a6b53);
const Color green900 = Color(0xff08513f);

/* Neutral */
const Color neutral50 = Color(0xffe9eaeb);
const Color neutral100 = Color(0xffbabdc1);
const Color neutral200 = Color(0xff989da3);
const Color neutral300 = Color(0xff697079);
const Color neutral400 = Color(0xff4c555f);
const Color neutral500 = Color(0xff1f2a37);
const Color neutral600 = Color(0xff1c2632);
const Color neutral700 = Color(0xff161e27);
const Color neutral800 = Color(0xff11171e);
const Color neutral900 = Color(0xff0d1217);

class FigmaTextStyles {
  const FigmaTextStyles();

  /// Returns a [TextStyle] with regular weight, 12px font size.
  ///
  /// This style is typically used for small text elements.
  ///
  /// @returns [TextStyle] with regular weight and 12px font size.
  TextStyle get regular12px => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 12 / 12,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with medium weight, 12px font size.
  ///
  /// This style is typically used for small text elements that need to stand out slightly more.
  ///
  /// @returns [TextStyle] with medium weight and 12px font size.
  TextStyle get medium12px => const TextStyle(
        fontSize: 12,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-Medium',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        height: 12 / 12,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with regular weight, 16px font size.
  ///
  /// This style is typically used for standard text elements.
  ///
  /// @returns [TextStyle] with regular weight and 16px font size.
  TextStyle get regular16px => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 16 / 16,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with semi-bold weight, 16px font size.
  ///
  /// This style is typically used for text elements that need to stand out more.
  ///
  /// @returns [TextStyle] with semi-bold weight and 16px font size.
  TextStyle get semiBold16px => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-SemiBold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        height: 16 / 16,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with light weight, 16px font size.
  ///
  /// This style is typically used for text elements that need a lighter appearance.
  ///
  /// @returns [TextStyle] with light weight and 16px font size.
  TextStyle get light16px => const TextStyle(
        fontSize: 16,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-Light',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w300,
        height: 24 / 16,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with semi-bold weight, 18px font size.
  ///
  /// This style is typically used for slightly larger text elements that need to stand out.
  ///
  /// @returns [TextStyle] with semi-bold weight and 18px font size.
  TextStyle get semiBold18px => const TextStyle(
        fontSize: 18,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-SemiBold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        height: 18 / 18,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with regular weight, 18px font size.
  ///
  /// This style is typically used for slightly larger standard text elements.
  ///
  /// @returns [TextStyle] with regular weight and 18px font size.
  TextStyle get regular18px => const TextStyle(
        fontSize: 18,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 18 / 18,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with regular weight, 22px font size.
  ///
  /// This style is typically used for larger text elements.
  ///
  /// @returns [TextStyle] with regular weight and 22px font size.
  TextStyle get regular22px => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-Regular',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        height: 22 / 22,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with semi-bold weight, 22px font size.
  ///
  /// This style is typically used for larger text elements that need to stand out.
  ///
  /// @returns [TextStyle] with semi-bold weight and 22px font size.
  TextStyle get semiBold22px => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-SemiBold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        height: 22 / 22,
        letterSpacing: 0,
      );

  /// Returns a [TextStyle] with semi-bold weight, 22px font size, and 5% letter spacing.
  ///
  /// This style is typically used for larger text elements that need to stand out with increased letter spacing.
  ///
  /// @returns [TextStyle] with semi-bold weight, 22px font size, and 5% letter spacing.
  TextStyle get semiBold5per22px => const TextStyle(
        fontSize: 22,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-SemiBold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        height: 22 / 22,
        letterSpacing: 5,
      );

  /// Returns a [TextStyle] with bold weight, 30px font size, and 5% letter spacing.
  ///
  /// This style is typically used for very large text elements that need to stand out significantly.
  ///
  /// @returns [TextStyle] with bold weight, 30px font size, and 5% letter spacing.
  TextStyle get bold5per30px => const TextStyle(
        fontSize: 30,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-Bold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w700,
        height: 30 / 30,
        letterSpacing: 5,
      );

  /// Returns a [TextStyle] with semi-bold weight, 40px font size.
  ///
  /// This style is typically used for very large text elements that need to stand out.
  ///
  /// @returns [TextStyle] with semi-bold weight and 40px font size.
  TextStyle get semiBold40px => const TextStyle(
        fontSize: 40,
        decoration: TextDecoration.none,
        fontFamily: 'Roboto-SemiBold',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        height: 40 / 40,
        letterSpacing: 0,
      );
}
