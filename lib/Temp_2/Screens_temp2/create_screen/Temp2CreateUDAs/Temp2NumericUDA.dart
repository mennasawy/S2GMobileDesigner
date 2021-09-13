import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';

class Temp2NumericUDA extends Temp2BasicTextInputUDA {
  Key key;

  String inputValue;
  var inputType = InputType.number;

  final String title;
  final String inputHint;
  final String labelColor;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;

  bool isValid;
  bool isVisible = true;
  bool isLocation = false;
  bool isReadOnly = false;
  bool isMandatory = false;
  bool validationCondition = true;

  final TextEditingController textController;

  final Function(String) onValueChange;
  final Function(String, bool, bool) onUDAChange;

  Temp2NumericUDA({
    this.labelColor,
    this.key,
    this.onValueChange,
    this.inputValue,
    this.inputHint,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.udaDescription,
    this.isReadOnly,
    this.isVisible,
    this.isMandatory,
    this.isLocation,
    this.title,
    this.onUDAChange,
    this.textController,
  });
}
