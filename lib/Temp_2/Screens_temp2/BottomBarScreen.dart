import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Models/BottomNavigationModel.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BottomBarFloatingButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/custom_bottomnav.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/floatingactionbutton_customloc.dart';
import 'package:templets/Utilities/app_constants.dart';

import 'ApplicationsLevels/AppsTempScreen.dart';

class BottomBarScrenn extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const routeName = '/bottomBar';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        resizeToAvoidBottomPadding: true,
        resizeToAvoidBottomInset: true,
        key: _scaffoldKey,
        backgroundColor: GREY,

        appBar: Template2AppBars(
          appBarType: Template2AppBarType.secendary,
          screenName: "bottom bar",
        ),
        bottomNavigationBar: BottomNavigatioBar(
          context: context,
          screenType: ScreenType.apps,
        ),
        floatingActionButton: BottomBarFloatingbutton(
          onFloatingButtonAction: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return AppsTempScreen(
                  onAppSelection: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    _scaffoldKey.currentState.openDrawer();
                  },
                );
              },
            );
          },
        ),
        floatingActionButtonAnimator: NoScalingAnimation(),
        floatingActionButtonLocation: CustomFloatingActionButtonLocation(0, 25),
      ),
    );
  }
}
