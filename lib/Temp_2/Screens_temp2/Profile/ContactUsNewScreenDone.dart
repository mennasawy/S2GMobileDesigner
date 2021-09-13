import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/BasicButton.dart';
import 'package:templets/Utilities/app_constants.dart';

class ContactUsNewSCreen extends StatelessWidget {
  const ContactUsNewSCreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController;
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: BasicTextInputUDA(
              inputDecoration: getInputDecoration(),
              isVisible: true,
              title: "Title",
              inputHint: "Title",
              textController: messageController,
              // color: Colors.white,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Message',
                        style: normalTextStyle,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 7,
                    decoration: getInputDecoration(),
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: BasicButton(
                buttonText: "Send Message",
                onPressedButton: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  InputDecoration getInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.black,
        ),
      ),
    );
  }
}
