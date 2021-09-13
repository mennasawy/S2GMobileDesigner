import 'package:flutter/cupertino.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';

class GenericObjectResponse extends ChangeNotifier {
  GenericObject _savedObject;

  GenericObject get savedObject => _savedObject;

  set savedObject(GenericObject value) {
    _savedObject = value;
    notifyListeners();
  }
}
