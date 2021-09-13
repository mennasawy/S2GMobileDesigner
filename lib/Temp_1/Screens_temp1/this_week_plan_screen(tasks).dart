
import 'package:flutter/material.dart';

class WeekPlanScreen extends StatelessWidget {
  static const routeName = '/WeekPlanScreen1';
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
          title: const Text(' WeekPlanScreen  temp 1'),
        ),
        body: const Center(
          child: Text('Screen'),
        ),
      ),
    );
  }
}