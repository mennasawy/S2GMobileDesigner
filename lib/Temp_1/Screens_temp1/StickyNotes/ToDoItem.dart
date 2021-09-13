import 'package:flutter/material.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';

class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: showCardItem(),
    );
  }

  Widget showCardItem() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: getScreenWidth(context) * 0.92,
      child: Card(
        color: WHITE,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: ListTile(
            leading: Padding(
              padding: EdgeInsets.all(0.0),
              child: FittedBox(
                child: IconButton(
                    icon: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 30,
                )),
              ),
            ),
            title: Text('task 1'),
            trailing: IconButton(
              icon: Image.asset(
                IC_DELETE,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        //   ),
        // ],
      ),
    );
  }
}
