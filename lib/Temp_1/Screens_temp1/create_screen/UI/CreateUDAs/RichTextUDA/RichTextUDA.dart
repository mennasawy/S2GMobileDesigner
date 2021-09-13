import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/RichTextUDA/EditRichTextUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/RichTextUDA/Temp2EditRichTextUDA.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RichTextUtils.dart';

class RichTextUDA extends StatefulWidget {
  final UDAsWithValues richTextUda;
  final FormModes mode;
  final int template;

  final bool isVisible;
  final bool isReadOnly;
  final bool isMandatory;

  final Function(String) onValueChange;
  final Function(String, bool, bool) onUDAChange;
  const RichTextUDA(
      {Key key,
      this.richTextUda,
      this.isVisible,
      this.isReadOnly,
      this.isMandatory,
      this.onValueChange,
      this.onUDAChange,
      this.template,
      this.mode})
      : super(key: key);
  @override
  _RichTextUDAState createState() => _RichTextUDAState();
}

class _RichTextUDAState extends State<RichTextUDA> {
  TextEditingController textController = new TextEditingController();
  String richTextData;
  String richTextValueForView;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    richTextData = widget.richTextUda.udaValue;
    textController.text = widget.richTextUda.richTextValue;
    richTextValueForView = updateRichTextValue(
        richTextData ?? "", widget.richTextUda.richTextValue ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return drawWidgetOrEmptyContainer(
      widget.isVisible == true && widget.richTextUda.location != true,
      getUDAWithTitleWidget(
          context,
          richTextBodyWidget(),
          widget.richTextUda.udaCaption,
          widget.richTextUda.udaDescription,
          widget.richTextUda.validationMessage,
          widget.richTextUda.isValidationCondMsgWarn,
          widget.isMandatory,
          hexToColor(widget.richTextUda.labelColor)),
    );
  }

  Widget richTextBodyWidget() {
    return Stack(
      children: <Widget>[
        Container(
          height: getScreenHeight(context) * 0.2,
          decoration: buildContainerOutlineInputBorder(),
          child: richTextWidget(trimText(richTextValueForView, 80)),
        ),
        Column(
          children: <Widget>[
            SizedBox(
              height: getScreenHeight(context) * 0.13,
            ),
            richTextIconsWidget(richTextData ?? ""),
          ],
        ),
      ],
    );
  }

  Widget richTextIconsWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        richTextIcon(
            Icons.add, (!widget.isReadOnly) ? onRichTextAddIconPressed : null),
        richTextIcon(Icons.clear_all,
            (!isEmptyText(text)) ? onRichTextMaximizeIconPressed : null)
      ],
    );
  }

  richTextIcon(IconData icon, Function onIconPressed) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 20,
      onPressed: onIconPressed,
    );
  }

  onRichTextAddIconPressed() {
    switch (widget.template) {
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditRichText(
                      richTextMode: RichTextMode.ViewAndEdit,
                      richText: richTextData,
                      onValueChange: widget.onValueChange,
                      textController: textController,
                      mode: widget.mode,
                      richTextUda: widget.richTextUda,
                    ))).then((value) {
          setState(() {
            richTextValueForView = value ?? "";
          });
        });
        break;
      case 2:
        Navigator.of(context)
            .push(openAnimatedRoute(Temp2EditRichTextUDA(
          richTextMode: RichTextMode.ViewAndEdit,
          richText: richTextData,
          onValueChange: widget.onValueChange,
          textController: textController,
          mode: widget.mode,
          richTextUda: widget.richTextUda,
        )))
            .then((value) {
          setState(() {
            richTextValueForView = value ?? "";
          });
        });
        break;
      default:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditRichText(
                      richTextMode: RichTextMode.ViewAndEdit,
                      richText: richTextData,
                      onValueChange: widget.onValueChange,
                      textController: textController,
                      mode: widget.mode,
                      richTextUda: widget.richTextUda,
                    ))).then((value) {
          setState(() {
            richTextValueForView = value ?? "";
          });
        });
    }
  }

  onRichTextMaximizeIconPressed() {
    switch (widget.template) {
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditRichText(
                      richTextMode: RichTextMode.ViewOnly,
                      richText: widget.richTextUda.udaValue,
                    )));
        break;
      case 2:
        Navigator.of(context).push(openAnimatedRoute(Temp2EditRichTextUDA(
          richTextMode: RichTextMode.ViewOnly,
          richText: widget.richTextUda.udaValue,
        )));
        break;
      default:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditRichText(
                      richTextMode: RichTextMode.ViewOnly,
                      richText: widget.richTextUda.udaValue,
                    )));
    }
  }
}
