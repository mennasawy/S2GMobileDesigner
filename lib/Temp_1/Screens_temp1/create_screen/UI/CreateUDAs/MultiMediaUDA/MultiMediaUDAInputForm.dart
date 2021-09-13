import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/GenericObject.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/MultiMediaUDA/MultiMediautils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'dart:ui';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';

class MultiMediaUDAInputForm extends StatefulWidget {
  MultiMediaUDAInputForm({
    Key key,
    this.genericObject,
    this.onMultiMediaUDAsValueChange,
    this.onvalueChange,
    this.uda,
    this.mode,
  }) : super(key: key);

  final UDAsWithValues uda;
  final Function onvalueChange;
  final Function onMultiMediaUDAsValueChange;
  final FormModes mode;
  final GenericObject genericObject;

  @override
  _MultiMediaUDAInputFormState createState() => _MultiMediaUDAInputFormState();
}

class _MultiMediaUDAInputFormState extends State<MultiMediaUDAInputForm> {
  BuildContext context;
  TextEditingController urlController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  MultiMediaUdaPresenter _multiMediaUdaPresenter;
  String lastUrl;
  String lastDescription;

  @override
  void initState() {
    super.initState();
    urlController.text = widget.uda.udaValue ?? null;
    descriptionController.text = widget.uda.multiMediaDescription ?? '';
    lastUrl = widget.uda.udaValue ?? '';
    lastDescription = widget.uda.multiMediaDescription ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    urlController.dispose();
    descriptionController.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onCancel(context),
      child: SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.fromLTRB(15, 20, 10, 20),
        children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Input Form',
                      style: subtitlesTextStyle,
                    ),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          onCancel(context);
                        })
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'URL',
                      style: normalTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration:
                          getInputDecoration(context, 'Url', null, null, null),
                      key: ValueKey('url'),
                      validator: (value) => validUrl(value),
                      onFieldSubmitted: (value) {
                        urlController.text = value;
                        widget.onvalueChange(widget.uda, value, urlController);
                      },
                      controller: urlController,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: normalTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      textDirection: TextDirection.ltr,
                      decoration: getInputDecoration(
                          context, 'description', null, null, null),
                      key: ValueKey('description'),
                      onFieldSubmitted: (value) {
                        descriptionController.text = value;
                        widget.onMultiMediaUDAsValueChange(
                            widget.uda, value, descriptionController);
                      },
                      controller: descriptionController,
                      textInputAction: TextInputAction.done,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                buttonsRow(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  onCancel(BuildContext context) {
    return Navigator.pop(context, [
      {
        'urlValue': lastUrl,
        'descriptionValue': lastDescription,
      }
    ]);
  }

  Row buttonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 100,
          child: NTGButton(
              buttonText: 'done',
              onPressedButton: () {
                final isValid = formKey.currentState.validate();
                if (!isValid) {
                  return;
                } else {
                  pop(context);
                }
                formKey.currentState.save();
              }),
        ),
        Container(
          width: 100,
          child: NTGButton(
              buttonText: 'delete',
              onPressedButton: () {
                ondelete();
                pop(context);
              }),
        ),
      ],
    );
  }

  pop(BuildContext context) {
    return Navigator.pop(context, [
      {
        'urlValue': urlController.text,
        'descriptionValue': descriptionController.text,
      }
    ]);
  }

  ondelete() {
    setState(() {
      urlController.text = descriptionController.text = '';
      widget.uda.udaValue = widget.uda.multiMediaDescription = null;
    });
  }

  validUrl(String value) {
    if (widget.uda.multiMediaTypeId == 1) {
      if ((value.startsWith('http') || value.startsWith('https')) &&
          (value.endsWith('.jpg') ||
              value.endsWith('.webp') ||
              value.endsWith('.webp&ct=g') ||
              value.endsWith('.gif'))) {
      } else
        return '''invalid image url,
         url must start with "http or https" &
         end with (.jpg or .webp or .gif
        or .webp&ct=g or at least 
        contain webp in it !)''';
    } else {
      if (value.endsWith('.mp4') ||
          value.endsWith('.3gp') ||
          value.endsWith('.mkv')) {
      } else
        return '''invalid video url, 
           url must start with "http or https" 
          & end with (.mkv or .3gp or .mp4!)''';
    }
  }
}
