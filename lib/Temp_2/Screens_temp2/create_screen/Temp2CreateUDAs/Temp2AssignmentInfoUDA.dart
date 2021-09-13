import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/AssignmentInfo/AssignmentInfoPresenter.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AssignmentInfoUDA/AssignmentInfoViewInterface.dart';
import 'package:templets/Utilities/Temp2UtilMethods.dart';
import 'package:templets/Utilities/WidgetsUtilites/Template2/Temp2WidgetsWithBorder.dart';
import 'package:templets/Utilities/app_constants.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';

class Temp2AssignmentInfoUDA extends StatefulWidget {
  final String udaDescription;
  final String validationMessage;
  final bool isValidationMSGWarning;
  final String labelColor;
  final bool isMandatory;
  final String assignmentudaName;
  final String assignmentudaTitle; // caption
  final String assignmentudaId;
  final int objectID;
  final bool isValid;
  final bool isVisible;
  final bool isReadOnly;
  bool isLocation = false;
  final bool validationCondition;
  final String initialValue;
  UDAsWithValues uda;
  final Function onValueChange;
  final FormModes mode;
  Temp2AssignmentInfoUDA(
      {Key key,
      this.udaDescription,
      this.validationMessage,
      this.isValidationMSGWarning,
      this.isMandatory,
      this.assignmentudaName,
      this.assignmentudaTitle,
      this.assignmentudaId,
      this.objectID,
      this.isValid,
      this.isVisible,
      this.isLocation,
      this.isReadOnly,
      this.validationCondition,
      this.initialValue,
      this.uda,
      this.onValueChange,
      this.mode,
      this.labelColor})
      : super(key: key);
  @override
  _Temp2AssignmentInfoUDAState createState() => _Temp2AssignmentInfoUDAState();
}

class _Temp2AssignmentInfoUDAState extends State<Temp2AssignmentInfoUDA>
    implements AssignmentInfoView {
  AssignmentInfoPresenter assignmentInfoPresenter;

  @override
  void initState() {
    super.initState();
    initializePresenter();
    assignmentInfoPresenter.initializeItems();
  }

  @override
  Widget build(BuildContext context) {
    assignmentInfoPresenter.checkLoadingInfoLists();

    return drawWidgetOrEmptyContainer(
        widget.isVisible == true && widget.isLocation != true,
        getUDAWithTitleWidget(
            context,
            getAssignmentInfoLists(),
            "",
            widget.udaDescription,
            widget.validationMessage,
            widget.isValidationMSGWarning,
            widget.isMandatory,
            hexToColor(widget.labelColor)));
  }

  Widget getAssignmentInfoLists() {
    return Temp2WidgetBorder(
      key: widget.key,
      isMandatoryUDA: widget.isMandatory,
      title: widget.assignmentudaTitle,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            drawWidgetOrEmptyContainer(
              isEmptyText(widget.uda.companyValue),
              getAssignmentInfoList(
                  "Company",
                  assignmentInfoPresenter.companyListNames,
                  assignmentInfoPresenter.isCompanyListEnabled,
                  assignmentInfoPresenter.selectedCompany,
                  widget.mode),
            ),
            SizedBox(
              height: 10,
            ),
            drawWidgetOrEmptyContainer(
              isEmptyText(widget.uda.organizationValue),
              getAssignmentInfoList(
                  "Organization",
                  assignmentInfoPresenter.organizationListNames,
                  assignmentInfoPresenter.isOrganizationListEnabled,
                  assignmentInfoPresenter.selectedOrganization,
                  widget.mode),
            ),
            SizedBox(
              height: 10,
            ),
            drawWidgetOrEmptyContainer(
              isEmptyText(widget.uda.groupValue),
              getAssignmentInfoList(
                  "Group",
                  assignmentInfoPresenter.groupListNames,
                  assignmentInfoPresenter.isGroupListEnabled,
                  assignmentInfoPresenter.selectedGroup,
                  widget.mode),
            ),
            SizedBox(
              height: 10,
            ),
            getAssignmentInfoList(
                "Member",
                assignmentInfoPresenter.memberListNames,
                assignmentInfoPresenter.isMemberListEnabled,
                assignmentInfoPresenter.selectedMember,
                widget.mode),
          ],
        ),
      ),
    );
  }

  Widget getAssignmentInfoList(
      String dropDownListTitle,
      List<String> assignmentInfoList,
      bool enabledropDown,
      String selectedItem,
      FormModes formModes) {
    return Temp2WidgetBorder(
      isMandatoryUDA: widget.isMandatory,
      title: dropDownListTitle,
      child: DropDownField(
        controller: TextEditingController(text: selectedItem),
        context: context,
        hintText: "Select $dropDownListTitle",
        items: assignmentInfoList,
        enabled: enabledropDown,
        onValueChanged:
            //Separate Done...
            (String selctedVal) {
          assignmentInfoPresenter.onAssignmentInfoListChange(
              selctedVal, dropDownListTitle);
        },
        dropDownInputDecoration: temp2InputDecoration(
            context, "Select $dropDownListTitle", IC_DROPDOWN, DARK_GREY, null),
      ),
    );
  }

  initializePresenter() {
    assignmentInfoPresenter = AssignmentInfoPresenter(
      assignmentInfoView: this,
      context: context,
      udaDescription: widget.udaDescription,
      validationMessage: widget.validationMessage,
      isValidationMSGWarning: widget.isValidationMSGWarning,
      labelColor: widget.labelColor,
      isMandatory: widget.isMandatory,
      assignmentudaName: widget.assignmentudaName,
      assignmentudaTitle: widget.assignmentudaTitle,
      assignmentudaId: widget.assignmentudaId,
      objectID: widget.objectID,
      isValid: widget.isValid,
      isVisible: widget.isVisible,
      isReadOnly: widget.isReadOnly,
      validationCondition: widget.validationCondition,
      initialValue: widget.initialValue,
      uda: widget.uda,
      onValueChange: widget.onValueChange,
      mode: widget.mode,
    );
  }

  @override
  void updateAssignmentInfoWidget() {
    setState(() {});
  }
}
