
import 'package:flutter/material.dart';

class CheckLicense2 extends StatelessWidget {
  static const routeName = '/CheckLicensescreen';
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
          title: const Text(' CheckLicense screen temp 2'),
        ),
        body: const Center(
          child: Text('Screen'),
        ),
      ),
    );
  }
}