import 'package:flutter/material.dart';

class ThemeHelper {
  ThemeData lightTheme = ThemeData(
    iconTheme: const IconThemeData(color: Colors.black),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xff981A1E),
    ),
    //scaffoldBackgroundColor: Color(0xfff9f2d5),
    fontFamily: 'Cairo',
    colorScheme: const ColorScheme.light(
      primary: Color(0xff056D38),
      secondary: Color(0xff283255),
      background: Color(0xff69A0C7),
      brightness: Brightness.light,
      primaryContainer: Color(0xff174459),
      secondaryContainer: Color(0xfff9f2d5),
    ),
  );
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff181A20),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: const ColorScheme.dark(
      background: Colors.white,
      primaryContainer: Color(0xff1F222A),
      primary: Color(0xfff9f2d5),
      secondary: Color(0xffd6bf97),
      brightness: Brightness.dark,
      // background: Colors.
    ),
  );
}
