import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeMode {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightBg,
    fontFamily: 'DMSans',
    colorScheme: ColorScheme.light(primary: lightBg),
    cardColor: white,
    canvasColor: lightBg,
    primaryColor: black,
    iconTheme: IconThemeData(
      color: Color(0xff4318FF)
    ),
    textSelectionTheme: TextSelectionThemeData(
    ),
    primaryColorLight: cardText,
    dividerColor: lightBg,
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
    canvasColor: cardWithOpacity,
    iconTheme: IconThemeData(
        color: white
    ),
    colorScheme: ColorScheme.dark(primary: darkBg),
    primaryColor: white,
    primaryColorLight: white,
    dividerColor: white,
  );
}