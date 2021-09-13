import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class QRScannerUDA extends StatefulWidget {
  String inputHint;
  String inputValue;
  InputType inputType;
  String udaDescription;
  final String labelColor;

  final String title;
  final String validationMessage;
  final bool isValidationMSGWarning;

  bool isVisible = true;
  bool isReadOnly = false;
  bool isMandatory = false;
  bool validationCondition = true;
  bool location = false;

  final Function(String) onValueChange;

  QRScannerUDA({
    Key key,
    this.inputHint,
    this.inputValue,
    this.labelColor,
    this.inputType,
    this.udaDescription,
    this.title,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.isVisible,
    this.isReadOnly,
    this.isMandatory,
    this.validationCondition,
    this.onValueChange,
  }) : super(key: key);

  @override
  _QRScannerUDAState createState() => _QRScannerUDAState();
}

class _QRScannerUDAState extends State<QRScannerUDA> {
  String iconName;
  String errorMessage = '';
  bool hadErrorMsg = false;

  @override
  void initState() {
    super.initState();
    //Separate ..
    iconName = widget.isReadOnly == true ? IC_LOCK_FIELD : IC_QRSCANNER;
  }

  @override
  Widget build(BuildContext context) {
    log(LogType.DEBUG, "QR Scanner input === ${widget.inputValue}");
    return Center(
      child: drawWidgetOrEmptyContainer(
          widget.isVisible == true,
          getUDAWithTitleWidget(
              context,
              getQRScannerWidget(),
              widget.title,
              widget.udaDescription,
              widget.validationMessage,
              widget.isValidationMSGWarning,
              widget.isMandatory,
              hexToColor(widget.labelColor))),
    );
  }

  Widget getQRScannerWidget() {
    TextEditingController textController = TextEditingController();
    textController.text = widget.inputValue;
    textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          key: widget.key,
          controller: textController,
          textAlign: TextAlign.left,
          onChanged: (String value) => widget.onValueChange(value),
          style: FontUtils.normalTextStyle(
            BLACK,
          ),
          keyboardType: getKeyboardType(),
          inputFormatters: (widget.inputType == InputType.number)
              ? <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly]
              : null,
          decoration: getInputDecoration(
              context, widget.inputHint, iconName, BLUE, _scanQR),
          enabled: (widget.isReadOnly != null) ? !widget.isReadOnly : true,
          // enableInteractiveSelection: false,
          autocorrect: false,
        ),
        drawWidgetOrEmptyContainer(
            hadErrorMsg, Text(errorMessage, style: errorTextStyle))
      ],
    );
  }

  getKeyboardType() {
    return (widget.inputType == InputType.number)
        ? TextInputType.number
        : TextInputType.text;
  }

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      if (validateInputType(qrResult)) {
        widget.onValueChange(qrResult);
        setState(() {
          widget.inputValue = qrResult;
          hadErrorMsg = false;
        });
      } else {
        setState(() {
          hadErrorMsg = true;
          errorMessage = "Input value is not valid";
        });
      }
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          errorMessage = "Camera permission was denied";
          hadErrorMsg = true;
        });
      } else {
        setState(() {
          errorMessage = "Error $ex";
          hadErrorMsg = true;
        });
      }
    } on FormatException {
      setState(() {
        errorMessage = "You pressed the back button before scanning anything";
        hadErrorMsg = true;
      });
    } catch (ex) {
      setState(() {
        errorMessage = "Error $ex";
        hadErrorMsg = true;
      });
    }
  }

  bool validateInputType(String inputValue) {
    return widget.inputType == InputType.number
        ? isValidNumber(inputValue)
        : true;
  }
}
