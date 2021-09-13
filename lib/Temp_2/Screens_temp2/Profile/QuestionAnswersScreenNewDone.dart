import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';

class Answers extends StatefulWidget {
  @override
  _AnswersState createState() => _AnswersState();
}

class _AnswersState extends State<Answers> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
        height: 15,
      ),
      buildBuildHeaderWidget(),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(30, 20, 20, 0),
        child: Text(
          "question",
          style:
              TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: BLUE),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 50, 10),
        child: Text("answers", style: normalTextStyle),
      ),
      SizedBox(
        height: 30,
      ),
      Padding(
        padding: EdgeInsets.only(right: 130),
        child: Text('Was this Answer helpful ?', style: normalTextStyle),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Row(
          children: <Widget>[
            RaisedButton(
              child: Text(YES),
              onPressed: () {},
              color: WHITE,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: BLACK26)),
            ),
            SizedBox(
              width: 15,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: BLACK26),
              ),
              child: Text(NO),
              color: WHITE,
              onPressed: () {},
            )
          ],
        ),
      ),
    ]);
  }

  buildBuildHeaderWidget() => Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
              SizedBox(height: 5),
              Container(
                width: 60,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ],
          ),
        ),
      );
}
