
import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  static const routeName = '/PrivacyScreen1';
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
          title: const Text(' PrivacyScreen  temp 1'),
        ),
        body: const Center(
          child: Text('Screen'),
        ),
      ),
    );
  }
}