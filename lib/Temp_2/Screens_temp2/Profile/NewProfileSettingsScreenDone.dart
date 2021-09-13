import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/CicularAvatarWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class ProfileSettingsScreen extends StatefulWidget {
  @override
  ProfileSettingsScreenState createState() => ProfileSettingsScreenState();
}

class ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: settingsAppBar(),
          body: WillPopScope(
            child: Container(
              height: (getScreenHeight(context) -
                      kToolbarHeight -
                      kBottomNavigationBarHeight) *
                  0.9,
              child: Column(
                children: <Widget>[
                  userData(),
                  settingsMenuItems(),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    child: profileMenuItemCard(context, 6),
                  )
                ],
              ),
            ),
          ),
          // bottomNavigationBar: BottomNavigatioBarWidget(
          //   context: context,
          //   screenType: ScreenType.support,
          // ),
          // floatingActionButton: BottomBarFloatingbutton(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }

  NTGAppBar settingsAppBar() {
    return NTGAppBar(
      appBarType: AppBarType.appBarWithBack,
      pageName: "Profile",
    );
  }

  Widget userData() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: userDataDecoration(),
        height: getScreenHeight(context) * 0.2,
        child: Row(
          children: <Widget>[
            profileImage(),
            Expanded(
              child: userInfo(),
            )
          ],
        ),
      ),
    );
  }

  ListTile userInfo() {
    return ListTile(
      title: Text(
        "admin",
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      subtitle: Text("admin@ntg.com"),
    );
  }

  BoxDecoration userDataDecoration() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          width: 2,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  Widget profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: profileImageDecoration(),
        width: getScreenWidth(context) * 0.3,
        height: getScreenHeight(context) * 0.15,
        child: CircularAvatarWidget(
          type: ImageType.AssetImage,
          image: IMG_PROFILE_NOPHOTO,
        ),
      ),
    );
  }

  BoxDecoration profileImageDecoration() {
    return BoxDecoration(
        color: WHITE,
        border: Border.all(color: Colors.grey[400], width: 2),
        borderRadius: BorderRadius.circular(50));
  }

  Widget settingsMenuItems() {
    return Expanded(
      child: menuItemsGridView(context),
    );
  }

  Widget menuItemsGridView(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5 / 3,
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
                child: menuItemsIcons()[index],
              ),
              menuItemsTitles()[index]
            ],
          ),
        ),
      ),
    );
  }

  List<Text> menuItemsTitles() {
    return [
      cardTitle('editAccountSettings'),
      cardTitle('changePassword'),
      cardTitle('pushNotificationSettings'),
      cardTitle('Language'),
      cardTitle('Privacy'),
      cardTitle('About'),
      Text(
        "log out",
        style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.grey),
      ),
    ];
  }

  Text cardTitle(String title) {
    return Text(
      title,
      style: normalBoldedTextStyle,
    );
  }

  List<dynamic> menuItemsIcons() {
    return [
      Icon(
        Icons.person,
        size: getScreenHeight(context) * 0.07,
        color: Colors.red,
      ),
      buttonImage(imageWidet(IC_CHANGE_PASSWORD)),
      buttonImage(imageWidet(IC_PUSH_SETTING)),
      buttonImage(imageWidet(IC_LANGUAGE)),
      buttonImage(imageWidet(IC_NEWSPAPER)),
      buttonImage(
        Icon(
          Icons.info,
          size: 50,
          color: BLUE,
        ),
      ),
      null,
    ];
  }

  Column buttonImage(Widget widget) {
    return Column(
      children: [
        widget,
        SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Image imageWidet(String image) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height * 0.05,
    );
  }
}
