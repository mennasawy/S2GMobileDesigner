import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/datetime_picker_formfield.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2BasicDateUDA.dart';

class Temp2DateTimeUDA extends Temp2BasicDateUDA {
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
  String iconName = TEMP2_DATE_TIME;

  Temp2DateTimeUDA({
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
  Widget getDateWidget(BuildContext context) {
    initializeDateFormatting();
    format = DateFormat(
        "dd-MM-yyyy HH:mm", Localizations.localeOf(context).languageCode);
    return Row(
      children: [
        Container(
          // color: WHITE,
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 6),
          decoration: (BoxDecoration(
              color: WHITE,
              border: Border.all(
                color: Main_Dark_Grey,
                width: 0.3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)))),
          child: Icon(Icons.phone_iphone),
        ),
        SizedBox(
          width: 20,
        ),
        addOrDateValueWidget(context),
      ],
    );
  }

  Widget addOrDateValueWidget(BuildContext context) {
    return GestureDetector(
      child: isEmptyText(initialValue)
          ? Icon(Icons.add)
          : Text(
              initialValue,
              style: FontUtils.normalTextStyle(BLACK),
            ),
      onTap: () =>
          onShowPicker(context, DateTime.tryParse('0000-00-00 ' + initialValue))
              .then((value) {
        if (value != null) {
          onValueChange(value.toString());
        }
      }),
    );
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
