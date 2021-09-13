import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Models/BottomNavigationModel.dart';
import 'package:templets/Temp_2/Presenter/BottomBarManager.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/materialwidget.dart';
import 'package:templets/Utilities/app_constants.dart';

// ignore: must_be_immutable
class BottomNavigatioBar extends StatefulWidget {
  BuildContext context;
  ScreenType screenType;

  BottomNavigatioBar({this.context, this.screenType});
  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<BottomNavigatioBar> {
  @override
  Widget build(BuildContext context) {
    BottomBarManager bottomBarManager = BottomBarManager();
    double width = MediaQuery.of(context).size.width;

    return Stack(children: [
      BottomAppBar(
          elevation: 0.3,
          notchMargin: 5,
          clipBehavior: Clip.antiAlias,
          shape: AutomaticNotchedShape(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ))),
          child: Container(
            width: width,
            height: 80, //getScreenHeight(context) * 0.14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: ItemWidget(
                    screens: widget.screenType,
                    index: 0,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ItemWidget(
                    screens: widget.screenType,
                    index: 1,
                  ),
                ),
                SizedBox(
                  width: width * 0.2,
                ),
                Expanded(
                  flex: 1,
                  child: ItemWidget(
                    screens: widget.screenType,
                    index: 2,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ItemWidget(
                    screens: widget.screenType,
                    index: 3,
                  ),
                ),
              ],
            ),
          )),
      Positioned.fill(
        bottom: 2,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            "Application",
            style: normalTextStyle,
          ),
        ),
      ),
    ]);
  }
}
