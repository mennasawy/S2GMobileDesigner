import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/MentionNoteEmpInfo.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Note/savedNote.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Note/NoteDetailsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/Note/NoteUDAUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/CicularAvatarWidget.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDetailScreen extends StatefulWidget {
  final savedNote noteItemDetails;

  const NoteDetailScreen({Key key, this.noteItemDetails}) : super(key: key);
  @override
  _NoteDetailScreenState createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen>
    implements NoteDetailsView {
  NoteDetailsPresenter _presenetr;
  List<String> spinnerItems = ['Important', 'Not Important'];
  String dropdownValue = 'Important';

  @override
  void initState() {
    _presenetr = NoteDetailsPresenter(widget.noteItemDetails, this, context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithClose,
          pageName: "Note details",
        ),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: SingleChildScrollView(
                  child: RichText(
                    text: TextSpan(
                        style: noteTextStyle,
                        children: noteContentWidgetList(
                            context,
                            _presenetr.noteItemDetails.description,
                            NoteNavigationMode.noteDetails,
                            _presenetr.getMentionedUserData)),
                  ),
                ),
              ),
              SizedBox(
                height: getScreenHeight(context) * 0.04,
              ),
              RichText(
                text: TextSpan(style: noteTextStyle, children: <TextSpan>[
                  TextSpan(text: "By ", style: noteTextStyle),
                  TextSpan(
                      text: _presenetr.noteItemDetails.userName,
                      style: normalLightBlueTextStyle),
                  TextSpan(
                      text:
                          '- ${new DateFormat("dd-MM-yyyy").format(DateTime.fromMillisecondsSinceEpoch(_presenetr.noteItemDetails.dateTime, isUtc: true))}',
                      style: noteTextStyle),
                ]),
              ),
              Spacer(),
              SizedBox(
                height: getScreenHeight(context) * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTypeDropDownButton() {
    return (DropdownButton<String>(
      value: dropdownValue,
      style: TextStyle(color: Colors.black, fontSize: 18),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      isExpanded: true,
      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String value) {
        setState(() {
          dropdownValue = value;
        });
      },
    ));
  }

  @override
  void changeState() {
    setState(() {});
  }

  @override
  void onMentionedUserDataLoaded(MentionedUserInfo userInfo) {
    showPopupProfile(context, userInfo);
  }

  Future showPopupProfile(BuildContext context, var selectedItem) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              height: getScreenHeight(context) * 0.85,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.cancel,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              try {
                                Navigator.pop(context, ''); //close the popup
                              } catch (e) {}
                            },
                          ),
                        ]),
                    // SizedBox(
                    //   height: 5.0,
                    // ),
                    Center(
                      child: Container(
                        width: 110,
                        height: 110,
                        child: (selectedItem.image != null)
                            ? CircleAvatar(
                                radius: 50,
                                backgroundColor: WHITE,
                                backgroundImage: Image.memory(
                                        convertStringtoImage(
                                            selectedItem.image))
                                    .image,
                              )
                            : CircularAvatarWidget(
                                type: ImageType.AssetImage,
                                image: IMG_PROFILE_NOPHOTO,
                              ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            border: Border.all(width: 2, color: BLUE)),
                      ),
                    ),
                    BasicTextInputUDA(
                      inputType: InputType.text,
                      inputDecoration: buildInputDecorations(
                          context, selectedItem.name, false, null, null, null),
                      isVisible: true,
                      isReadOnly: true,
                      title: "Name",
                      isMandatory: false,
                      inputHint: selectedItem.name,
                    ),
                    BasicTextInputUDA(
                      inputType: InputType.text,
                      inputDecoration: buildInputDecorations(
                          context, '', false, null, null, null),
                      isVisible: true,
                      isReadOnly: true,
                      title: "Job title",
                      isMandatory: false,
                    ),
                    BasicTextInputUDA(
                      inputType: InputType.text,
                      inputDecoration: buildInputDecorations(
                          context, selectedItem.email, false, null, null, null),
                      isVisible: true,
                      isReadOnly: true,
                      title: "Email",
                      isMandatory: false,
                      inputHint: selectedItem.email,
                    ),
                    BasicTextInputUDA(
                      inputType: InputType.text,
                      inputDecoration: buildInputDecorations(
                          context,
                          selectedItem.mobilePhone,
                          false,
                          IC_TEXT_FIELD_CHECK,
                          null,
                          null),
                      isVisible: true,
                      isReadOnly: true,
                      title: "phone",
                      isMandatory: false,
                      inputHint: selectedItem.mobilePhone,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
