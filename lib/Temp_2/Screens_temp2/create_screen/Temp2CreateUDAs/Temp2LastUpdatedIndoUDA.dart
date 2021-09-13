import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Temp_2/Screens_temp2/create_screen/Temp2CreateUDAs/Temp2BasicTextInputUDA.dart';

class Temp2LastUpdatedInfoUDA extends StatefulWidget {
  final String createDate;
  final String lastModificationDate;
  final String statusLastModificationDate;
  final String createdBy;
  final String lastModifiedBy;
  final num groupID;
  final UDAsWithValues uda;

  Temp2LastUpdatedInfoUDA(
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
  _Temp2LastUpdatedInfoUDAState createState() =>
      _Temp2LastUpdatedInfoUDAState();
}

class _Temp2LastUpdatedInfoUDAState extends State<Temp2LastUpdatedInfoUDA> {
  @override
  Widget build(BuildContext context) {
    return Temp2WidgetBorder(
      isMandatoryUDA: false,
      title: widget.uda.udaCaption ?? "",
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            infoUDA(inputValue: widget.createDate ?? '', title: 'createDate'),
            infoUDA(inputValue: widget.createdBy ?? '', title: 'createdBy'),
            infoUDA(
                inputValue: widget.lastModificationDate ?? '',
                title: "ModificationDate"),
            infoUDA(
                inputValue: widget.lastModifiedBy ?? '', title: "ModifiedBy"),
            infoUDA(
                inputValue: widget.statusLastModificationDate ?? '',
                title: "statusModificationDate"),
            infoUDA(
                inputValue:
                    (widget.groupID != null) ? widget.groupID.toString() : '',
                title: 'groupID'),
          ],
        ),
      ),
    );
  }

  Widget infoUDA({String title, String inputValue}) {
    return Column(
      children: [
        Temp2BasicTextInputUDA(
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
