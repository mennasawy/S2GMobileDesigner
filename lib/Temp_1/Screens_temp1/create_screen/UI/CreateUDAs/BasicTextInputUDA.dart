import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:auto_direction/auto_direction.dart';
import 'package:flutter/material.dart';

class BasicTextInputUDA extends StatefulWidget {
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

  final Function(String) onValueChange;
  final TextEditingController textController;

  BasicTextInputUDA(
      {Key key,
      this.inputType,
      this.inputValue,
      this.maxLines,
      this.udaDescription,
      this.inputDecoration,
      this.title,
      this.inputHint,
      this.validationMessage,
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
  _BasicTextInputUDAState createState() => _BasicTextInputUDAState();
}

class _BasicTextInputUDAState extends State<BasicTextInputUDA>
    implements TextUDAsViewInterface {
  TextUDAsPresenter textUDAPresenter = TextUDAsPresenter();

  @override
  void initState() {
    super.initState();
    initializePresenter();
    textUDAPresenter.initializeItems();
  }

  @override
  void didUpdateWidget(covariant BasicTextInputUDA oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    textUDAPresenter.textController = widget.textController;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 1),
//      height: getScreenHeight(context) * 0.06,
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

  //Draw Widgets Methods
  Widget getTextInputField() {
    return AutoDirection(
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
        decoration: textUDAPresenter.template1InputDecoration(context),
        maxLines: textUDAPresenter.inputMaxLines(),
        style: FontUtils.normalTextStyle(BLACK),
        readOnly: widget.isReadOnly ?? false,
        autocorrect: false,
      ),
    );
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
