import 'dart:convert';
import 'dart:typed_data';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ImageBasedUDAs/ImageWidgetUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:signature/signature.dart';
import 'package:flutter/material.dart';

class DigitalSignatureUDA extends StatefulWidget {
  final String title;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String udaDescription;
  final Uint8List imageValue;
  final String labelColor;
  final bool isVisible;
  final bool isReadOnly;
  final bool isMandatory;
  final bool isLocation;
  final bool validationCondition;

  final Function(String) onImagePick;

  const DigitalSignatureUDA(
      {Key key,
      this.title,
      this.validationMessage,
      this.isValidationMSGWarning,
      this.udaDescription,
      this.imageValue,
      this.isVisible,
      this.isReadOnly,
      this.isMandatory,
      this.isLocation,
      this.validationCondition,
      this.onImagePick,
      this.labelColor})
      : super(key: key);
  @override
  _DigitalSignatureUDAState createState() => _DigitalSignatureUDAState();
}

class _DigitalSignatureUDAState extends State<DigitalSignatureUDA> {
  Uint8List newSignatureImage;
  String imageName;
  String _base64SignitureImage;
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: WHITE,
  );

  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        widget.isVisible == true && widget.isLocation != true,
        getUDAWithTitleWidget(
            context,
            getImageUDAWidget(),
            widget.title,
            widget.udaDescription,
            widget.validationMessage,
            widget.isValidationMSGWarning,
            widget.isMandatory,
            hexToColor(widget.labelColor)));
  }

  Widget getImageUDAWidget() {
    return Row(
      key: widget.key,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        getImageBoxWidget(),
        Flexible(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.only(left: 35.0),
            child: Text(
              getImageTitle(imageName, widget.imageValue, context, "Sign Here"),
              style: normalGreyTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Spacer(),
        drawWidgetOrEmptyContainer(!isEmptyText(widget.udaDescription),
            getUDADescriptionWidget(widget.udaDescription, context))
      ],
    );
  }

  Widget getImageBoxWidget() {
    return GestureDetector(
      child: (newSignatureImage == null && widget.imageValue == null)
          ? DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: [7, 3],
              strokeWidth: 2,
              radius: Radius.circular(TEXTFIELD_BORDER_RADUIS),
              color: DARK_GREY.withOpacity(0.25),
              padding: EdgeInsets.all(1),
              child: getPickImageWidget(),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                height: 120,
                width: 120,
                child: getSavedOrPickedImage(),
              ),
            ),
      onTap: () {
        showPopupSigniture(context);
      },
    );
  }

  getSavedOrPickedImage() {
    return (widget.imageValue != null)
        ? Image.memory(
            widget.imageValue,
            fit: BoxFit.fill,
          )
        : Image.memory(
            newSignatureImage,
            fit: BoxFit.cover,
          );
  }

  showPopupSigniture(BuildContext context) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DrawAlert(
          controller: _controller,
          onSave: onSaveClicked,
        );
      },
    );
  }

  void onSaveClicked(BuildContext context) async {
    Navigator.pop(context);
    if (_controller.isNotEmpty) {
      newSignatureImage = await _controller.toPngBytes();
      _base64SignitureImage = base64Encode(newSignatureImage);
      log(LogType.DEBUG, "Signature image string $_base64SignitureImage}");
      setState(() {
        widget.onImagePick(_base64SignitureImage);
      });
    } else
      setState(() {
        newSignatureImage = null;
        widget.onImagePick(null);
      });
  }

  // getImageTitle() {
  //   return (imageName != null)
  //       ? imageName
  //       : (widget.imageValue != null)
  //           ? ""
  //           : AppLocalizations.of(context).translate("create_signature_uda");
  // }
}

class DrawAlert extends StatelessWidget {
  final SignatureController _controller;
  final Function onSave;

  DrawAlert({
    Key key,
    @required SignatureController controller,
    @required this.onSave,
  })  : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return AlertDialog(
          // scrollable: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          contentPadding: EdgeInsets.all(0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRect(
                child: Signature(
                  controller: _controller,
                  height: 300,
                  width: 300,
                  backgroundColor: WHITE,
                ),
              ),
              Container(
                // decoration: const BoxDecoration(color: Colors.black),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: FlatButton(
                        child: Text("Save",
                            style: getAlertButtonTextStyle(context)),
                        onPressed: () => onSave(context),
                      ),
                    ),
                    //CLEAR CANVAS
                    Expanded(
                      flex: 5,
                      child: FlatButton(
                        child: Text(
                          "Clear",
                          style: getAlertButtonTextStyle(context),
                        ),
                        onPressed: () {
                          setState(() => _controller.clear());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
