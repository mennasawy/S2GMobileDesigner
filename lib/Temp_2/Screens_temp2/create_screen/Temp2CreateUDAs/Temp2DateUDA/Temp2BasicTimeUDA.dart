import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/datetime_picker_formfield.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2DateUDA/Temp2BasicDateUDA.dart';

class Temp2BasicTimeUDA extends Temp2BasicDateUDA {
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
  String iconName = TEMP2_TIME;

  Temp2BasicTimeUDA({
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
    format = DateFormat("HH:mm", Localizations.localeOf(context).languageCode);
    return Row(
      children: [
        Icon(Icons.phone_iphone),
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
          onValueChange((value != null)
              ? value.toString().split(' ')[1].split('.')[0]
              : null);
        }
      }),
    );
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
