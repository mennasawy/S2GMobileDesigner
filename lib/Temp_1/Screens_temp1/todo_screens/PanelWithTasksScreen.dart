import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';

class InprocessScreen extends StatelessWidget {
  static const routeName = '/InprocessScreen1';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: todoAppbar(context),
        body: Container(
          child: tasksTabsList(context),
        ),
      ),
    );
  }

  todoAppbar(context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: Text('In Process', style: boldtitlesTextStyle),
      backgroundColor: BLUE,
      elevation: 0,
      bottom: todoAppbarBottomWidget(context),
    );
  }

  PreferredSize todoAppbarBottomWidget(context) {
    return PreferredSize(
        preferredSize: Size.fromHeight(getScreenHeight(context) * 0.25),
        child: Container(
            child: Column(
          children: <Widget>[
            Text(
              '2',
              style: TextStyle(
                  fontSize: 40, color: WHITE, fontWeight: FontWeight.w700),
            ),
            Text(
              'Task Pending',
              style: profileSettingsSubtitleStyle,
            ),
            SizedBox(height: getScreenHeight(context) * 0.05),
          ],
        )));
  }

  Widget tasksTabsList(context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 30, left: 5, right: 5),
          height: 200,
          margin: EdgeInsets.only(bottom: 7),
          width: getScreenWidth(context),
          child: GestureDetector(
            onTap: () {},
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Light_Grey, width: 0),
                ),
                child: tasksBodyListWidget(context)),
          ),
        )
      ],
    );
  }

  tasksBodyListWidget(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
//              color: ThemeManager.themeColor(
//                  ThemeSection.todo, ThemeProperty.cardBackgroundColor),
            width: getScreenWidth(context) * 0.82,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          'Task Name',
                          style: TextStyle(
                              fontFamily: 'Tahoma',
                              color: BLACK,
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.people,
                            size: 20,
                            color: Main_Green,
                          ),
                          onPressed: () {})
                    ],
                  ),
                  flex: 1,
                ),
                SizedBox(
                  height: 3,
                ),
                Expanded(
                  child: Text(
                    'Task Description   ',
                    style: normalTextStyle,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  flex: 2,
                ),
                SizedBox(
                  height: 6,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 185,
                        height: 17,
                        decoration: BoxDecoration(
                            border: Border.all(color: GREY, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        child: LinearProgressIndicator(
                          backgroundColor: LITE_GREY,
                          valueColor: AlwaysStoppedAnimation<Color>(RED),
                          value: 1,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text('1-1-2020'),
                        ),
                      ),
                    ],
                  ),
                  flex: 1,
                ),
                Text('Over Due , +99  Days late ')
              ],
            )),
        Container(
          width: getScreenWidth(context) * 0.093,
          decoration: BoxDecoration(
              color: Light_Blue,
              border: Border.all(color: GREY, width: 0),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Center(
              child: IconButton(
            icon: Image.asset(IC_TODO_UNCHECKED),
            onPressed: () {},
          )),
        ),
      ],
    );
  }
}
