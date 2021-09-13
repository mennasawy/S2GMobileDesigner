import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/CicularAvatarWidget.dart';

//Hamdy review .. do not separate images into separated file as prfile is not huge widget
//Hamdy review .. use camel case for file naming
class ProfileWidget extends StatelessWidget {
  var image;
  final Function onEditIconPressed;
  final ImageType imageType;

  ProfileWidget({
    Key key,
    this.image,
    this.onEditIconPressed,
    this.imageType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  //Hamdy review .. clarify name "getAvatarImage"
  Widget buildImage() {
    //Hamdy review .. tihs variable is used only once, so there is no need to
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: getImageFromTypeWidget(),
          fit: BoxFit.fill,
          width: 100,
          height: 100,
        ),
      ),
    );
  }

  dynamic getImageFromTypeWidget() {
    switch (imageType) {
      case ImageType.AssetImage:
        return AssetImage(image);
      case ImageType.FileImage:
        return Image.file(image).image;
      case ImageType.NetworkImage:
        return NetworkImage(image);
    }
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: GestureDetector(
            onTap: onEditIconPressed,
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 18,
            ),
          ),
        ),
      );

  Widget buildCircle({
    Widget child,
    double all,
    Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
