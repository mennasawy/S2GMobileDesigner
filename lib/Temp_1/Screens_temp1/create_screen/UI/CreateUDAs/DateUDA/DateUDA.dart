import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/BasicDateUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/BasicTimeUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/DateTimeUDA.dart';
import 'package:flutter/material.dart';

enum DateType {
  dateOnly,
  timeOnly,
  dateAndTime,
}

class DateUDA extends StatelessWidget {
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
  DateUDA({
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
        return BasicDateUDA(
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
        return BasicTimeUDA(
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
        return DateTimeUDA(
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
