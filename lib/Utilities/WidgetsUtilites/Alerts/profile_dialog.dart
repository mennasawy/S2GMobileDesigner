 import 'package:flutter/material.dart';

 class ProfileDialog extends StatelessWidget {

   _showErrorDialog (BuildContext context){
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text(
          'Do you want to remove the item from the cart?',
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(ctx).pop(false);
            },
          ),
          FlatButton(
            child: Text('Yes'),
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
          ),
        ],
      ),
    );
  }
  
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Profile Dialog'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => _showErrorDialog,
          child: Text('Show Dialog'),
        ),
      ),
    );
   }
 }
 