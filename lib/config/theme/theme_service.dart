import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeService extends ChangeNotifier {
  static const String themeKey = 'theme';
  static const String light = 'light';
  static const String dark = 'dark';
  static const String system = 'system';

  String _currentTheme = system;

  ThemeService() {
    _loadTheme();
  }

  // Getters
  String get currentTheme => _currentTheme;

  ThemeMode get themeMode => loadThemeMode();

  bool get isDarkMode => loadThemeMode() == ThemeMode.dark;

  static bool get isSystemDarkMode =>
      SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;

  // Load theme from storage (you'll need to implement this with your StorageService)
  void _loadTheme() {
    // TODO: Implement with your StorageService
    // _currentTheme = locator<StorageService>().getString(themeKey) ?? system;
    _currentTheme = system; // Default for now
  }

  // Save theme to storage
  Future<void> _saveTheme() async {
    // TODO: Implement with your StorageService
    // await locator<StorageService>().setString(themeKey, _currentTheme);
  }

  ThemeMode loadThemeMode() {
    switch (_currentTheme) {
      case light:
        return ThemeMode.light;
      case dark:
        return ThemeMode.dark;
      case system:
      default:
        return ThemeMode.system; // Let Flutter handle system theme changes
    }
  }

  // Toggle between light and dark themes
  Future<void> toggleTheme() async {
    if (_currentTheme == light) {
      _currentTheme = dark;
    } else if (_currentTheme == dark) {
      _currentTheme = light;
    } else {
      // If system mode, toggle based on current system theme
      _currentTheme = isSystemDarkMode ? light : dark;
    }

    await _saveTheme();
    notifyListeners();
  }

  // Set specific theme
  Future<void> setTheme(String theme) async {
    if (theme == light || theme == dark || theme == system) {
      _currentTheme = theme;
      await _saveTheme();
      notifyListeners();
    }
  }

  // Set system theme
  Future<void> setSystemTheme() async {
    _currentTheme = system;
    await _saveTheme();
    notifyListeners();
  }
}