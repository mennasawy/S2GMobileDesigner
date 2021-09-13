import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/CicularAvatarWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();

    return SafeArea(
      child: Scaffold(
          backgroundColor: WHITE,
          appBar: NTGAppBar(
            appBarType: AppBarType.appBarWithBack,
            pageName: "edit profile",
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              child: Column(
                children: <Widget>[
                  _ProfileHeader(context),
                  _ProfileBody(context)
                ],
              ),
            ),
          )),
    );
  }

  //widgets methods
  Widget _ProfileHeader(BuildContext context) {
    return Container(
      width: getScreenWidth(context),
      height: getScreenHeight(context) * 0.2,
      child: Center(
        child: Container(
            width: 111,
            height: 111,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                border: Border.all(width: 2, color: BLUE)),
            child: _ProfilePictureWidget()),
      ),
    );
  }

  Widget _ProfilePictureWidget() {
    return Stack(children: <Widget>[
      Center(
        child: Container(
            height: getScreenHeight(context) * 0.24,
            child: CircularAvatarWidget(
              type: ImageType.AssetImage,
              image: IMG_PROFILE_NOPHOTO,
            )),
      ),
      Container(
        alignment: Alignment.bottomRight,
        margin: EdgeInsets.only(top: 80),
        child: IconButton(
            icon: Image.asset(
          BTN_EDIT,
          height: 30,
          width: 30,
        )),
      )
    ]);
  }

  Widget _ProfileBody(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: BasicTextInputUDA(
              key: ValueKey('userName'),
              title: "user name",
              isMandatory: true,
              isVisible: true,
              inputDecoration: buildInputDecorations(
                  context, "", false, IC_TEXT_FIELD_CHECK, null, null),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: BasicTextInputUDA(
              key: ValueKey('firstName'),
              title: 'first_name',
              isMandatory: true,
              isVisible: true,
              inputDecoration: buildInputDecorations(
                  context, "", false, IC_TEXT_FIELD_CHECK, null, null),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: BasicTextInputUDA(
              key: ValueKey('lastName'),
              title: 'last_name',
              isMandatory: true,
              isVisible: true,
              inputDecoration: buildInputDecorations(
                  context, "", false, IC_TEXT_FIELD_CHECK, null, null),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: BasicTextInputUDA(
              key: ValueKey('skills'),
              title: "skills",
              isMandatory: false,
              isVisible: true,
              inputDecoration: buildInputDecorations(
                  context, "", false, IC_TEXT_FIELD_CHECK, null, null),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: BasicTextInputUDA(
              key: ValueKey('email'),
              title: "email",
              isMandatory: true,
              isVisible: true,
              inputDecoration: buildInputDecorations(
                  context, "", false, IC_TEXT_FIELD_CHECK, null, null),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: BasicTextInputUDA(
                key: ValueKey('phone'),
                title: "phone",
                isMandatory: true,
                isVisible: true,
                inputDecoration: buildInputDecorations(
                    context, "", false, IC_TEXT_FIELD_CHECK, null, null),
              )),
          SizedBox(
            height: 5,
          ),
          _ProfileWorkingDaysHoursButton(),
          SizedBox(
            height: 22,
          ),
          NTGButton(
            buttonText: "update",
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  Widget _ProfileWorkingDaysHoursButton() {
    return Stack(
      children: <Widget>[
        Container(
            height: getScreenHeight(context) * 0.07,
            width: getScreenWidth(context) - WIDTH_OFFSET,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: RaisedButton(
                padding: EdgeInsets.only(left: 10, right: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.blue)),
                textColor: BLUE,
                color: WHITE,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("working days hours", style: normalTextStyle),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(BTN_CALENDER)
                    ],
                  ),
                ))),
      ],
    );
  }

  void ProfileImageEditIconAction() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        backgroundColor: WHITE,
        context: context,
        builder: (builder) {
          return Container(
            height: getScreenHeight(context) * 0.25,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Text(
                    "gallery",
                    style: normalTextStyle,
                  ),
                ),
                ListTile(
                  title: Text(
                    "take photo",
                    style: normalTextStyle,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
