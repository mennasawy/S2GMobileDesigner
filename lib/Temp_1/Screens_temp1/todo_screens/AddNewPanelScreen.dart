import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/TextUDAsPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/Utilities/WidgetsUtilites/RaisedButtonWidget.dart';
import 'package:templets/Utilities/WidgetsUtilites/buildTextFieldMethods.dart';
import 'package:flutter/material.dart';

class AddNewPanelscreen1 extends StatelessWidget {
  static const routeName = '/AddNewPanelscreen1';
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
        appBar: AppBar(
          backgroundColor: WHITE,
          leading: InkWell(
            onTap: () {},
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
          title: const Text('New Panel',
              style: TextStyle(
                  fontFamily: 'Tahoma',
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
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
    return Container(
//                  height: MediaQuery.of(context).size.height - 75,
//                  width: MediaQuery.of(context).size.width - 40,
        child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(start: 5.0),
              child: Column(children: [
                SizedBox(
                  height: 10,
                ),
                BasicTextInputUDA(
                  inputType: InputType.text,
                  title: 'Panel Name',
                  isMandatory: true,
                  isVisible: true,
                  isReadOnly: true,
                  inputDecoration: buildInputDecorations(
                      context,
                      'Panel name here',
                      false,
                      IC_TEXT_FIELD_CHECK,
                      null,
                      null),
                  inputHint: 'Panel name here',
                ),
                SizedBox(
                  height: 20,
                ),
                buildgridView(context), // problem here

                // SizedBox(
                //   height: 10,
                // ),
                BasicTextInputUDA(
                  inputType: InputType.number,
                  title: 'Seqence',
                  isMandatory: true,
                  isVisible: true,
                  isReadOnly: true,
                  inputDecoration: buildInputDecorations(context, 'Seqence',
                      false, IC_TEXT_FIELD_CHECK, null, null),
                  inputHint: 'Seqence',
                ),
                SizedBox(height: 20),

                Align(
                    alignment: Alignment.bottomCenter,
                    child: NTGButton(
                      buttonText: 'Create Panel',
                      onPressedButton: () {},
                    )),
              ])),
//
        ],
      ),
    ));
  }

  Widget buildgridView(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        getPanelColorLabel(context),
        Container(
          height: getScreenHeight(context) * 0.23,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              //controller: _scrollController,
              shrinkWrap: false,
              scrollDirection: Axis.vertical,
              itemCount: select.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 5.0,
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
