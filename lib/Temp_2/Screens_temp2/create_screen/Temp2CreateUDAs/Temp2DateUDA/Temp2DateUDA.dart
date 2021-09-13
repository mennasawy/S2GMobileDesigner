import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/DateUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2BasicDateUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2BasicTimeUDA.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2DateTimeUDA.dart';

class Temp2DateUDA extends StatelessWidget {
  final bool isVisible;
  final bool isReadOnly;
  final bool isMandatory;
  bool isLocation = false;

  final String name;
  final String initialValue;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String labelColor;

  final DateType dateType;
  final EdgeInsetsGeometry padding;
  final Function(String) onValueChange;

  final InputDecoration dateInputDecoration;
  Temp2DateUDA({
    Key key,
    this.dateType,
    this.name,
    this.isLocation,
    this.labelColor,
    @required this.onValueChange,
    this.initialValue,
    this.udaDescription,
    this.padding,
    this.isReadOnly,
    this.isMandatory,
    this.isVisible,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.dateInputDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: getDateUDAWidget());
  }

  Widget getDateUDAWidget() {
    switch (dateType) {
      case DateType.dateOnly:
        return Temp2BasicDateUDA(
            key: key,
            name: name,
            onValueChange: onValueChange,
            udaDescription: udaDescription,
            initialValue: initialValue,
            padding: padding,
            isReadOnly: isReadOnly,
            isMandatory: isMandatory,
            isVisible: isVisible,
            isLocation: isLocation,
            validationMessage: validationMessage,
            isValidationMSGWarning: isValidationMSGWarning,
            dateInputDecoration: dateInputDecoration);
        break;
      case DateType.timeOnly:
        return Temp2BasicTimeUDA(
            key: key,
            name: name,
            onValueChange: onValueChange,
            udaDescription: udaDescription,
            initialValue: initialValue,
            padding: padding,
            isReadOnly: isReadOnly,
            isMandatory: isMandatory,
            isVisible: isVisible,
            isLocation: isLocation,
            validationMessage: validationMessage,
            isValidationMSGWarning: isValidationMSGWarning,
            dateInputDecoration: dateInputDecoration);
      case DateType.dateAndTime:
        return Temp2DateTimeUDA(
            key: key,
            name: name,
            onValueChange: onValueChange,
            udaDescription: udaDescription,
            initialValue: initialValue,
            padding: padding,
            isReadOnly: isReadOnly,
            isMandatory: isMandatory,
            isVisible: isVisible,
            isLocation: isLocation,
            validationMessage: validationMessage,
            isValidationMSGWarning: isValidationMSGWarning,
            dateInputDecoration: dateInputDecoration);
      default:
        return Container();
    }
  }
}
