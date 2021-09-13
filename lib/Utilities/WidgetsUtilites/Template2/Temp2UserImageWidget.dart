import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/CicularAvatarWidget.dart';
import 'package:templets/Utilities/app_constants.dart';

Widget profileImage(Uint8List profileImage) {
  return (profileImage != null)
      ? ClipOval(
          child: Material(
            shape: CircleBorder(
                side: BorderSide(
              color: Colors.grey[400],
              width: 2,
            )),
            color: Colors.transparent,
            child: Ink.image(
              image: Image.memory(profileImage).image,
              fit: BoxFit.cover,
              width: 95,
              height: 95,
            ),
          ),
        )
      : CircularAvatarWidget(
          type: ImageType.AssetImage,
          image: IMG_PROFILE_NOPHOTO,
        );
}
