import 'package:flutter/foundation.dart';

class LocationSelectedProvider extends ChangeNotifier {
  String _location = "Bandung";
  String get location => _location;

  setLocationSelected(String location) {
    _location = location;
    notifyListeners();
  }
}
