import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:templets/Utilities/app_constants.dart';

InputDecoration temp2InputDecoration(BuildContext context, String hintText,
    String iconName, Color iconColor, Function onIconTap,
    [Function onClearValue]) {
  return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
      // labelStyle: FontUtils.normalTextStyle(BLACK),
      // labelText: hintText,
      hintText: hintText,
      // hintStyle: FontUtils.normalTextStyle(BLACK),
      enabled: true,
      enabledBorder: temp2DecorationInputBorder(context),
      focusedBorder: temp2DecorationInputBorder(context),
      disabledBorder: temp2DecorationInputBorder(context),
      focusedErrorBorder: temp2DecorationInputBorder(context),
      // filled: true,
      // fillColor: ThemeManager.themeColor(ThemeSection.input,
      //     ThemeProperty.backgroundColor), //LITE_GREY.withOpacity(OPACITY),
      suffixIcon:
          (iconName != null) ? setIcon(iconName, iconColor, onIconTap) : null,
      prefixIcon: (onClearValue != null)
          ? GestureDetector(
              child: Icon(Icons.clear),
              onTap: onClearValue,
            )
          : null);
}

temp2DecorationInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderSide: BorderSide.none,
    // BorderSide(
    //   color: DARK_GREY,
    //   // ThemeManager.themeColor(
    //   //     ThemeSection.input, ThemeProperty.borderColor), //GREY,
    //   width: 1,
    // ),
    borderRadius: BorderRadius.circular(TEXTFIELD_BORDER_RADUIS),
  );
}

BoxDecoration shadedCircularDecoration(double borderWidth, Color color) {
  return BoxDecoration(
    color: color,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
          blurRadius: 5.0,
          spreadRadius: 0.0,
          offset: Offset(2.0, 3.0),
          color: DARK_GREY)
    ],
    border: Border.all(color: DARK_GREY, width: borderWidth),
  );
}
