import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppModulesList.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Modules extends StatefulWidget {
  @override
  _Modules createState() => _Modules();
}

class _Modules extends State<Modules> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE,
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithBack,
          pageName: "module",
        ), //AppBarWithBack(pageName:widget.moduleName),
        body: WillPopScope(
          onWillPop: () {
            Navigator.pop(context);
          },
          child: SafeArea(child: buildlistHorontalView()),
        ),
      ),
    );
  }

  Widget buildlistHorontalView() {
    return Container(
      height: getScreenHeight(context) * 0.9,
      child: SingleChildScrollView(
        child: buildAppModuleList(),
      ),
    );
  }
}
