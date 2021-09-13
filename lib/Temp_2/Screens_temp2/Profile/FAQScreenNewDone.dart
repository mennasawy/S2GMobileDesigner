import 'package:flutter/material.dart';
import 'package:templets/Utilities/utility_methods.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: raisedButtonslist(context),
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 8,
            child: getTextItemList(),
          ),
        ]);
  }

  Container raisedButtonslist(BuildContext context) {
    return Container(
      height: getScreenHeight(context) * 0.1,
      width: getScreenWidth(context),
      padding: EdgeInsets.fromLTRB(5, 0, 0, 10),
      color: Colors.grey[50],
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 4,
          separatorBuilder: (BuildContext context, int index) => SizedBox(
                width: 15,
              ),
          itemBuilder: (BuildContext context, int index) {
            return raisedButtonsItemList()[index];
          }),
    );
  }

  Widget getTextItemList() {
    return Container(
        height: 400,
        width: 400,
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => buildQuestionTab(context)));
  }

  List<Widget> raisedButtonsItemList({bool selectedButtonId}) {
    return [
      buildRaisedButton(),
      buildRaisedButton(),
      buildRaisedButton(),
      buildRaisedButton(),
    ];
  }

  dynamic buildRaisedButton() {
    return RaisedButton(
      elevation: 10,
      shape: getRoundedRectangleBorder(),
      color: Colors.blue[400],
      child: Text(
        "title",
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  RoundedRectangleBorder getRoundedRectangleBorder() {
    return RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(20),
        side: BorderSide(color: Colors.black26));
  }

  dynamic buildQuestionTab(BuildContext context,
      {String question, Function onTabPressed}) {
    return GestureDetector(
      onTap: onTabPressed,
      child: Container(
        width: getScreenWidth(context) * 1,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  question ?? 'questtttttttttttion ?',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}
