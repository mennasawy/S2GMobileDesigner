import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/RichTextUDA/EditRichTextUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/RichTextUDA/RichTextUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Temp2EditRichTextUDA extends StatefulWidget {
  final RichTextMode richTextMode;
  final UDAsWithValues richTextUda;
  String richText;
  final Function onValueChange;
  final TextEditingController textController;
  final FormModes mode;
  Temp2EditRichTextUDA({
    Key key,
    this.richTextMode,
    this.richText,
    this.onValueChange,
    this.textController,
    this.mode,
    this.richTextUda,
  }) : super(key: key);

  @override
  _Temp2EditRichTextUDAState createState() => _Temp2EditRichTextUDAState();
}

class _Temp2EditRichTextUDAState extends State<Temp2EditRichTextUDA> {
  String oldRichText;
  WebViewController _controller;

  @override
  void initState() {
    super.initState();
    widget.richText ??= "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: GREY,
            resizeToAvoidBottomInset: true,
            resizeToAvoidBottomPadding: false,
//            backgroundColor: WHITE,
            appBar: Template2AppBars(
              screenName: widget.richTextUda?.udaCaption ?? '',
              appBarType: Template2AppBarType.secendary,
            ),
            body: Container(
              margin: EdgeInsets.all(7),
              child: widget.richTextMode == RichTextMode.ViewOnly
                  ? ViewRichTextWidget()
                  : ViewAndEditRichTextWidget(),
            )));
  }

  Widget ViewAndEditRichTextWidget() {
    return Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            widget.richText != null && widget.richText != ""
                ? ReadOnlyRichText()
                : Container(),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
                elevation: 3.0,
                child: EditableRichText(),
              ),
            ),
            Center(child: saveButton(context)),
          ],
        ));
  }

  TextField EditableRichText() {
    return TextField(
      controller: widget.textController,
      keyboardType: TextInputType.multiline,
      maxLines: 20,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 10.0),
          hintStyle: hintTextFieldTextStyle,
          enabled: true,
          enabledBorder: getBorder(),
          focusedBorder: getBorder(),
          disabledBorder: getBorder(),
          focusedErrorBorder: getBorder(),
          filled: true,
          fillColor: WHITE),
    );
  }

  getBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: GREY,
        width: 1,
      ),
      borderRadius: BorderRadius.circular(5),
    );
  }

  Widget saveButton(context) {
    return Container(
        margin: EdgeInsets.only(right: 8),
        alignment: Alignment.bottomRight,
        child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(10),
            child: BasicButton(
                buttonHeight: 45,
                buttonWidth: 200,
                buttonText: "OK",
                onPressedButton: onSubmitButtonPressed)));
  }

  Widget ViewRichTextWidget() {
    return Column(
      children: <Widget>[
        ReadOnlyRichText(),
      ],
    );
  }

  Widget ReadOnlyRichText() {
    final Set<Factory> gestureRecognizers = [
      Factory(() => EagerGestureRecognizer()),
    ].toSet();
    return Expanded(
      flex: 1,
      child: Container(
        child: WebView(
          gestureRecognizers: gestureRecognizers,
          // initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _controller.loadUrl(Uri.dataFromString(
              widget.richText,
              mimeType: 'text/html',
              encoding: Encoding.getByName('utf-8'),
            ).toString());
          },
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }

  onSubmitButtonPressed() {
    (widget.richTextMode == RichTextMode.ViewOnly)
        ? popScreen(context)
        : editRichTextSubmittionAction();
  }

  editRichTextSubmittionAction() {
    updateRichText();
    Navigator.of(context).pop(updateRichTextValue(
        widget.richText ?? "", widget.textController.text ?? ""));
  }

  updateRichText() {
    setState(() {
      widget.onValueChange(widget.textController.text);
    });
  }
}
