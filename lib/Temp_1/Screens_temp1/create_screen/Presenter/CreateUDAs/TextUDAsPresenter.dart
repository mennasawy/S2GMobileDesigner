import 'package:templets/Utilities/Temp2UtilMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum InputType {
  text,
  number,
  email,
}

abstract class TextUDAsViewInterface {
  updateUDAWidget();
}

class TextUDAsPresenter {
  TextUDAsViewInterface view;
  InputType inputType;
  String inputValue;
  final int maxLines;
  InputDecoration inputDecoration;

  String iconName;
  final String inputHint;

  bool isReadOnly = false;
  bool isPassword;
  bool isLocation = false;

  final Function(String) onValueChange;
  TextEditingController textController;

  ArabicNumbers arabicNumber = ArabicNumbers();

  bool isAndroid;
  String text;
  bool isArabicLang = false;

  TextUDAsPresenter(
      {this.view,
      this.maxLines,
      this.inputHint,
      this.onValueChange,
      this.inputType,
      this.inputValue,
      this.inputDecoration,
      this.isReadOnly,
      this.isPassword,
      this.isLocation,
      this.textController,
      this.isArabicLang}) {
    isArabicLang = false;
  }

  initializeItems() {
    isLocation ??= false;
    iconName = isReadOnly == true ? IC_LOCK_FIELD : null;
    textController.text = (inputType == InputType.number && isArabicLang)
        ? arabicNumber.convert(inputValue)
        : inputValue;
    text = inputHint ?? "";
    // if (Platform.isAndroid) {
    //   textController.addListener(() {
    //     final text = textController.text.toLowerCase();
    //     textController.value = textController.value.copyWith(
    //       text: textController.text,
    //       selection:
    //           TextSelection(baseOffset: text.length, extentOffset: text.length),
    //       composing: TextRange.empty,
    //     );
    //   });
    // }
  }

  isInputSecure() {
    return isPassword ?? false;
  }

  inputMaxLines() {
    return maxLines ?? 1;
  }

  onTextValueChange(String value) {
    text = !isEmptyText(value) ? value : inputHint ?? "";
    if (onValueChange != null) onValueChange(textController?.text);
    log(LogType.DEBUG, "input ======== $value");
    view.updateUDAWidget();
  }

  TextInputType getKeyboardType() {
    if (maxLines != null) return TextInputType.multiline;
    switch (inputType) {
      case InputType.number:
        return TextInputType.number;
      case InputType.email:
        return TextInputType.emailAddress;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter> getTextInputFormatters() {
    return (inputType == InputType.number)
        ? <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly]
        : null;
  }

  InputDecoration template1InputDecoration(BuildContext context) {
    return inputDecoration ??
        getInputDecoration(context, inputHint, iconName, null, null);
  }

  InputDecoration template2InputDecoration(BuildContext context) {
    return inputDecoration ??
        temp2InputDecoration(context, inputHint, iconName, null, null);
  }
}
