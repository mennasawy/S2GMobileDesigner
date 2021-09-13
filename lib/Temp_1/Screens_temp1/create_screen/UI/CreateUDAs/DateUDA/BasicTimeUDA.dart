import 'package:intl/date_symbol_data_local.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/datetime_picker_formfield.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/DateUDA/BasicDateUDA.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicTimeUDA extends BasicDateUDA {
  @override
  final String name;
  final String initialValue;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String udaIcon = IC_CLOCK_TEXT_FIELD;

  var value;
  final bool isVisible;
  final bool isReadOnly;
  final bool isMandatory;
  bool isLocation = false;

  final EdgeInsetsGeometry padding;
  final Function(String) onValueChange;
  var format;

  final InputDecoration dateInputDecoration;

  BasicTimeUDA({
    Key key,
    this.name,
    this.dateInputDecoration,
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
  }) : super(key: key);

  @override
  DateTimeField getDateWidget(BuildContext context) {
    initializeDateFormatting();
    format = DateFormat("HH:mm", Localizations.localeOf(context).languageCode);
    return DateTimeField(
        key: key,
        context: context,
        name: name,
        initialValue: DateTime.tryParse('0000-00-00 ' + initialValue),
        udaIcon: udaIcon,
        canDeleteValue: true,
        format: format,
        onShowPicker: (context, currentValue) {
          return onShowPicker(context, currentValue);
        },
        onChanged: (v) => {
              onValueChange((v != null)
                  ? v.toString().split(' ')[1].split('.')[0]
                  : null),
            },
        enabled: (isReadOnly != null) ? !isReadOnly : true,
        style: FontUtils.normalTextStyle(BLACK),
        dateInputDecoration: dateInputDecoration);
  }

  @override
  Future<DateTime> onShowPicker(
      BuildContext context, DateTime currentValue) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
    );
    return DateTimeField.convert(time);
  }
}
