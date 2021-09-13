import 'dart:io';
import 'dart:typed_data';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/ImageUDAPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/ImageBasedUDAs/ImageWidgetUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImageUDA extends StatefulWidget {
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

  ImageUDA(
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
  _ImageUDAState createState() => _ImageUDAState();
}

class _ImageUDAState extends State<ImageUDA> implements ImageUDAViewInterface {
  ImageUDAPresenter imageUDAPresenter;

  @override
  void initState() {
    super.initState();
    initializePresenter();
  }

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

  Row getImageUDAWidget() {
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
              getImageTitle(imageUDAPresenter.imageName, widget.imageValue,
                  context, "Upload Image"),
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
      child: imageUDAPresenter.isImageValueEmpty()
          ? DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: [7, 3],
              strokeWidth: 2,
              radius: Radius.circular(TEXTFIELD_BORDER_RADUIS),
              color: DARK_GREY.withOpacity(0.25),
              padding: EdgeInsets.all(1),
              child: getPickImageWidget(),
            )
          : Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    height: 120,
                    width: 120,
                    child: getSavedOrPickedImage(),
                  ),
                ),
                deletePickedImageWidget()
              ],
            ),
      onTap: () => imageUDAPresenter.onImageBoxTap(),
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: GestureDetector(
        onTap: () => imageUDAPresenter.onDeleteImageAction(),
        child: Container(
          color: RED,
          child: Icon(
            Icons.close,
            color: WHITE,
          ),
        ),
      ),
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
