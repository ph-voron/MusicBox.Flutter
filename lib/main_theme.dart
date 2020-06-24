import 'package:flutter/material.dart';

class MainTheme {

  static const Color colorPrimary = Color(0xffd83a3a);
  static const Color colorPrimaryDark = Color(0xffc23434);
  static const Color colorSecondary = Color(0xfff8f8f8);
  static const Color colorSecondaryDark = Color(0xffcecece);

  static const Color colorAction = Color(0xff2edb80);
  static const Color colorActionAccent = Color(0xff32e687);
  static const Color colorSecondaryAction = Color(0xff5c90ae);
  static const Color colorGray1 = Color(0xfff8f8f8);
  static const Color colorGray2 = Color(0xffefefef);
  static const Color colorGray3 = Color(0xffcecece);

  static ThemeData get theme {
    final themeData = ThemeData.dark();
    final textTheme = themeData.textTheme;
    final body1 = textTheme.body1.copyWith(decorationColor: Colors.transparent);

    return ThemeData.dark().copyWith(
      primaryColor: Colors.grey[800],
      accentColor: Colors.cyan[300],
      buttonColor: Colors.grey[800],
      textSelectionColor: Colors.cyan[100],
      toggleableActiveColor: Colors.cyan[300],
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.cyan[300],
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: themeData.dialogBackgroundColor,
        contentTextStyle: body1,
        actionTextColor: Colors.cyan[300],
      ),
      textTheme: textTheme.copyWith(
        body1: body1,
      ),
    );
  }
}