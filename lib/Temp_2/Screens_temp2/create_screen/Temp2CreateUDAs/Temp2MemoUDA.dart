import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';

class Temp2MemoUDA extends Temp2BasicTextInputUDA {
  Key key;

  var inputType;
  String inputValue;
  final double height;
  int maxLines = 6;

  final String title;
  final String inputHint;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;

  bool isValid;
  bool isVisible = true;
  bool isReadOnly = false;
  bool isMandatory = false;
  bool validationCondition = true;
  bool isLocation = false;
  final String labelColor;

  final TextEditingController textController;

  final Function(String) onValueChange;
  final Function(String, bool, bool) onUDAChange;

  Temp2MemoUDA({
    this.key,
    this.height,
    this.onValueChange,
    this.inputType,
    this.labelColor,
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
