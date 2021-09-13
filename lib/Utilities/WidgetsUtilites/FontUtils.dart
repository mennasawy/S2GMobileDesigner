import 'package:flutter/cupertino.dart';
import 'package:templets/Utilities/utility_methods.dart';

class FontUtils {
  static TextStyle normalTextStyle(Color color) {
    return TextStyle(
        fontFamily: 'Tahoma',
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w400);
  }

  static TextStyle boldNormalTextStyle(Color color) {
    return TextStyle(
        fontFamily: 'Tahoma',
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w700);
  }

  static TextStyle titleTextStyle(Color color) {
    return TextStyle(
        fontFamily: 'Tahoma',
        color: color,
        fontSize: 22,
        fontWeight: FontWeight.w700);
  }

  static TextStyle boldTitleTextStyle(Color color) {
    return TextStyle(
        fontFamily: 'Tahoma',
        color: color,
        fontSize: 22,
        fontWeight: FontWeight.w900);
  }

  static TextStyle subtitleTextStyle(Color color) {
    return TextStyle(
        fontFamily: 'Tahoma',
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w700);
  }

  static TextStyle boldSubtitleTextStyle(Color color) {
    return TextStyle(
        fontFamily: 'Tahoma',
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.w900);
  }

  static hintsTextStyle(Color color) {
    return TextStyle(
      fontFamily: 'Tahoma',
      color: color,
      fontSize: 11,
    );
  }

  static dynamicHintsTextStyle(
      Color color, double sizePrecentage, BuildContext context) {
    return TextStyle(
      fontFamily: 'Tahoma',
      color: color,
      fontSize: getScreenWidth(context) * sizePrecentage,
    );
  }

  static dynamicBoldedTextStyle(
      Color color, double sizePrecentage, BuildContext context) {
    return TextStyle(
      fontFamily: 'Tahoma',
      color: color,
      fontWeight: FontWeight.w700,
      fontSize: getScreenWidth(context) * sizePrecentage,
    );
  }

  static buttonTitlesTextStyle(Color color) {
    return TextStyle(
      fontFamily: 'Tahoma',
      color: color,
      fontSize: 18,
    );
  }

  static inputsTitlesTextStyle(Color color) {
    return TextStyle(
      fontFamily: 'Tahoma',
      color: color,
      fontSize: 16,
    );
  }
}
