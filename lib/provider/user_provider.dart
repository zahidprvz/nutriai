import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  bool _isRegistered = false;

  bool get isRegistered => _isRegistered;

  void setRegistered(bool value) {
    _isRegistered = value;
    notifyListeners();
  }
}