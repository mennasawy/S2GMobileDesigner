import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2ProfileSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: GREY,
          bottomNavigationBar: BottomAppBar(),
          appBar: Template2AppBars(
            appBarType: Template2AppBarType.secendary,
            screenName: "Profile",
          ),
          body: WillPopScope(
            child: Container(
              height: (getScreenHeight(context) - kToolbarHeight) * 0.9,
              child: Column(
                children: <Widget>[
                  userData(context),
                  settingsMenuItems(context),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    child: profileMenuItemCard(context, 6),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget userData(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey[400],
            ),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          children: <Widget>[
            Expanded(flex: 1, child: Icon(Icons.person)),
            Expanded(
                flex: 1,
                child: ListTile(
                  title: FittedBox(
                    child: Text(
                      "user",
                    ),
                  ),
                  subtitle: Text("mail"),
                ))
          ],
        ),
      ),
    );
  }

  Widget settingsMenuItems(BuildContext context) {
    return Expanded(
      child: menuItemsGridView(context),
    );
  }

  Widget menuItemsGridView(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.only(left: 5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5 / 3.5,
          crossAxisCount: 2,
        ),
        itemCount: menuItemsTitles().length - 1,
        itemBuilder: (ctx, index) => profileMenuItemCard(context, index));
  }

  Decoration cardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(width: 2, color: Colors.grey[400]),
    );
  }

  Widget profileMenuItemCard(
    BuildContext context,
    int index,
  ) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: cardDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: menuItemsIcons(context)[index],
              ),
              FittedBox(child: menuItemsTitles()[index])
            ],
          ),
        ),
      ),
    );
  }

  List<Text> menuItemsTitles() {
    return [
      cardTitle('Profile_editAccountSettings'),
      cardTitle('Profile_changePassword'),
      cardTitle('Profile_pushNotificationSettings'),
      cardTitle('Profile_Language'),
      cardTitle('Profile_Privacy'),
      cardTitle('Profile_About'),
      Text(
        'Profile_LogOut',
        textAlign: TextAlign.center,
      ),
    ];
  }

  Text cardTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
    );
  }

  List<dynamic> menuItemsIcons(BuildContext context) {
    return [
      buttonImage(Icon(
        Icons.person,
        size: MediaQuery.of(context).size.height * 0.05,
      )),
      // Image.asset(
      //   IC_CHANGE_PASSWORD,
      //   fit: BoxFit.fill,
      //   height: 30,
      // ),
      // buttonImage(imageWidet(IMG_PROFILE_PLACEHOLDER)),
      buttonImage(imageWidet("", context)),
      buttonImage(imageWidet("", context)),
      buttonImage(imageWidet("IC_LANGUAGE", context)),
      buttonImage(imageWidet("IC_NEWSPAPER", context)),
      buttonImage(imageWidet("IC_INFO", context)),
      // buttonImage(
      //   Icon(
      //     Icons.info,
      //     size: 35,
      //     color: BLUE,
      //   ),
      // ),
      null,
    ];
  }

  Column buttonImage(Widget widget) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        widget,
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Icon imageWidet(String image, BuildContext context) {
    return Icon(
      Icons.ac_unit,
      size: MediaQuery.of(context).size.height * 0.05,
    );
  }
}
