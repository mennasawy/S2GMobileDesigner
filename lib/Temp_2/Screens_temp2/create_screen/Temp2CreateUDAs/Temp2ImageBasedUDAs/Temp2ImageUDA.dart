import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/ImageUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ImageBasedUDAs/ImageWidgetUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2ImageBasedUDAs/Temp2ImageWidgetUtils.dart';
//import 'package:badges/badges.dart';

class Temp2ImageUDA extends StatefulWidget {
  final String title;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String udaDescription;
  final Uint8List imageValue;
  final String labelColor;
  final bool isVisible;
  final bool isReadOnly;
  final bool isMandatory;
  bool isLocation = false;
  final bool validationCondition;

  final Function(String) onImagePick;

  Temp2ImageUDA(
      {Key key,
      this.title,
      this.validationMessage,
      this.isValidationMSGWarning,
      this.udaDescription,
      this.isVisible,
      this.isReadOnly,
      this.isMandatory,
      this.validationCondition,
      this.onImagePick,
      this.isLocation,
      this.imageValue,
      this.labelColor})
      : super(key: key);
  @override
  _Temp2ImageUDAState createState() => _Temp2ImageUDAState();
}

class _Temp2ImageUDAState extends State<Temp2ImageUDA>
    implements ImageUDAViewInterface {
  ImageUDAPresenter imageUDAPresenter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePresenter();
  }

  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
        widget.isVisible == true && widget.isLocation != true,
        getUDAWithTitleWidget(
            context,
            imageUDAWidget(),
            "",
            widget.udaDescription,
            widget.validationMessage,
            widget.isValidationMSGWarning,
            widget.isMandatory,
            hexToColor(widget.labelColor)));
  }

  Container imageUDAWidget() {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      // decoration: BoxDecoration(
      //   color: WHITE,
      //   borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //   border: Border.all(
      //     color: GREY,
      //   ),
      //   boxShadow: [
      //     BoxShadow(
      //         blurRadius: 5.0,
      //         spreadRadius: 0.0,
      //         offset: Offset(2.0, 3.0),
      //         color: DARK_GREY)
      //   ],
      // ),
      child: imageUDAPresenter.isImageValueEmpty()
          ? emptyImageWidget(
              onButtonTapped: imageUDAPresenter.onImageBoxTap,
              isMandatory: widget.isMandatory,
              title: widget.title,
            )
          : GestureDetector(
              child: deletePickedImageWidget(),
              onTap: imageUDAPresenter.onImageBoxTap,
            ),
    );
  }

  getSavedOrPickedImage() {
    return (widget.imageValue != null)
        ? Image.memory(
            widget.imageValue,
            fit: BoxFit.fill,
          )
        : Image.file(
            imageUDAPresenter.pickedImage,
            fit: BoxFit.cover,
          );
  }

  Widget deletePickedImageWidget() {
    return Stack(
      children: [
        selectedImageWidget(
            context,
            getSavedOrPickedImage(),
            getImageTitle(imageUDAPresenter.imageName, widget.imageValue,
                context, "upload_image_uda")),
        Align(
          alignment: Alignment.topLeft,
          child: GestureDetector(
            child: Container(
              decoration: new BoxDecoration(
                color: RED,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: WHITE,
                size: 12,
              ),
            ),
            onTap: imageUDAPresenter.onDeleteImageAction,
          ),
        ),
      ],
    );
  }

  initializePresenter() {
    imageUDAPresenter = ImageUDAPresenter(
      view: this,
      context: context,
      onImagePick: widget.onImagePick,
      isReadOnly: widget.isReadOnly,
      imageValue: widget.imageValue,
    );
  }

  @override
  updateImageUDAWidget() {
    setState(() {});
  }
}
