import 'package:flutter/material.dart';

class LoginIndexProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndexValue(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
