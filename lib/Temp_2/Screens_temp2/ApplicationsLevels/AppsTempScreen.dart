import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_2/Presenter/BottomBarManager.dart';
import 'package:templets/Utilities/Temp2UtilMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class AppsTempScreen extends StatefulWidget {
  final Function onAppSelection;
  const AppsTempScreen({Key key, this.onAppSelection}) : super(key: key);

  @override
  _AppsTempScreenState createState() => _AppsTempScreenState();
}

class _AppsTempScreenState extends State<AppsTempScreen> {
  BottomBarManager bottomBarManager = new BottomBarManager();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
              child: Icon(
                Icons.drag_handle,
                color: DARK_GREY,
                size: 50,
              ),
              flex: 1),
          Expanded(
            flex: 5,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 20),
                  width: getScreenWidth(context) * 0.25,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: getScreenWidth(context) * 0.15,
                          height: getScreenWidth(context) * 0.15,
                          decoration: shadedCircularDecoration(0.3, GREY),
                          child: ClipOval(
                            child: (Icon(Icons.home,
                                size: getScreenWidth(context) * 0.1)),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "app name",
                          style: normalTextStyle,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
