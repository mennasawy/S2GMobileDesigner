import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Note/NoteMentionPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBarTemplate1/NTGAppBar.dart';
import 'package:templets/Utilities/WidgetsUtilites/FontUtils.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';

class NoteCreation extends StatefulWidget {
  final Function addIconAction;

  const NoteCreation({Key key, this.addIconAction}) : super(key: key);

  @override
  _NoteCreationState createState() => _NoteCreationState();
}

class _NoteCreationState extends State<NoteCreation>
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
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        appBar: NTGAppBar(
          appBarType: AppBarType.appBarWithClose,
          pageName: "Add new note",
        ),
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 3.0,
                    child: buildNoteTextContainer("New Note"),
                  ),
                  !_presenter.userMentionIsLoading
                      ? Center(
                          child: Container(
                              height: getScreenHeight(context) * 0.2,
                              child: _usersList(_presenter.listUsers)))
                      : Container(),
                  SizedBox(
                    height: getScreenHeight(context) * 0.07,
                  ),
                  NTGButton(
                      buttonText: "Save",
                      onPressedButton: () => _presenter.HandleSaveButton()),
                  SizedBox(
                    height: getScreenHeight(context) * 0.05,
                  ),
                ],
              ),
            ),
            _presenter.isDataLoaded() ? Container() : DrawProgressBar()
          ],
        ),
      ),
    );
  }

  Widget buildNoteTextContainer(String hint) {
    contentController.selection = TextSelection.fromPosition(
        TextPosition(offset: contentController.text.length));
    return Scrollbar(
      child: SingleChildScrollView(
        reverse: true,
        child: TextField(
            style: FontUtils.normalTextStyle(BLACK),
            controller: contentController,
//          focusNode: contentFocus,
            textInputAction: TextInputAction.newline,
            enableInteractiveSelection: false,
            autocorrect: false,
            keyboardType: TextInputType.multiline,
            maxLines: 8,
            decoration: getInputDecoration(context, hint, null, null, null),
            onSubmitted: (value) => _presenter.onNoteTextSubmitted(value),
            onChanged: (value) => _presenter.onNoteTextValueChanged(value)
            //    onChanged: (value) => onMentionPerson(value),
            ),
      ),
    );
  }

  Widget _usersList(items) {
    ScrollController _scrollController = ScrollController();
    return Container(
      width: getScreenWidth(context) * 0.9,
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
