import 'package:flutter/material.dart';
import 'package:templets/Utilities/Temp2UtilMethods.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2ReadOnlyTextUDA extends StatefulWidget {
  String inputValue;
  String udaDescription;
  final String labelColor;
  final String title;
  final String inputHint;
  final String validationMessage;
  final bool isValidationMSGWarning;

  bool isVisible = true;
  bool isMandatory = false;
  bool isLocation = false;
  bool validationCondition = true;

  final Function(String) onValueChange;

  Temp2ReadOnlyTextUDA({
    Key key,
    this.onValueChange,
    this.inputValue,
    this.udaDescription,
    this.inputHint,
    this.labelColor,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.isVisible,
    this.isMandatory,
    this.isLocation,
    this.title,
  }) : super(key: key);

  @override
  _Temp2ReadOnlyTextUDAState createState() => _Temp2ReadOnlyTextUDAState();
}

class _Temp2ReadOnlyTextUDAState extends State<Temp2ReadOnlyTextUDA> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.inputValue ?? '';
  }

  @override
  void didUpdateWidget(Temp2ReadOnlyTextUDA oldWidget) {
    super.didUpdateWidget(oldWidget);
    textController.text = widget.inputValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: drawWidgetOrEmptyContainer(
        widget.isVisible == true && widget.isLocation != true,
        getUDAWithTitleWidget(
            context,
            getTextInputField(),
            "",
            widget.udaDescription,
            widget.validationMessage,
            widget.isValidationMSGWarning,
            widget.isMandatory,
            hexToColor(widget.labelColor)),
      ),
    );
  }

  //TODO: Draw Widgets Methods
  Temp2WidgetBorder getTextInputField() {
    return Temp2WidgetBorder(
      isMandatoryUDA: widget.isMandatory,
      title: widget.title,
      labelColor: hexToColor(widget.labelColor) ?? Main_Dark_Grey,
      child: TextFormField(
        key: widget.key,
        autofocus: false,
        controller: textController,
        onChanged: (String value) => widget.onValueChange(value),
        style: normalTextStyle,
        decoration:
            temp2InputDecoration(context, "", IC_LOCK_FIELD, null, null),
        enabled: false,
      ),
    );
  }
}
