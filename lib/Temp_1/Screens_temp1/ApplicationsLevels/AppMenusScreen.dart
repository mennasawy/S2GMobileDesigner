import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class AppMenus extends StatefulWidget {
  @override
  _CreateModulesScreen createState() => _CreateModulesScreen();
}

class _CreateModulesScreen extends State<AppMenus> {
  List<String> menu = ["menu name 1", "menu name 2"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE,
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithBack,
          pageName: "menu",
        ), //AppBarWithBack(pageName:widget.app.appName),
        body: buildlistHorontalView(),
      ),
    );
  }

  Widget buildlistHorontalView() {
    return Container(
      height: getScreenHeight(context) * 0.8,
      child: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(2.00),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: menu.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //  child: Container(
                    height: 67,

                    //width: MediaQuery.of(context).size.width * 0.40,
                    child: Card(
                      child: Container(
                        color:
                            index % 2 == 0 ? WHITE.withOpacity(0.5) : LITE_BLUE,
                        child: ListTile(
                          title: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                menu[index],
                                style: normalTextStyle,
                              )),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                          ),
                          leading: Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                      elevation: 3,
                    ),
                  );
                })),
      ),
    );
  }
}
