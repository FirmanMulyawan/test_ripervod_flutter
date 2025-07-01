import 'package:flutter/material.dart';

class AppStyle {
  // 0xFF
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFE50000);
  static const Color green = Color(0xFF009933);
  static const Color white = Color(0xFFFFFFFF);
  static const Color bluePrimary = Color(0xFF239FE7);
  static const Color grey = Color(0xFFCCCCCC);
  static const Color orange = Color(0xFFFF8000);
  static const Color maroon = Color(0xFF890000);

  static const MaterialColor appTheme =
      MaterialColor(_appthemePrimaryValue, <int, Color>{
    50: Color(0xFFFCE4E5),
    100: Color(0xFFF8BCBF),
    200: Color(0xFFF39094),
    300: Color(0xFFEE6469),
    400: Color(0xFFEA4249),
    500: Color(_appthemePrimaryValue),
    600: Color(0xFFE31D24),
    700: Color(0xFFDF181F),
    800: Color(0xFFDB1419),
    900: Color(0xFFD50B0F),
  });
  static const int _appthemePrimaryValue = 0xFFE62129;

// =========== Rubik
  static TextStyle rubikLight({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Rubik",
        fontWeight: FontWeight.w300);
  }

  static TextStyle rubikRegular({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Rubik",
        fontWeight: FontWeight.normal);
  }

  static TextStyle rubikMedium({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Rubik",
        fontWeight: FontWeight.w500);
  }

  static TextStyle rubikSemiBold({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Rubik",
        fontWeight: FontWeight.w600);
  }

  static TextStyle rubikBold({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Rubik",
        fontWeight: FontWeight.w700);
  }

  static TextStyle rubikExtraBold({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Rubik",
        fontWeight: FontWeight.w800);
  }

  // =========== Roboto
  static TextStyle robotoLight({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w300);
  }

  static TextStyle robotoRegular({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Roboto",
        fontWeight: FontWeight.normal);
  }

  static TextStyle robotoMedium({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w500);
  }

  static TextStyle robotoSemiBold({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w600);
  }

  static TextStyle robotoBold({Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w700);
  }

  static TextStyle robotoExtraBold(
      {Color textColor = black, double size = 14}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w800);
  }

// =========== Poppins
  static TextStyle poppinsRegular(
      {Color textColor = bluePrimary, double size = 36}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.normal);
  }

  static TextStyle poppinsMedium(
      {Color textColor = bluePrimary, double size = 36}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w500);
  }

  static TextStyle poppinsSemiBold(
      {Color textColor = bluePrimary, double size = 36}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w600);
  }

  static TextStyle poppinsBold(
      {Color textColor = bluePrimary, double size = 36}) {
    return TextStyle(
        fontSize: size,
        color: textColor,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w700);
  }
}
