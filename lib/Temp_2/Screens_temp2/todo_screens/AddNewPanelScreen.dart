import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/AppBars/AppBars.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:flutter/material.dart';

class AddNewPanelscreen2 extends StatelessWidget {
  static const routeName = '/AddNewPanelscreen';
  List<Color> select = [
    Color(0xFFF44336),
    Color(0xFFFF5722),
    Color(0xFFFFEB3B),
    Color(0xFF8BC34A),
    Color(0xFF7C4DFF),
    Color(0xFFB71C1C)
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: GREY,
        appBar: Template2AppBars(
          screenName: 'New Panel',
          appBarType: Template2AppBarType.secendary,
          onTap: () {},
        ),
        body: ListView(
          children: <Widget>[
            addPanel(context),
          ],
        ),
      ),
    );
  }

  Widget addPanel(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
                padding: EdgeInsetsDirectional.only(start: 5.0),
                child: Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: buildTextField(
                        title: 'Panel Name',
                        hint: 'Panel name here',
                        inputType: InputType.text,
                        context: context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildColorPicker(context), // problem here
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: buildTextField(
                        title: 'Seqence',
                        hint: 'Seqence',
                        inputType: InputType.number,
                        context: context),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  createPanelButton(),
                ])),
          ],
        ),
      ),
    );
  }

  buildTextField({String title, String hint, InputType inputType, context}) {
    return SizedBox(
      width: getScreenWidth(context) * 0.7,
      child: Temp2BasicTextInputUDA(
        isReadOnly: true,
        inputType: inputType,
        title: title,
        isMandatory: true,
        isVisible: true,
      ),
    );
  }

  Align createPanelButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(15),
        child: BasicButton(
          buttonHeight: 45,
          buttonWidth: 200,
          buttonText: 'Create Panel',
          onPressedButton: () {},
        ),
      ),
    );
  }

  InputDecoration getInputDecoration({String hint}) {
    OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.black54,
      ),
    );
    return InputDecoration(
      focusedBorder: border,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: border,
    );
  }

  Widget buildColorPicker(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getPanelColorLabel(context),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              itemCount: select.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: index == 0
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 30,
                          )
                        : Container(
                            height: 0,
                            width: 0,
                          ),
                    color: select[index],
                    elevation: 5,
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget getPanelColorLabel(context) {
    return Container(
      height: 30,
      child: LabelTitle("color", context, true),
    );
  }
}
