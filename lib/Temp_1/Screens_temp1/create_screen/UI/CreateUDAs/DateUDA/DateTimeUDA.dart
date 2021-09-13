import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/datetime_picker_formfield.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/BasicDateUDA.dart';
import 'package:flutter/material.dart';

class DateTimeUDA extends BasicDateUDA {
  @override
  final String name;
  final String initialValue;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String udaIcon = BTTN_DAYS_AND_HOURS;

  var value;
  final bool isVisible;
  final bool isReadOnly;
  final bool isMandatory;
  bool isLocation = false;

  final EdgeInsetsGeometry padding;
  final Function(String) onValueChange;
  var format;

  final InputDecoration dateInputDecoration;

  DateTimeUDA({
    Key key,
    this.name,
    this.onValueChange,
    this.udaDescription,
    this.initialValue,
    this.padding,
    this.isReadOnly,
    this.isMandatory,
    this.isVisible,
    this.isLocation,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.dateInputDecoration,
  }) : super(key: key);

  @override
  DateTimeField getDateWidget(BuildContext context) {
    initializeDateFormatting();
    format = DateFormat(
        "dd-MM-yyyy HH:mm", Localizations.localeOf(context).languageCode);
    return DateTimeField(
        key: key,
        context: context,
        name: name,
        initialValue: DateTime.tryParse(initialValue),
        udaIcon: udaIcon,
        canDeleteValue: true,
        format: format,
        onShowPicker: (context, currentValue) {
          return onShowPicker(context, currentValue);
        },
        onChanged: (v) => {
              onValueChange(v.toString()),
            },
        enabled: (isReadOnly != null) ? !isReadOnly : true,
        style: FontUtils.normalTextStyle(BLACK),
        dateInputDecoration: dateInputDecoration);
  }

  @override
  Future<DateTime> onShowPicker(
      BuildContext context, DateTime currentValue) async {
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: currentValue ?? DateTime.now(),
        lastDate: DateTime(2100));
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
      );
      return DateTimeField.combine(date, time);
    } else {
      return currentValue;
    }
  }
}
