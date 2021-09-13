import 'dart:io';
import 'dart:typed_data';

import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';

abstract class ImageUDAViewInterface {
  updateImageUDAWidget();
}

class ImageUDAPresenter {
  final ImageUDAViewInterface view;
  final Function(String) onImagePick;
  final BuildContext context;
  final Uint8List imageValue;
  File pickedImage;
  String imageName;
  final bool isReadOnly;

  ImageUDAPresenter({
    this.view,
    this.onImagePick,
    this.context,
    this.isReadOnly,
    this.imageValue,
  });

  void onImageBoxTap() {
    if (isReadOnly == false) {
      onPickImageTap(context, (image) {
        pickedImage = File(image.path);
        imageName = image.path.split('/').last;
        onImagePick(convertFileImagetoString(pickedImage));
        view.updateImageUDAWidget();
      });
    }
  }

  onDeleteImageAction() {
    pickedImage = null;
    imageName = null;
    onImagePick(null);
  }

  bool isImageValueEmpty() => pickedImage == null && imageValue == null;
}
