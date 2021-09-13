import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/app_constants.dart';

class ProfileSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
//          appBar: settingsAppBar(),
          body: WillPopScope(
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Icon(Icons.ac_unit),
                ),
                Column(
                  children: <Widget>[userData(), settingsMeuItems()],
                ),
              ],
            ),
          )),
    );
  }

  NTGAppBar settingsAppBar() {
    return NTGAppBar(
      appBarType: AppBarType.appBarWithMenu,
      appBarColor: Colors.transparent,
      titleColor: Colors.white,
      pageName: "Profile",
    );
  }

  Padding userData() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 100, 15, 15),
      child: Row(
        children: <Widget>[
          //Avatar
          Container(
            width: 110,
            height: 110,
            child: Icon(Icons.ac_unit),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(1, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(55)),
          ),
          //User data
          Expanded(
              child: ListTile(
            title: Text(
              "user",
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
//                            child: Text(
//                              (user.skills != null ) ? user.skills : '',
//                              style: profileSettingsSubtitleStyle,
//                            ),
            ),
          ))
        ],
      ),
    );
  }

  Expanded settingsMeuItems() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                "profile setting",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.grey[400]),
              ),
              padding: EdgeInsets.only(top: 40, left: 25),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: menuItemsTitles().length,
                separatorBuilder: (BuildContext context, int index) => Divider(
                  indent: 75,
                  endIndent: 20,
                  height: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: menuItemsTitles()[index],
                    leading: Padding(
                      child: menuItemsIcons()[index] ?? SizedBox(width: 40),
                      padding: EdgeInsets.only(left: 15),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                    ),
//                    Image.asset(IC_ARROW_CELL),
                  );
                },
                padding: EdgeInsets.only(top: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Text> menuItemsTitles() {
    return [
      Text(
        'Profile_editAccountSettings',
      ),
      Text(
        'Profile_changePassword',
      ),
      Text(
        'Profile_pushNotificationSettings',
      ),
      Text('Profile_Language'),
      Text('Profile_Privacy'),
      Text('Profile_About'),
      Text('Profile_LogOut'),
    ];
  }

  List<Image> menuItemsIcons() {
    return [
      Image.asset(IC_EDIT_PROFILE),
      Image.asset(IC_CHANGE_PASSWORD),
      Image.asset(IC_PUSH_SETTING),
      Image.asset(IC_LANGUAGE),
      Image.asset(IC_NEWSPAPER),
      Image.asset(IC_NEWSPAPER),
      null,
    ];
  }
}
