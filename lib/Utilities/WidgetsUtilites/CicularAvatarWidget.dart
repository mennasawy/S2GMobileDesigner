import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';

enum ImageType { Unit8List, AssetImage, FileImage, NetworkImage }

class CircularAvatarWidget extends StatelessWidget {
  var image;
  final ImageType type;
  CircularAvatarWidget({Key key, this.image, this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: WHITE,
      radius: 53,
      child: (type == ImageType.Unit8List)
          ? CircleAvatar(
              backgroundColor: WHITE,
              radius: 52,
              child: Image(
                image: Image.memory(image).image,
              ),
            )
          : CircleAvatar(
              backgroundColor: WHITE,
              radius: 52,
              child: Icon(Icons.phone_iphone),
              // backgroundImage: Image(
              //         image: (type == ImageType.FileImage)
              //             ? Image.file(image).image
              //             : AssetImage(image))
              //     .image
            ),
    );
  }
}
