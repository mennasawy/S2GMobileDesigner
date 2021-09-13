import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/Support/SupportScreenHeader.dart';

class SupportScreen extends StatelessWidget {
  static const routeName = '/SupportScreen1';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SupportScreenHeader(),
    );
  }
}
