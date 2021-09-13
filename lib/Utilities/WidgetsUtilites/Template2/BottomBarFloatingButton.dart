import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';

class BottomBarFloatingbutton extends StatefulWidget {
  final Function onFloatingButtonAction;

  const BottomBarFloatingbutton({Key key, this.onFloatingButtonAction})
      : super(key: key);
  @override
  _BottomBarFloatingbuttonState createState() =>
      _BottomBarFloatingbuttonState();
}

class _BottomBarFloatingbuttonState extends State<BottomBarFloatingbutton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black12,
          // boxShadow: [
          //   BoxShadow(color: Colors.white, spreadRadius: 4),
          // ],
          border: Border.all(color: WHITE, width: 5),
          borderRadius: BorderRadius.circular(50)),
      child: FloatingActionButton(
        mini: false,
        shape: CircleBorder(),
        backgroundColor: Colors.blueAccent,
        child: Image.asset(
          IC_APPS_TEMP2,
          width: 35,
          height: 35,
          fit: BoxFit.fill,
        ),
        //Hamdy review .. logc needs to be transfered in a separated function
        onPressed: widget.onFloatingButtonAction,
        // () {
        //   //Hamdy review .. rename it to stack manager
        //   //Hamdy review .. transfer logic in stack_screen in a function

        //   setState(() {
        //     bottomBarManager.onFloatingButtonTap(context);
        //   });
        // },
      ),
    );
  }
}
