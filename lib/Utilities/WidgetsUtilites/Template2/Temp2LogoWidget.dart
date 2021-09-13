import 'dart:typed_data';
import 'package:flutter/material.dart';

Widget getLogoWidget(Uint8List logoImage) {
  return logoImage != null
      ? Image(
          width: 90,
          height: 90,
          image: Image.memory(logoImage).image,
          fit: BoxFit.contain,
        )
      : Icon(Icons.phone_iphone);
}
