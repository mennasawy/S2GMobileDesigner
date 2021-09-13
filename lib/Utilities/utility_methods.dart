import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/UDADescriptionAlert.dart';
import 'package:templets/Utilities/WidgetsUtilites/Alerts/common_alert.dart';
import 'package:templets/Utilities/WidgetsUtilites/Alerts/logout_alert.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';

TextStyle titlesStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    color: BLACK);

Widget drawWidgetOrEmptyContainer(bool condition, Widget widget) {
  return condition ? widget : Container();
}

fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

Future<bool> loginOnBackPressed() {
  exit(0);
}

onBackPressed(BuildContext context) {
  LogoutAlert exitalert = LogoutAlert(
      message: "Are you sure you want to log out now?",
      buttonTitle: 'Yes, Exit',
      context: context,
      onButtonTap: () {
        exit(0);
      });
  exitalert.showAlert();
}

Function popToLogin(BuildContext context) {
  // Navigator.pushReplacement(
  //     context, MaterialPageRoute(builder: (BuildContext context) => Login()));
}

void popScreen(BuildContext context) {
  Navigator.pop(context);
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

List<String> removeEmptyItem(List<String> listItems) {
  if (isNotEmptyList(listItems)) {
    for (int i = 0; i < listItems.length; i++) {
      if (listItems[i] == " ") listItems.removeAt(i);
    }
    return listItems;
  } else
    return [];
}

Widget getNoDataFoundWidget(String text) {
  return Center(
    child: Text(
      text,
      style: FontUtils.boldNormalTextStyle(BLACK),
    ),
  );
}

//App TextFields helping methods
InputDecoration getInputDecoration(BuildContext context, String hintText,
    String iconName, Color iconColor, Function onIconTap,
    [Function onClearValue]) {
  return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      hintText: hintText,
      hintStyle: hintTextFieldTextStyle,
      enabled: true,
      enabledBorder: getDecorationInputBorder(context),
      focusedBorder: getDecorationInputBorder(context),
      disabledBorder: getDecorationInputBorder(context),
      focusedErrorBorder: getDecorationInputBorder(context),
      filled: true,
      fillColor: LITE_GREY.withOpacity(OPACITY),
      suffixIcon:
          (iconName != null) ? setIcon(iconName, iconColor, onIconTap) : null,
      prefixIcon: (onClearValue != null)
          ? GestureDetector(
              child: Icon(Icons.clear),
              onTap: onClearValue,
            )
          : null);
}

OutlineInputBorder getDecorationInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: GREY,
      width: TEXTFIELD_BORDER_RADUIS_WIDTH,
    ),
    borderRadius: BorderRadius.circular(TEXTFIELD_BORDER_RADUIS),
  );
}

Decoration buildContainerOutlineInputBorder() {
  return BoxDecoration(
      color: LITE_GREY.withOpacity(OPACITY),
      border: Border.all(color: GREY, width: TEXTFIELD_BORDER_RADUIS_WIDTH),
      borderRadius: BorderRadius.circular(TEXTFIELD_BORDER_RADUIS));
}

Widget DrawProgressBar() {
  return Center(
    child: Container(
      child: CircularProgressIndicator(),
      width: 20,
      height: 20,
    ),
    // color: iconColor,
  );
}

// Widget DrawCircularProgressIndicator(String text) {
//   return Center(
//     child: CircularPercentIndicator(
//       radius: 25.0,
//       lineWidth: 5.0,
//       percent: 1,
//       animation: true,
//       circularStrokeCap: CircularStrokeCap.round,
//       animationDuration: 2500,
//       header: new Text(text),
//       backgroundColor: GREY,
//       progressColor: Main_Blue,
//     ),
//   );
// }

ShowExpiredTokenAlert(String message, BuildContext context) async {
  return SingleActionAlert(
          buttonAction: () {
            // Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => loginWidget));
          },
          message: message,
          buttonTitle: 'OK',
          context: context)
      .showAlert();
}

ShowAlertMessage(String message, BuildContext context,
    {Function buttonAction, int noOfPops}) {
  return SingleActionAlert(
          message: message,
          buttonTitle: 'OK',
          context: context,
          buttonAction: buttonAction,
          noOfPop: noOfPops)
      .showAlert();
}

// image operations
Uint8List convertStringtoImage(String image) {
  return Base64Decoder().convert(image);
}

String convertFileImagetoString(File image) {
  List<int> imageBytes = image.readAsBytesSync();
  return base64Encode(imageBytes);
}

String trimText(String text, int maxLength) {
  return text.trim().length <= maxLength
      ? text
      : text.trim().substring(0, maxLength) + '...';
}

DateTime ConvertStringToDataTime(String Stime, String format) {
  return DateFormat(format).parse(Stime);
}

dateFormat(dateVal, {String format}) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateVal);
  var formattedDate = DateFormat(format ?? 'dd-MM-yyyy hh:mm a').format(date);
  return formattedDate;
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  return htmlText.replaceAll(exp, '');
}

bool isHtmlFormate(String text) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  if (text.contains(exp))
    return true;
  else
    return false;
}

//validations methods
bool isValidEmail(String mail) {
  return (EmailValidator.validate(mail)) ? true : false;
}

bool isPhoneValid(String phone) {
  Pattern numPattern = r"(^(?:[+0]9)?[0-9]{10,12}$)";
  RegExp regex = new RegExp(numPattern);
  return (regex.hasMatch(phone)) ? true : false;
}

bool isValidNumber(String number) {
  return RegExp(r"^-?\d*\.{0,1}\d+$").hasMatch(number.toString());
}

bool isEmptyText(String text) {
  //issue
  return (text != null && text.isNotEmpty) ? false : true;
}

String getTextOrEmptyString(String text) {
  return text ?? '';
}

bool isNotEmptyList(List list) {
  return list != null && list.isNotEmpty;
}

Color hexToColor(String code) {
  return (code != null)
      ? new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000)
      : null;
}

//UDAs Utils
Column getUDAWithTitleWidget(
    BuildContext context,
    Widget inputField,
    String title,
    String udaDescription,
    String validationMessage,
    bool isValidationMSGWarning,
    bool isMandatory,
    Color color) {
  return Column(
    children: <Widget>[
      drawWidgetOrEmptyContainer(
        !isEmptyText(title),
        getUDATitleWidget(context, isMandatory, title, udaDescription, color),
      ),
      Container(
        child: inputField,
      ),
      drawWidgetOrEmptyContainer(
        validationMessage != null && validationMessage != '',
        getValidationMessageWidget(validationMessage, isValidationMSGWarning),
      ),
    ],
  );
}

Container getValidationMessageWidget(
    String validationMessage, bool isValidationMSGWarning) {
  return Container(
    height: 20,
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        '  $validationMessage',
        style: isValidationMSGWarning == true
            ? TextStyle(color: Colors.orange)
            : TextStyle(color: Colors.red),
      ),
    ),
  );
}

Container getUDATitleWidget(BuildContext context, bool isMandatory,
    String title, String udaDescription, Color color) {
  return Container(
    height: 30,
    child:
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: (isMandatory != null && isMandatory == true)
            ? getMandatoryUDATitle(title, context, color)
            : getNormalTitle(title, context, color),
      ),
      Spacer(),
      drawWidgetOrEmptyContainer(!isEmptyText(udaDescription),
          getUDADescriptionWidget(udaDescription, context))
    ]),
  );
}

//UDA mandatory title
Widget getMandatoryUDATitle(String title, BuildContext context, Color color) {
  return RichText(
      text: TextSpan(
//          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
        TextSpan(
          text: title,
          // textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: 'SF Pro Text',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: (color != null) ? color : BLACK,
              decoration: TextDecoration.none),
        ),
        TextSpan(
            text: ' *', style: TextStyle(color: Colors.red, fontSize: 16.0)),
      ]));
}

//UDA normal title
Widget getNormalTitle(String title, BuildContext context, Color color) {
  return Text(
    title,
    textAlign: TextAlign.start,
    style: TextStyle(
        fontFamily: 'SF Pro Text',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: (color != null) ? color : BLACK,
        decoration: TextDecoration.none),
//    style: normalTextStyle,
    overflow: TextOverflow.ellipsis,
  );
}

IconButton getUDADescriptionWidget(String message, BuildContext context) {
  UDADescriptionAlert alert = UDADescriptionAlert(
    context: context,
    message: message,
  );
  return IconButton(
    color: DARK_GREY,
    padding: EdgeInsets.all(0),
    icon: Icon(Icons.help_outline),
    onPressed: () {
      alert.showAlert();
    },
  );
}

TextStyle getAlertButtonTextStyle(BuildContext context) {
  return TextStyle(
      fontFamily: 'SF Pro Text',
      fontSize: getScreenWidth(context) * 0.04,
      fontWeight: FontWeight.w400,
      color: Blue_Koi);
}

//Image picker methods
void onPickImageTap(BuildContext context, Function(File) onPickAction) {
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
                  'Choose from gallery',
                  style: normalTextStyle,
                ),
                onTap: () {
                  getImage('Choose from gallery', onPickAction);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Take photo',
                  style: normalTextStyle,
                ),
                onTap: () {
                  getImage('camera', onPickAction);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      });
}

Future getImage(String source, Function(File) onPickAction) async {
  ImagePicker imagePicker = ImagePicker();
  var image = await imagePicker.getImage(
      source: (source == 'Choose from gallery')
          ? ImageSource.gallery
          : ImageSource.camera);
  onPickAction(File(image.path));
}

/////get icon for attachmentuda
Widget iconWidget(String attachmenttype) {
  return Icon(Icons.phone_iphone);
}

Color colorConvert(String color) {
  color = color.replaceAll("#", "");
  if (color.length == 6) {
    return Color(int.parse("0xFF" + color));
  } else if (color.length == 8) {
    return Color(int.parse("0x" + color));
  }
}

navigateTo(BuildContext context, dynamic targetScreen) {
  Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => targetScreen()));
}

Route openAnimatedRoute(Widget routeWidget) {
  return PageRouteBuilder(
    transitionDuration: Duration(milliseconds: 600),
    pageBuilder: (context, animation, secondaryAnimation) => routeWidget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0, 1);
      var end = Offset.zero;
      var curve = Curves.easeIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
