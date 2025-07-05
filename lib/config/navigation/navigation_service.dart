import 'package:flutter/material.dart';

class NavigationService extends ChangeNotifier {
  int _currentIndex = 0;
  String _currentPage = 'Dashboard';

  int get currentIndex => _currentIndex;

  String get currentPage => _currentPage;

  Future<void> setIndex(int index, String page) async {
    _currentIndex = index;
    _currentPage = page;
    notifyListeners();
  }
}