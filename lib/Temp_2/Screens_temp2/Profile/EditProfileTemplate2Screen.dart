import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/CicularAvatarWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/profile_widget.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class EditProfileTemplate2 extends StatefulWidget {
  @override
  _EditProfileTemplate2State createState() => _EditProfileTemplate2State();
}

class _EditProfileTemplate2State extends State<EditProfileTemplate2> {
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: WHITE,
          appBar: Template2AppBars(
            screenName: "edit profile",
            appBarType: Template2AppBarType.secendary,
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 5, right: 5, top: 7, bottom: 5),
            child: SingleChildScrollView(
              child: Column(
//                    controller: _scrollController,
//                    shrinkWrap: true,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  profileHeaderWidget(),
                  editProfileScreenBody(),
                  Text(
                    "working day",
                    style: subtitlesTextStyle,
                  ),
                  buildWorkingDaysWeekListWidget(),
                  workingHourWidget(),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: BasicButton(
                      buttonWidth: getScreenWidth(context) * 0.4,
                      buttonHeight: getScreenWidth(context) * 0.12,
                      buttonText: "update",
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget profileHeaderWidget() {
    return ProfileWidget(
      imageType: ImageType.AssetImage,
      image: IMG_PROFILE_PLACEHOLDER,
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
                    "photo",
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

  Widget editProfileScreenBody() {
    return Container(
//      width: getScreenWidth(context) * 0.75,
      padding: EdgeInsets.only(right: 30),
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BasicTextInputUDA(
            title: "name",
            isVisible: true,
            isMandatory: true,
            inputDecoration: getTextFieldInputDecoration(),
          ),
          BasicTextInputUDA(
            title: "first name",
            isVisible: true,
            isMandatory: true,
            inputDecoration: getTextFieldInputDecoration(),
          ),
          BasicTextInputUDA(
            title: "last name",
            isVisible: true,
            isMandatory: true,
            inputDecoration: getTextFieldInputDecoration(),
          ),
          BasicTextInputUDA(
            title: "skills",
            isVisible: true,
            inputDecoration: getTextFieldInputDecoration(),
          ),
          BasicTextInputUDA(
            title: "email",
            isVisible: true,
            isMandatory: true,
            inputDecoration: getTextFieldInputDecoration(),
          ),
          BasicTextInputUDA(
            title: "phone",
            isVisible: true,
            isMandatory: true,
            inputDecoration: getTextFieldInputDecoration(),
          ),
        ],
      ),
    );
  }

  Widget buildWorkingDaysWeekListWidget() {
    return Container(
      height: 40,
      margin: EdgeInsets.fromLTRB(2, 15, 2, 15),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) => buildFilterSearchButtons(
            buttonText: "sun", width: 40, textColor: WHITE, color: GREEN),
      ),
    );
  }

  Widget workingHourWidget() {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "working hour",
            style: subtitlesTextStyle,
          ),
          SizedBox(
            height: 10,
          ),
          LabelTitle("start", context, false),
//          DateUDA(
//              initialValue:
//                  _presenter.userData.userStartWorkingHoursController.text ??
//                      '',
//              dateType: DateType.timeOnly,
//              isMandatory: true,
//              isVisible: true,
//              dateInputDecoration: getDateInputDecoration(
//                isPrefixIcon: true,
//                icon: Container(
//                  margin: EdgeInsets.fromLTRB(6, 13, 5, 5),
//                  child: Image.asset(
//                    TEMP2_IC_TIME,
//                    width: 22,
//                    height: 22,
//                    fit: BoxFit.fill,
//                  ),
//                ),
//              )), //              buildHeaderIcons(iconName: IC_CALENDER_TEXT),
//              Text(_presenter.userData.userStartWorkingHoursController.text),
          BasicTextInputUDA(
            title: "hout cost",
            isVisible: true,
            inputDecoration: getTextFieldInputDecoration(),
          ),
          BasicTextInputUDA(
            title: "working day hour",
            isVisible: true,
            inputDecoration: getTextFieldInputDecoration(),
          ),
          SizedBox(
            height: 6,
          )
        ],
      ),
    );
  }
}
