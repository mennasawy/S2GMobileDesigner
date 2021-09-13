import 'package:intl/date_symbol_data_local.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BasicDateUDA extends StatelessWidget {
  final String name;
  final String initialValue;
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String udaIcon = IC_CALENDER_TEXT;
  final String labelColor;
  var value;
  final bool isVisible;
  final bool isReadOnly;
  final bool isMandatory;
  bool isLocation = false;

  final EdgeInsetsGeometry padding;
  final Function(String) onValueChange;
  var format;
  final InputDecoration dateInputDecoration;

  BasicDateUDA({
    Key key,
    this.name,
    this.onValueChange,
    this.initialValue,
    this.udaDescription,
    this.padding,
    this.isReadOnly,
    this.isMandatory,
    this.isVisible,
    this.isLocation,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.labelColor,
    this.dateInputDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        isVisible == true && isLocation != true,
        getUDAWithTitleWidget(
            context,
            getDateWidget(context),
            name,
            udaDescription,
            validationMessage,
            isValidationMSGWarning,
            isMandatory,
            hexToColor(labelColor)));
  }

  DateTimeField getDateWidget(BuildContext context) {
    initializeDateFormatting();
    format =
        DateFormat("dd-MM-yyyy", Localizations.localeOf(context).languageCode);
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
        onValueChange(v.toString().split(' ')[0]),
      },
      enabled: (isReadOnly != null) ? !isReadOnly : true,
      style: FontUtils.normalTextStyle(BLACK),
      dateInputDecoration: dateInputDecoration,
    );
  }

  Future<DateTime> onShowPicker(
      BuildContext context, DateTime currentValue) async {
    return showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: currentValue ?? DateTime.now(),
        lastDate: DateTime(2100));
  }
}
