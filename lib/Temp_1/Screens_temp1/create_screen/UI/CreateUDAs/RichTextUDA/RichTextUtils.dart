import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

Widget richTextWidget(String htmlText) {
  return Container(
    child: Html(
      data: htmlText ?? "",
    ),
  );
}

String updateRichTextValue(String oldValue, String newValue) {
  String updatedText = (oldValue ?? "") + "<p>" + (newValue ?? "") + "</p>";
  return updatedText;
}
