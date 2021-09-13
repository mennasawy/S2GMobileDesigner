import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Note/NoteMentionPresenter.dart';
import 'package:templets/Utilities/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/DecorationUtils.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class Temp2AddNewNote extends StatefulWidget {
  final Function addIconAction;

  const Temp2AddNewNote({Key key, this.addIconAction}) : super(key: key);

  @override
  _NoteCreationState createState() => _NoteCreationState();
}

class _NoteCreationState extends State<Temp2AddNewNote>
    implements NoteCreationView {
  NoteCreationPresenter _presenter;
  FocusNode contentFocus = FocusNode();
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    _presenter = NoteCreationPresenter(this,
        context: context,
        addIconAction: widget.addIconAction,
        contentController: contentController);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Template2AppBars(
          appBarType: Template2AppBarType.secendary,
          screenName: "Add New Note",
        ),
        body: Stack(
          children: <Widget>[
            addNewNoteContent(),
            _presenter.isDataLoaded() ? Container() : DrawProgressBar()
          ],
        ),
      ),
    );
  }

  Widget addNewNoteContent() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          buildNoteTextContainer(),
          isNotEmptyList(_presenter.listUsers)
              ? Center(
                  child: Container(
                      padding: EdgeInsets.only(top: 3),
                      height: getScreenHeight(context) * 0.15,
                      child: mentionList(_presenter.listUsers)))
              : Container(),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: BasicButton(
              buttonWidth: getScreenWidth(context) * 0.4,
              buttonHeight: getScreenWidth(context) * 0.12,
              buttonText: 'Save',
              onPressedButton: () => _presenter.HandleSaveButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNoteTextContainer() {
    _presenter.contentController.selection = TextSelection.fromPosition(
        TextPosition(offset: _presenter.contentController.text.length));
    return Scrollbar(
      child: SingleChildScrollView(
        reverse: true,
        child: TextField(
            style: FontUtils.normalTextStyle(BLACK),
            controller: _presenter.contentController,
//          focusNode: contentFocus,
            textInputAction: TextInputAction.newline,
            enableInteractiveSelection: false,
            autocorrect: false,
            keyboardType: TextInputType.multiline,
            maxLines: 8,
            decoration:
                getTextFieldInputDecoration(padding: EdgeInsets.all(10.0)),
            onSubmitted: (value) => _presenter.onNoteTextSubmitted(value),
            onChanged: (value) => _presenter.onNoteTextValueChanged(value)
            //    onChanged: (value) => onMentionPerson(value),
            ),
      ),
    );
  }

  Widget mentionList(items) {
    ScrollController _scrollController = ScrollController();
    return Container(
      width: getScreenWidth(context) * 0.9,
      decoration: drawContainerBorder(WHITE, borderColor: BLACK26),
      child: ListView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: WHITE,
                backgroundImage: (items[index].image != null)
                    ? Image.memory(convertStringtoImage(items[index].image))
                        .image
                    : null,
              ),
              title: Text(
                items[index].name,
              ),
              onTap: () {
                _presenter.onMentionedUserSelected(index);
              },
              // Text(items.Name),
            );
          }),
    );
  }

  @override
  void changeState() {
    setState(() {});
  }
}
