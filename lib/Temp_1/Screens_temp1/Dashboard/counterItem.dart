import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class CounterItem extends StatefulWidget {
  @override
  _CounterItemState createState() => _CounterItemState();
}

class _CounterItemState extends State<CounterItem> {
  void _selectedChart(BuildContext ctx) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // () => _selectedChart(context),
//      splashColor: Theme.of(context).primaryColor,
//      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        height: getScreenHeight(context) * 0.16,
        child: Stack(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("counter chart",
                      style:
                          normalBoldedTextStyle // TextStyle(fontWeight: FontWeight.bold),
                      ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  Row(
                    //  crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'count',
                                style: normalTextStyle,
                              ),
                              Text(
                                "sub title",
                                overflow: TextOverflow.ellipsis,
                                style: normalTextStyle,
                              ),
                            ],
                          ),
                          flex: 2),
                      // SizedBox(
                      //   width: 30,
                      // ),
                      Expanded(
                        flex: 1,
                        child: Container(
//                        width: 40,
//                        height: 40,
                          child: IconButton(
                            icon: Icon(
                              Icons.home,
                              color: Colors.grey,
                              size: 30,
                            ), // FaIcon(FontAwesomeIcons.gamepad),
                            onPressed: null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
