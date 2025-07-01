import 'package:flutter/material.dart';

import 'app_style.dart';

class AppTheme {
  final colorPrimary50 = AppStyle.white;
  final colorPrimary100 = AppStyle.white;
  final colorPrimary200 = AppStyle.white;
  final colorPrimary300 = AppStyle.white;
  final colorPrimary400 = AppStyle.white;
  final colorPrimary500 = AppStyle.white;
  final colorPrimary600 = AppStyle.white;
  final colorPrimary700 = AppStyle.white;
  final colorPrimary800 = AppStyle.white;
  final colorPrimary900 = AppStyle.white;

  final backgroundColor1 = const Color(0xffFFFFFF);
  final backgroundColor2 = const Color(0xfff2f2f2);
  final backgroundAlternativeColor1 = const Color(0xff0A0A0A);
  final textColor1 = const Color(0xff262626);
  final textColor2 = const Color(0xff2D2D2D);
  final textColor3 = const Color(0xff0A0A0A);
  final textAlternativeColor1 = const Color(0xffFFFFFF);

  final borderColor = const Color(0xffBFC2C4);
  final borderColor2 = const Color(0xff585858);

  Color get labelTextColor => textColor2;

  final dividerColor = const Color(0xffBFC2C4);

  final loginTitleFontSize = 14.0;

  Color get errorColor => colorPrimary500;

  final textButtonDisabledColor = const Color(0xffBFC2C4);

  OutlineInputBorder inputBorderTheme() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 1),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }

  ThemeData themeData() {
    return ThemeData(
        useMaterial3: true,
        textSelectionTheme: TextSelectionThemeData(
          // cursorColor: AppStyle.bluePrimary,
          selectionColor: AppStyle.bluePrimary.withOpacity(0.2),
          selectionHandleColor: AppStyle.bluePrimary,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: MaterialColor(
            AppStyle.bluePrimary.value,
            {
              50: colorPrimary50,
              100: colorPrimary100,
              200: colorPrimary200,
              300: colorPrimary300,
              400: colorPrimary400,
              500: colorPrimary500,
              600: colorPrimary600,
              700: colorPrimary700,
              800: colorPrimary800,
              900: colorPrimary900,
            },
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: inputBorderTheme(),
          focusedBorder: inputBorderTheme(),
          floatingLabelStyle: TextStyle(
            color: labelTextColor,
            fontWeight: FontWeight.w500,
          ),
          labelStyle: TextStyle(
            color: labelTextColor,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: const TextStyle(
            color: Color(0xff686D71),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(44),
            disabledForegroundColor: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            side: BorderSide(
              color: textColor3,
            ),
            foregroundColor: textColor3,
            minimumSize: const Size.fromHeight(44),
            disabledForegroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            disabledForegroundColor: textButtonDisabledColor,
          ),
        ));
  }
}
