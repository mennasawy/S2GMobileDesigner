import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:templets/Utilities/app_constants.dart';

var toDoTitleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Montserrat');

InputDecoration getToDoInputDecoration(
    BuildContext context, String hintText, double borderRadius) {
  return InputDecoration(
      contentPadding: const EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 10.0),
      hintText: hintText,
      hintStyle: hintTextFieldTextStyle,
      enabled: true,
      enabledBorder: getToDoDecorationInputBorder(context, borderRadius),
      focusedBorder: getToDoDecorationInputBorder(context, borderRadius),
      disabledBorder: getToDoDecorationInputBorder(context, borderRadius),
      focusedErrorBorder: getToDoDecorationInputBorder(context, borderRadius),
      filled: true,
      fillColor: WHITE);
}

OutlineInputBorder getToDoDecorationInputBorder(
    BuildContext context, double borderRadius) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: GREY,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(borderRadius),
  );
}

InputDecoration getDateDecoration(BuildContext context, String hintText) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(1.0),
    hintText: hintText,
    hintStyle: hintTextFieldTextStyle,
    enabled: true,
    enabledBorder: getDecorationDateBorder(context, 5.0),
    focusedBorder: getDecorationDateBorder(context, 5.0),
    disabledBorder: getDecorationDateBorder(context, 5.0),
    focusedErrorBorder: getDecorationDateBorder(context, 5.0),
    filled: true,
    fillColor: WHITE,
    prefixIcon: Container(
      width: 5,
      alignment: Alignment.centerLeft,
      child: Icon(
        FontAwesomeIcons.calendarAlt,
        color: DARK_GREY,
      ),
    ),
  );
}

OutlineInputBorder getDecorationDateBorder(
    BuildContext context, double borderRadius) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: WHITE,
      width: 1,
    ),
    borderRadius: BorderRadius.circular(borderRadius),
  );
}

covertStringToColor(String color, opacity) {
  return color != null
      ? Color(int.parse(
          '0xFF' + color.replaceAll('#', ''),
        )).withOpacity(opacity ?? 1.0)
      : WHITE;
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
