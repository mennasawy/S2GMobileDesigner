import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/UDAHelp_Presenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';

class HelpUDA extends StatefulWidget {
  String message;
  final String title;
  final String validationMessage;
  final String labelColor;
  bool isLocation = false;

  int helpID;
  final bool isVisible;

  HelpUDA({
    Key key,
    this.message,
    this.title,
    this.validationMessage,
    this.helpID,
    this.labelColor,
    this.isLocation,
    this.isVisible,
  }) : super(key: key);

  @override
  _HelpUDAState createState() => _HelpUDAState();
}

class _HelpUDAState extends State<HelpUDA> implements HelpUDAViewContract {
  HelpPresenter helpUDAPresenter;
  bool isHelpMessageLoaded = false;
  String loadingText = "Loading...";
  ScrollController scrollController = ScrollController();

  @override
  void didUpdateWidget(HelpUDA oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    widget.message = widget.message ?? oldWidget.message;
  }

  @override
  Widget build(BuildContext context) {
    if (isHelpMessageLoaded == false) {
      getHelpMessageText();
    }
    return drawWidgetOrEmptyContainer(
        widget.isVisible == true && widget.isLocation != true,
        getHelpUDABoxWidget());
  }

  Container getHelpUDABoxWidget() {
    return Container(
      key: widget.key,
      width: getScreenWidth(context) - 30,
      decoration: BoxDecoration(
        color: Color(0xfffdf4c9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
        child: getHelpUDAContentWidget(),
      ),
    );
  }

  Column getHelpUDAContentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        drawWidgetOrEmptyContainer(
          widget.title != null,
          Padding(
              padding: EdgeInsets.only(left: 13.0, right: 13.0, bottom: 5),
              child: getHelpUDATitleWidget()),
        ),
        //Scrollable help message text with max height of 200
        Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 13.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 30.0,
              maxHeight: 150.0,
            ),
            child: SingleChildScrollView(
              child: Text(
                (widget.message != null) ? widget.message : '',
                style: normalTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Padding getHelpUDATitleWidget() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          widget.title,
          textAlign: TextAlign.start,
          style: normalBoldedTextStyle,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  getHelpMessageText() {
    helpUDAPresenter = HelpPresenter(
      helpUDAView: this,
      context: context,
      helpUDAID: widget.helpID,
    );
    helpUDAPresenter.loadHelp();
  }

  @override
  void setHelpUDAText(String message) {
    // TODO: implement setHelpUDAText
    setState(() {
      isHelpMessageLoaded = true;
      widget.message = message;
    });
  }
}
