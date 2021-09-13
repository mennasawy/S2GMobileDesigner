import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2UserImageWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2NoteMentionedUserInfo extends StatelessWidget {
  final MentionedUserInfo mentionedUser;

  const Temp2NoteMentionedUserInfo({Key key, this.mentionedUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: Template2AppBars(
          appBarType: Template2AppBarType.secendary,
          screenName: "${mentionedUser.name}",
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              userInfoHeaderWidget(context),
              userInfoContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget userInfoHeaderWidget(BuildContext context) {
    return Expanded(
      flex: 4,
//      height: getScreenHeight(context) * 0.25,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            profileImage(convertStringtoImage(mentionedUser.image)),
            Text(
              "${mentionedUser.name}",
              style: FontUtils.normalTextStyle(BLACK),
            ),
            Text(
              "${mentionedUser.email}",
              style: FontUtils.normalTextStyle(BLACK26),
            ),
          ],
        ),
      ),
    );
  }

  Widget userInfoContent(BuildContext context) {
    return Expanded(
        flex: 7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'First Name',
              style: FontUtils.boldNormalTextStyle(BLACK),
            ),
            Text(
              "${mentionedUser.nameFirst}",
              style: FontUtils.normalTextStyle(BLACK),
            ),
            Text(
              'Last Name',
              style: FontUtils.boldNormalTextStyle(BLACK),
            ),
            Text(
              "${mentionedUser.nameLast}",
              style: FontUtils.normalTextStyle(BLACK),
            ),
            Text(
              'Skills',
              style: FontUtils.boldNormalTextStyle(BLACK),
            ),
            Text(
              "${mentionedUser.skills ?? ""}",
              style: FontUtils.normalTextStyle(BLACK),
            ),
            Text(
              'Phone',
              style: FontUtils.boldNormalTextStyle(BLACK),
            ),
            Text(
              "${mentionedUser.mobilePhone}",
              style: FontUtils.normalTextStyle(BLACK),
            ),
          ],
        ));
  }
}
