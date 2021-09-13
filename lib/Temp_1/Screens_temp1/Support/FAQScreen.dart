import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class FAQScreen extends StatefulWidget {
  @override
  _FAQScreenState createState() => _FAQScreenState();
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          padding: EdgeInsets.only(top: 0),
          decoration: getBoxDecoration(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FittedBox(
                      fit: BoxFit.contain, //new modification ->Monira
                      child: Text(
                        "FQA",
                        style: normalBoldedTextStyle,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: getRaisedButtonsItemList(context),
                ),
                Expanded(
                  flex: 8,
                  child: getTextItemList(),
                ),
              ])),
    );
  }

  Widget getRaisedButtonsItemList(
    BuildContext context,
  ) {
    List questionlist = ["vvv", "Ccccc"];
    return Container(
        height: 100,
        width: getScreenWidth(context),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 0),
            itemCount: 4,
//          raisedButtonsItemList().length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 15,
                ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: raisedButtonsItemList(index)[index],
              );
            }));
  }

  Widget getTextItemList() {
    return Container(
        height: 400,
        width: 400,
        child: ListView.separated(
          padding: EdgeInsets.only(top: 0),
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 1,
            indent: 15,
            endIndent: 15,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                title: Text("text"),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                ));
          },
        ));
  }

  List<Widget> raisedButtonsItemList(int index) {
    return [
      buildRaisedButton(index),
      buildRaisedButton(index),
      buildRaisedButton(index),
      buildRaisedButton(index),
    ];
  }

  RaisedButton buildRaisedButton(int index) {
    return RaisedButton(
      onPressed: () {},
      shape: getRoundedRectangleBorder(),
      color: index == 0 ? BLACK : Colors.white,
      child: Text(
        "title",
        style: TextStyle(
          color: index == 0 ? WHITE : BLACK,
        ),
      ),
    );
  }

  RoundedRectangleBorder getRoundedRectangleBorder() {
    return RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.black26));
  }

  BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white, // white
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    );
  }
}
