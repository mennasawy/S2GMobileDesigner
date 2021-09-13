// import 'package:Smart2Go/UI/ShortCuts/shortcutCard.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'shortCutItem.dart';

class ShortcutsMenu extends StatefulWidget {
  const ShortcutsMenu({Key key}) : super(key: key);

  @override
  _ShortcutsMenuState createState() => _ShortcutsMenuState();
}

class _ShortcutsMenuState extends State<ShortcutsMenu> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: WHITE,
          appBar: Template2AppBars(
            screenName: "ShortCuts",
            appBarType: Template2AppBarType.main,
          ),
          body: Container(
              height: getScreenHeight(context) * 0.94,
              child: ListView.builder(
                controller: scrollController,
                itemCount: 1,
                itemBuilder: (x, i) => ShortCutItem(),
              )),
        ),
      ),
    );
  }
}
