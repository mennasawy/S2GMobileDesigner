import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/datetime_picker_formfield.dart';

class TimeWidget extends StatefulWidget {
  final Function onValueChange;
  final String name;
  final DateTime initialTimeValue;

  const TimeWidget(
      {Key key, this.onValueChange, this.name, this.initialTimeValue})
      : super(key: key);
  @override
  _TimeWidgetState createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  TextStyle style(opacity) {
    return TextStyle(
        fontSize: TEXT_FONT_SIZE,
        fontWeight: FontWeight.w700,
        color: Colors.black.withOpacity(opacity));
  }

  _TimeWidgetState();
  final format = DateFormat("hh:mm a");
  Function onShowPicker = (BuildContext context, DateTime currentValue) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
    );
    return DateTimeField.convert(time);
  };
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      decoration: getInputDecoration(
          context,
          widget.name != null ? "enter" + widget.name : '',
          IC_CLOCK_TEXT_FIELD,
          BLUE,
          null),
      format: format,
      initialValue: widget.initialTimeValue,
      onShowPicker: (context, currentValue) {
        return onShowPicker(context, currentValue);
      },
      onChanged: (v) => {
        widget.onValueChange(v.toString().split(' ')[1].split('.')[0]),
      },
    );
  }
}
