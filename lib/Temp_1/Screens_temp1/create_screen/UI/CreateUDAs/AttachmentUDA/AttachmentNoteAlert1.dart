import 'dart:io';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/Attachment/AttachUploadPresenter.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:flutter/material.dart';

class AttachmentNoteAlert extends StatelessWidget {
  BuildContext context;

  List<File> uploadedFilesList = [];

  AttachmentUDAPresenter attachUploadPresenter;
  AttachmentNoteAlert({this.context, this.uploadedFilesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
//      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[],
      ),
    );
  }

  Widget showDialog1(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),

            //this right here

            child: Container(
              height: 300,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child:
//          SingleChildScrollView(child: Column(children: <Widget>[

                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Icon(Icons.phone_iphone),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Icon(Icons.phone_iphone),
                        ),
                        Text('File Name.pdf')
                      ],
                    ),

                    TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: GREY,
                                width: TEXTFIELD_BORDER_RADUIS_WIDTH),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: GREY,
                                width: TEXTFIELD_BORDER_RADUIS_WIDTH),
                          ),
                          hintText: 'Write Comment here '),
                      maxLines: 3,
                    ),
//                        SizedBox(height: 20,),
                    Center(
                        child: FlatButton(
                      //   onPressed: ()=>attachUploadPresenter.loadData(context, uploadedFilesList,data),
                      onPressed: () {},
                      child: Text(
                        'ok',
                        style: TextStyle(fontSize: 20, color: BLUE),
                      ),
                    )
//                      onPressed: (){setState(() {
//
//                      }
//                      );}
//                      ,
                        )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
