
import 'package:flutter/material.dart';

class TaskFormScreen2 extends StatelessWidget {
  static const routeName = '/TaskFormScreen';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
          title: const Text(' TaskFormScreen  temp 2'),
        ),
        body: const Center(
          child: Text('Screen'),
        ),
      ),
    );
  }
}