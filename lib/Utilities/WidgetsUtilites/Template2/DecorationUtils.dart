import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';

BoxDecoration drawContainerBorder(Color color, {Color borderColor}) {
  return BoxDecoration(
      color: color,
      border: Border.fromBorderSide(BorderSide(
        color: borderColor ?? GREY,
      )),
      borderRadius: BorderRadius.circular(8));
}

InputDecoration getTextFieldInputDecoration(
    {String hintText,
    String iconName,
    Color iconColor,
    Function onIconTap,
    bool isPrefixIcon,
    bool isSufficIcon,
    Widget icon,
    EdgeInsetsGeometry padding}) {
  return InputDecoration(
      contentPadding:
          padding ?? const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      hintText: hintText,
      hintStyle: hintTextFieldTextStyle,
      enabled: true,
      enabledBorder: getDecorationInputBorder(),
      focusedBorder: getDecorationInputBorder(),
      disabledBorder: getDecorationInputBorder(),
      focusedErrorBorder: getDecorationInputBorder(),
      filled: true,
      fillColor: WHITE, //LITE_GREY.withOpacity(OPACITY),
      prefixIcon: (isPrefixIcon == true) ? icon : null,
      suffixIcon:
          (isPrefixIcon != true && iconName != null || isSufficIcon == true)
              ? setIcon(iconName, iconColor, onIconTap)
              : null);
}

OutlineInputBorder getDecorationInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: GREY, //GREY,
      width: TEXTFIELD_BORDER_RADUIS_WIDTH,
    ),
    borderRadius: BorderRadius.circular(TEXTFIELD_BORDER_RADUIS),
  );
}

InputDecoration getDateInputDecoration(
    {String hintText,
    String iconName,
    Color iconColor,
    Function onIconTap,
    bool isPrefixIcon,
    Widget icon}) {
  return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      hintText: hintText,
      hintStyle: hintTextFieldTextStyle,
      enabled: true,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      filled: true,
      fillColor: WHITE, //LITE_GREY.withOpacity(OPACITY),
      prefixIcon: (isPrefixIcon == true) ? icon : null,
      suffixIcon: (isPrefixIcon != true && iconName != null)
          ? Container(
              width: 10,
              height: 10,
              child: setIcon(iconName, iconColor, onIconTap))
          : null);
}

Widget getAssetImageWidget(String imageName) {
  return Icon(Icons.phone_iphone);
}

Widget buildFilterSearchButtons(
    {String buttonText,
    double width,
    Color color,
    Color textColor,
    Function onIconSelected}) {
  return GestureDetector(
    onTap: onIconSelected,
    child: Container(
      width: width,
      decoration: drawContainerBorder(color),
      margin: EdgeInsets.all(2),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            "$buttonText",
            style: TextStyle(color: textColor ?? BLACK),
          ),
        ),
      ),
    ),
  );
}

Widget buildHeaderIcons(
    {String iconName,
    Color bgColor,
    Function onIconPressed,
    double margin,
    Color borderColor,
    double padding}) {
  return Container(
    decoration: drawContainerBorder(bgColor, borderColor: borderColor),
    padding: EdgeInsets.all(padding ?? 4),
    margin: EdgeInsets.all(margin ?? 0),
    child: GestureDetector(
      child: Icon(Icons.phone_iphone),
      onTap: onIconPressed,
    ),
  );
}
