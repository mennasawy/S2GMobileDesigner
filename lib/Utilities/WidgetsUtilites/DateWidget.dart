import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/datetime_picker_formfield.dart';

class DateWidget extends StatefulWidget {
  final Function onValueChange;
  final String hintText;
  final DateTime initialDateValue;
  final bool enabled;
  final InputDecoration dateInputDecoration;

  const DateWidget(
      {Key key,
      this.onValueChange,
      this.hintText,
      this.initialDateValue,
      this.enabled,
      this.dateInputDecoration})
      : super(key: key);
  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  _DateWidgetState();
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      enabled: (widget.enabled != null) ? widget.enabled : true,
      dateInputDecoration: widget.dateInputDecoration ??
          getInputDecoration(
              context, widget.hintText ?? '', IC_CALENDER_TEXT, BLUE, null),
      udaIcon: IC_CALENDER_TEXT,
      canDeleteValue: false,
      format: format,
      initialValue: widget.initialDateValue,
      onShowPicker: (context, currentValue) {
        return onShowPicker(context, currentValue);
      },
      onChanged: (v) => {
        widget.onValueChange(v.toString().split(' ')[0]),
      },
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
