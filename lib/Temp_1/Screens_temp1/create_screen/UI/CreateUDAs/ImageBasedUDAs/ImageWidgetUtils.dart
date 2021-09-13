import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

Widget getPickImageWidget() {
  return DottedBorder(
    borderType: BorderType.RRect,
    dashPattern: [7, 3],
    strokeWidth: 2,
    radius: Radius.circular(TEXTFIELD_BORDER_RADUIS),
    color: DARK_GREY.withOpacity(0.25),
    padding: EdgeInsets.all(1),
    child: Container(
      color: LITE_GREY.withOpacity(OPACITY),
      height: 120,
      width: 120,
      child: Icon(Icons.add_a_photo),
    ),
  );
}

getImageTitle(String imageName, Uint8List imageValue, BuildContext context,
    String widgetTitle) {
  return (imageName != null)
      ? imageName
      : (imageValue != null)
          ? ""
          : widgetTitle;
}
