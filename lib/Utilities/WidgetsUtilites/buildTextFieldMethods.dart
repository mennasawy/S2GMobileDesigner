import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';

InputDecoration buildInputDecorations(BuildContext context, String hintText,
    bool hasIcon, String iconName, Color iconColor, Function onIconTap) {
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 15.0),
    hintText: hintText,
    hintStyle: hintTextFieldTextStyle,
    enabled: true,
    enabledBorder: buildOutlineInputBorder(context),
    focusedBorder: buildOutlineInputBorder(context),
    filled: true,
    fillColor: LITE_BLUE,
    suffixIcon: (hasIcon) ? setIcon(iconName, iconColor, onIconTap) : null,
  );
}

OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: LITE_BLUE,
      width: TEXTFIELD_BORDER_RADUIS_WIDTH,
    ),
    borderRadius: BorderRadius.circular(TEXTFIELD_BORDER_RADUIS),
  );
}

Widget LabelTitle(String title, BuildContext context, bool isMandatoryField) {
  return (title != null)
      ? RichText(
          text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
              TextSpan(
                text: title,
                style: normalTextStyle,
              ),
              (isMandatoryField)
                  ? TextSpan(text: ' *', style: labelMandatoryTextStyle)
                  : TextSpan(text: ''),
            ]))
      : Container();
}

Widget drawLabel(String title, BuildContext context, bool isMandatoryField) {
  return Align(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: LabelTitle(title, context, isMandatoryField),
      ));
}

Widget setIcon(String iconName, Color iconColor, Function iconTapFucntion) {
  return IconButton(
    //Just for this temp project, it uses the icon name sent to it
    icon: Icon(iconName == IC_DROPDOWN ? Icons.arrow_drop_down : Icons.lock),
    onPressed: (iconTapFucntion != null) ? iconTapFucntion : null,
//      color: iconColor,
  );
}
