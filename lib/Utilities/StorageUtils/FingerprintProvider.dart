import 'package:flutter/cupertino.dart';

class FingerPrintProvider extends ChangeNotifier{
  bool  _isAuthorized = false;

  bool get isAuthorized => _isAuthorized;

  set isAuthorized(bool value) {
    _isAuthorized = value;
    notifyListeners();
  }

}