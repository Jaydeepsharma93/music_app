import 'package:flutter/material.dart';

class IndexProvider extends ChangeNotifier {
  int Index=0;

  void onChangeIndex(index) {
    Index = index;
    notifyListeners();
  }
}
