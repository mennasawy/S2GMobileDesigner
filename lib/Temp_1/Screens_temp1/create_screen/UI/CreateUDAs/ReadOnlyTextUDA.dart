import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';

class ReadOnlyTextUDA extends StatefulWidget {
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

  ReadOnlyTextUDA({
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
  _ReadOnlyTextUDAState createState() => _ReadOnlyTextUDAState();
}

class _ReadOnlyTextUDAState extends State<ReadOnlyTextUDA> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    textController.text = widget.inputValue ?? '';
  }

  @override
  void didUpdateWidget(ReadOnlyTextUDA oldWidget) {
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
            widget.title,
            widget.udaDescription,
            widget.validationMessage,
            widget.isValidationMSGWarning,
            widget.isMandatory,
            hexToColor(widget.labelColor)),
      ),
    );
  }

  //TODO: Draw Widgets Methods
  TextFormField getTextInputField() {
    return TextFormField(
      key: widget.key,
      autofocus: false,
      controller: textController,
      onChanged: (String value) => widget.onValueChange(value),
      style: normalTextStyle,
      decoration: getInputDecoration(
          context, widget.inputHint, IC_LOCK_FIELD, null, null),
      enabled: false,
    );
  }
}
