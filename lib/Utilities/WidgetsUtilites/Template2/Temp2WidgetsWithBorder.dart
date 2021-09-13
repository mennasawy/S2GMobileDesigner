import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2WidgetBorder extends StatefulWidget {
  final Widget child;
  final String title;
  final double height;
  final Color labelColor;
  final Color borderColor;
  final bool isMandatoryUDA;
  final BoxDecoration decoration;

  const Temp2WidgetBorder({
    Key key,
    this.child,
    @required this.title,
    this.height,
    @required this.isMandatoryUDA,
    this.labelColor,
    this.borderColor,
    this.decoration,
  }) : super(key: key);

  @override
  _Temp2WidgetBorderState createState() => _Temp2WidgetBorderState();
}

class _Temp2WidgetBorderState extends State<Temp2WidgetBorder> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        childWidget(),
        //White line having the same width of title text to wrap part of the border under it
        underTitleLine(context),
        titleWidget(context)
      ],
    );
  }

  Positioned titleWidget(BuildContext context) {
    return Positioned(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: widget.isMandatoryUDA == true
            ? getMandatoryUDATitle(widget.title, context, widget.labelColor)
            : Text(
                widget.title,
                style:
                    FontUtils.inputsTitlesTextStyle(widget.labelColor ?? BLACK),
              ),
      ),
      left: 25,
    );
  }

  Positioned underTitleLine(BuildContext context) {
    return Positioned(
      child: Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
          color: WHITE,
          height: 1.5,
          child: widget.isMandatoryUDA == true
              ? getMandatoryUDATitle(
                  "  " + widget.title + "  ", context, widget.labelColor)
              : Text(
                  "  " + widget.title + "  ",
                  style: FontUtils.inputsTitlesTextStyle(
                      widget.labelColor ?? BLACK),
                )),
      left: 15,
    );
  }

  Container childWidget() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Container(
        decoration: widget.decoration ??
            BoxDecoration(
              color: WHITE,
              border: Border.all(
                color: widget.borderColor ?? DARK_GREY,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(TEXTFIELD_BORDER_RADUIS),
            ),
        child: widget.child,
      ),
    );
  }
}
