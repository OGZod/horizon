import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeService {
  ThemeMode get themeMode => loadThemeMode();

  bool get isDarkMode => loadThemeMode() == ThemeMode.dark;

  Future<void> setSystemTheme() async {
    // await locator<StorageService>().clearTheme(); // Remove theme preference
  }

  static const String themeKey = 'theme';
  static const String light = 'light';
  static const String dark = 'dark';
  static const String system = 'system';

  static bool get isSystemDarkMode =>
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

  ThemeMode loadThemeMode() {
    return isSystemDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
