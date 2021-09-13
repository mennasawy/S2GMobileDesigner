import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2BasicDateUDA extends StatelessWidget {
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
  String iconName = TEMP2_DATE;

  Temp2BasicDateUDA({
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

  Widget getDateWidget(BuildContext context) {
    initializeDateFormatting();
    format =
        DateFormat("dd-MM-yyyy", Localizations.localeOf(context).languageCode);
    return Row(
      children: [
        GestureDetector(
          child: Icon(Icons.phone_iphone),
          onTap: () => onShowPicker(context, DateTime.tryParse(initialValue)),
        ),
        SizedBox(
          width: 15,
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
          onShowPicker(context, DateTime.tryParse(initialValue)).then((value) {
        if (value != null) onValueChange(value.toString().split(' ')[0]);
      }),
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
