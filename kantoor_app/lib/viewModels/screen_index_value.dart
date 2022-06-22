import 'package:flutter/foundation.dart';

class ScreenIndexProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void setCurrentIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
