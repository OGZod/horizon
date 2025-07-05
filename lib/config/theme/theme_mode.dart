import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeMode {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightBg,
    fontFamily: 'DMSans',
    colorScheme: ColorScheme.light(primary: lightBg),
    cardColor: white,
    primaryColor: black,
    textSelectionTheme: TextSelectionThemeData(
    ),
    primaryColorLight: white,
    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(backgroundColor: white),
    highlightColor: white,
  );

  static final darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
    ),
    fontFamily: 'DMSans',
    scaffoldBackgroundColor: darkBg,
    cardColor: card,
    colorScheme: ColorScheme.dark(primary: darkBg),
    primaryColor: white,
    dividerColor: white,
  );
}