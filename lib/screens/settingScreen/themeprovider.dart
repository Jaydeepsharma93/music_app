import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDark = false;

  void onChange(value) {
    isDark = value;
    notifyListeners();
  }
}
