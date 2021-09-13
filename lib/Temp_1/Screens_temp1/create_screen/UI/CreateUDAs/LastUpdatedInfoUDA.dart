import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/BasicTextInputUDA.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';

class LastUpdatedInfoUDA extends StatefulWidget {
  // final LastUpdatedInfo lastUpdatedInfo;
  final String createDate;
  final String lastModificationDate;
  final String statusLastModificationDate;
  final String createdBy;
  final String lastModifiedBy;
  final num groupID;
  final UDAsWithValues uda;

  // LastUpdatedInfoUDA({Key key, this.lastUpdatedInfo,this.mode}) : super(key: key);
  LastUpdatedInfoUDA(
      {Key key,
      this.createDate,
      this.lastModificationDate,
      this.statusLastModificationDate,
      this.createdBy,
      this.lastModifiedBy,
      this.groupID,
      UDAsWithValues this.uda})
      : super(key: key);

  @override
  _LastUpdatedInfoUDAState createState() => _LastUpdatedInfoUDAState();
}

class _LastUpdatedInfoUDAState extends State<LastUpdatedInfoUDA> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  widget.uda.udaCaption,
                  style: titlesStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                infoUDA(
                  inputValue: widget.createDate ?? '',
                  title: 'createDate',
                ),
                infoUDA(
                  inputValue: widget.createdBy ?? '',
                  title: 'createdBy',
                ),
                infoUDA(
                    inputValue: widget.lastModificationDate ?? '',
                    title: "ModificationDate"),
                infoUDA(
                    inputValue: widget.lastModifiedBy ?? '',
                    title: "ModifiedBy"),
                infoUDA(
                    inputValue: widget.statusLastModificationDate ?? '',
                    title: "statusModificationDate"),
                infoUDA(
                  inputValue: widget.groupID != null ? "${widget.groupID}" : '',
                  title: 'groupID',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget infoUDA({String title, String inputValue}) {
    return Column(
      children: [
        BasicTextInputUDA(
          title: title ?? '',
          isReadOnly: true,
          inputHint: inputValue,
          isVisible: true,
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
