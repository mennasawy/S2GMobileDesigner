// import 'package:templets/Temp_1/Screens_temp1/create_screen/local/LocalizationFile.dart';
// import 'package:templets/Temp_1/Screens_temp1/create_screen/OldFiles/Pages/genericobjectmonitor/MonitorPage_old.dart';
// import 'dart:js_util';
// import 'package:templets/Utilities/WidgetsUtilites/RaisedButton.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/map.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';

class LocationInfoScreen extends StatefulWidget {
  final FormModes mode;
  final MapObject mapObject;
  final double longtitude;
  final double latitude;

  LocationInfoScreen({
    Key key,
    this.mapObject,
    this.mode,
    this.longtitude,
    this.latitude,
  }) : super(key: key);

  @override
  _LocationInfoScreenState createState() => _LocationInfoScreenState();
}

class _LocationInfoScreenState extends State<LocationInfoScreen> {
  MapObject newMapObject;
  bool isreadonly;
  bool isMessageWarning;

  TextEditingController _addressController;
  TextEditingController _locationDescriptionController;
  TextEditingController _locationNameController;
  TextEditingController _informationController;
  TextEditingController _longtitudeController;
  TextEditingController _latitudeController;

  Color pickerColor = Color(0xff443a49);
  Color pickerColor2 = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

  String labelColor;
  String pinColor;

  @override
  void initState() {
    isMessageWarning = false;
    newMapObject = MapObject(
      address: "",
      information: "",
      label: "",
      labelColor: "$pickerColor",
      latitude: '${widget.latitude}',
      locationDescription: '',
      locationName: '',
      longtitude: '${widget.longtitude}',
      pinColor: "$pickerColor2",
    );
    if (widget.mapObject != null) {
      newMapObject = widget.mapObject;
    }
    selectedMode();

    super.initState();
  }

  void updateObject({String key, var value}) {
    setState(() {
      newMapObject.locationName =
          key == 'locationName' ? value : newMapObject.locationName;
      newMapObject.address = key == 'address' ? value : newMapObject.address;
      newMapObject.information =
          key == 'information' ? value : newMapObject.information;
      newMapObject.label = key == 'label' ? value : newMapObject.label;
      newMapObject.locationDescription =
          key == 'description' ? value : newMapObject.locationDescription;
      newMapObject.labelColor =
          key == 'labelColor' ? value : newMapObject.labelColor;
      newMapObject.latitude = key == 'latitude' ? value : newMapObject.latitude;
      newMapObject.longtitude =
          key == 'longitude' ? value : newMapObject.longtitude;
      newMapObject.pinColor = key == 'pinColor' ? value : newMapObject.pinColor;
    });
  }

  void selectedMode() {
    switch (widget.mode) {
      case FormModes.newMode:
        isreadonly = false;
        break;
      case FormModes.editMode:
        isreadonly = false;
        break;
      case FormModes.viewMode:
        isreadonly = true;
        break;
      default:
        isreadonly = false;
    }
  }

  Widget colorButton({String label, var colorVariable, String key}) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: RaisedButton(
          child: Row(
            children: [
              Icon(Icons.color_lens),
              SizedBox(
                width: 10,
              ),
              Text(label),
            ],
          ),
          onPressed: () {
            colorPicker(key: key);
            updateObject(
                key: key,
                value: key == 'labelColor' ? "$labelColor" : "$pinColor");
          }),
    );
    // );
  }

  void changeColor(
    Color color,
  ) {
    setState(() {
      // labelColor = "$color";
      pickerColor = color;
    });
  }

  void changeColor2(
    Color color,
  ) {
    setState(() {
      // pinColor = "$color";
      pickerColor2 = color;
    });
  }

  dynamic colorPicker({var key}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: [
            NTGButton(
              buttonText: "done",
              onPressedButton: () {
                Navigator.pop(context);
                newMapObject.labelColor = "$pickerColor";
                newMapObject.pinColor = "$pickerColor2";
              },
            ),
          ],
          title: Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: key == "labelColor" ? pickerColor : pickerColor2,
              onColorChanged: key == "labelColor" ? changeColor : changeColor2,
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE,
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithBack,
          pageName: 'location screen',
          titleColor: Colors.black,
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BasicTextInputUDA(
                    validationMessage: isMessageWarning ? 'Warning' : "",
                    inputValue: newMapObject.locationName,
                    isVisible: true,
                    inputHint: "Name",
                    textController: _locationNameController,
                    title: "Name",
                    isMandatory: true,
                    onValueChange: (v) {
                      updateObject(key: "locationName", value: v);
                    },
                  ),
                  SizedBox(height: 10),
                  BasicTextInputUDA(
                    inputValue: newMapObject.locationDescription ?? "",
                    isVisible: true,
                    maxLines: 5,
                    inputHint: "description",
                    textController: _locationDescriptionController,
                    title: "description",
                    onValueChange: (v) {
                      updateObject(key: "description", value: v);
                    },
                  ),
                  SizedBox(height: 10),
                  BasicTextInputUDA(
                    inputValue: newMapObject.information ?? '',
                    isVisible: true,
                    inputHint: "information",
                    textController: _informationController,
                    title: "information",
                    onValueChange: (v) {
                      updateObject(key: "information", value: v);
                    },
                  ),
                  SizedBox(height: 10),
                  BasicTextInputUDA(
                    inputValue: newMapObject.address ?? '',
                    isVisible: true,
                    inputHint: "Address",
                    textController: _addressController,
                    title: "Address",
                    onValueChange: (v) {
                      updateObject(key: "address", value: v);
                    },
                  ),
                  SizedBox(height: 10),
                  BasicTextInputUDA(
                    inputValue: newMapObject.longtitude ?? '',
                    isVisible: true,
                    inputHint: "longitude",
                    textController: _longtitudeController,
                    title: "longitude",
                    isReadOnly: true,
                    onValueChange: (v) {
                      updateObject(key: "longitude", value: v);
                    },
                  ),
                  SizedBox(height: 10),
                  BasicTextInputUDA(
                    inputValue: newMapObject.latitude ?? '',
                    isVisible: true,
                    inputHint: 'latitude',
                    textController: _latitudeController,
                    title: "latitude",
                    isReadOnly: true,
                    onValueChange: (v) {
                      updateObject(key: "latittude", value: v);
                    },
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      colorButton(
                        label: "label color",
                        key: 'labelColor',
                      ),
                      colorButton(
                        label: "pin color",
                        key: 'pinColor',
                      ),
                    ],
                  ),
                  NTGButton(
                    buttonText: "submit",
                    onPressedButton: () {
                      if (isEmptyText(newMapObject.locationName)) {
                        setState(() {
                          isMessageWarning = true;
                        });
                        return;
                      }
                      Navigator.pop(context, newMapObject);
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
