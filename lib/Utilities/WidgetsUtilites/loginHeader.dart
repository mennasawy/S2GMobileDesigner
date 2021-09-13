import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

Widget HeaderWidget(BuildContext context, bool hasLogo, Uint8List logo) {
  return Container(
      child: Stack(
    children: <Widget>[
      Image.asset(
        BG_LOGIN,
        width: getScreenWidth(context),
        height: getScreenHeight(context) * 0.28,
        fit: BoxFit.fill,
      ),
      Align(
          alignment: Alignment.topCenter,
          child: Container(
              margin: EdgeInsets.only(top: getScreenHeight(context) * 0.1),
              child: logoWidget(context, hasLogo, logo)))
    ],
  ));
}

Widget logoWidget(BuildContext context, bool hasLogo, Uint8List logo) {
  return (!hasLogo)
      ? CircleAvatar(
          radius: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              STAGE_LOGO,
              fit: BoxFit.contain,
            ),
          ),
          backgroundColor: WHITE,
        )
      : drawWidgetOrEmptyContainer(
          logo != null && logo != '',
          CircleAvatar(
            radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image(
                image: Image.memory(logo).image,
                fit: BoxFit.contain,
              ),
            ),
//                        backgroundImage: Image.memory(
//                          logo,
//                          fit: BoxFit.fill,
//                          width: 100,
//                          height: 100,
//                        ).image,
//                        child: Image(
//                          image: Image.memory(logo).image,
//                          fit: BoxFit.contain,
//                        ),
            backgroundColor: WHITE,
//                    backgroundImage:Image.memory(logo).image,
          )
//                      CircularAvatarWidget(
//                        type: ImageType.Unit8List,
//                        image: logo,
//                      )
          );
}
