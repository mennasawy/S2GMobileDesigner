import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';

// enum InputType {
//   text,
//   number,
//   email,
// }

class Temp2BasicTextInputUDA extends StatefulWidget {
  InputType inputType;
  String inputValue;
  final int maxLines;
  String udaDescription;
  final String labelColor;
  InputDecoration inputDecoration;

  String iconName;
  final String title;
  final String inputHint;
  String validationMessage;
  bool isValidationMSGWarning;

  bool isVisible = true;
  bool isReadOnly = false;
  bool isMandatory = false;
  bool validationCondition = true;
  bool isUserName;
  bool isPassword;
  bool isLocation = false;
  bool isValidContent;

  final Function(String) onValueChange;
  final TextEditingController textController;

  Temp2BasicTextInputUDA(
      {Key key,
      this.inputType,
      this.inputValue,
      this.maxLines,
      this.udaDescription,
      this.inputDecoration,
      this.title,
      this.inputHint,
      this.validationMessage,
      this.isValidContent,
      this.isVisible,
      this.isReadOnly,
      this.isMandatory,
      this.validationCondition,
      this.isValidationMSGWarning,
      this.isUserName,
      this.isPassword,
      this.onValueChange,
      this.labelColor,
      this.isLocation,
      this.textController})
      : super(key: key);

  @override
  _Temp2BasicTextInputUDAState createState() => _Temp2BasicTextInputUDAState();
}

class _Temp2BasicTextInputUDAState extends State<Temp2BasicTextInputUDA>
    implements TextUDAsViewInterface {
  TextUDAsPresenter textUDAPresenter = TextUDAsPresenter();

  @override
  void initState() {
    super.initState();
    initializePresenter();
    textUDAPresenter.initializeItems();
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
  Widget getTextInputField() {
    return Temp2WidgetBorder(
      title: widget.title,
      isMandatoryUDA: widget.isMandatory,
      child: AutoDirection(
        onDirectionChange: (isRTL) {
          log(LogType.DEBUG, "Direction... ${isRTL.toString()}");
          textUDAPresenter.isArabicLang = isRTL;
        },
        text: textUDAPresenter.text,
        child: TextField(
          key: widget.key,
          controller: textUDAPresenter.textController,
          onChanged: textUDAPresenter.onTextValueChange,
          obscureText: textUDAPresenter.isInputSecure(),
          keyboardType: textUDAPresenter.getKeyboardType(),
          inputFormatters: textUDAPresenter.getTextInputFormatters(),
          decoration: textUDAPresenter.template2InputDecoration(context),
          maxLines: textUDAPresenter.inputMaxLines(),
          style: FontUtils.normalTextStyle(BLACK),
          readOnly: widget.isReadOnly ?? false,
          autocorrect: false,
        ),
      ),
    );
  }

  TextInputType getKeyboardType() {
    if (widget.maxLines != null) return TextInputType.multiline;
    switch (widget.inputType) {
      case InputType.number:
        return TextInputType.number;
      case InputType.email:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  initializePresenter() {
    textUDAPresenter = TextUDAsPresenter(
      view: this,
      maxLines: widget.maxLines,
      inputHint: widget.inputHint,
      onValueChange: widget.onValueChange,
      inputType: widget.inputType,
      inputValue: widget.inputValue,
      inputDecoration: widget.inputDecoration,
      isReadOnly: widget.isReadOnly,
      isPassword: widget.isPassword,
      isLocation: widget.isLocation,
      textController: widget.textController ?? TextEditingController(),
    );
  }

  @override
  updateUDAWidget() {
    setState(() {});
  }
}
