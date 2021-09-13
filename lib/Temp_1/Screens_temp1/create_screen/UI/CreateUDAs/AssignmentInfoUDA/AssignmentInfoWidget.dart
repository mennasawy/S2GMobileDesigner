import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/AssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AsignementInfoGetGroupModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/save_editAssaigmentInfoResponse.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Presenter/CreateUDAs/AssignmentInfo/AssignmentInfoPresenter.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dropdownfield.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AssignmentInfoUDA/AssignmentInfoViewInterface.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AssignmentInfoWidget extends StatefulWidget {
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
  AssignmentInfoWidget(
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
  _AssignmentInfoWidgetState createState() => _AssignmentInfoWidgetState();
}

class _AssignmentInfoWidgetState extends State<AssignmentInfoWidget>
    implements AssignmentInfoView {
  // String selectedCompany;
  // String selectedOrganization;
  // String selectedGroup;
  // String selectedMember;
  // String selectedItem;
  // List<String> emptyList = [];
  // bool isCompanyListEnabled = true;
  // bool isOrganizationListEnabled = false;
  // bool isGroupListEnabled = false;
  // bool isMemberListEnabled = false;
  AssignmentInfoPresenter assignmentInfoPresenter;
  // // AssignementInfoGetGroupPresenter assignementInfoGetGroupPresenter;
  // List<AssignmentInfoModel> companyList = [];
  // List<String> companyListNames = [];
  // List<String> organizationListNames = [];
  // List<String> groupListNames = [];
  // List<Organizations> organizationList = [];
  // List<Groups> groupList = [];
  // AssignmentInfoGetGroupInfoBody assignmentInfoGetGroupInfoBody;
  // List<AssignmentInfoGetGroupInfoModel> membersList;
  // List<String> memberListNames = [];
  // List<SaveAssignmentInfoModel> assignmentObjectList = [];
  // SaveAssignmentInfoModel assignmentObj = SaveAssignmentInfoModel();
  // bool areFirstLevelsLoaded = false;
  _AssignmentInfoWidgetState() {
    assignmentInfoPresenter = AssignmentInfoPresenter(assignmentInfoView: this);
    // assignementInfoGetGroupPresenter = AssignementInfoGetGroupPresenter(this);
  }
  @override
  void initState() {
    super.initState();
    initializePresenter();
    assignmentInfoPresenter.initializeItems();
    // //Separate Done...
    // setDefaultValues();
    // //Separate Done...
    // if (widget.isReadOnly == true) {
    //   isCompanyListEnabled = false;
    //   isOrganizationListEnabled = false;
    //   isGroupListEnabled = false;
    //   isMemberListEnabled = false;
    // }
  }

  @override
  Widget build(BuildContext context) {
    //Separate Done... checkLoadingInfoLists
    assignmentInfoPresenter.checkLoadingInfoLists();

    return drawWidgetOrEmptyContainer(
        widget.isVisible == true && widget.isLocation != true,
        getUDAWithTitleWidget(
            context,
            getAssignmentInfoLists(),
            widget.assignmentudaTitle,
            widget.udaDescription,
            widget.validationMessage,
            widget.isValidationMSGWarning,
            widget.isMandatory,
            hexToColor(widget.labelColor)));
  }

  Widget getAssignmentInfoLists() {
    return Container(
      key: widget.key,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            drawWidgetOrEmptyContainer(
              isEmptyText(widget.uda.companyValue),
              getUDAWithTitleWidget(
                  context,
                  getAssignmentInfoList(
                      "Company",
                      assignmentInfoPresenter.companyListNames,
                      assignmentInfoPresenter.isCompanyListEnabled,
                      assignmentInfoPresenter.selectedCompany,
                      widget.mode),
                  "Company",
                  widget.udaDescription,
                  widget.validationMessage,
                  widget.isValidationMSGWarning,
                  widget.isMandatory,
                  null),
            ),
            SizedBox(
              height: 10,
            ),
            drawWidgetOrEmptyContainer(
              isEmptyText(widget.uda.organizationValue),
              getUDAWithTitleWidget(
                  context,
                  getAssignmentInfoList(
                      "organization",
                      assignmentInfoPresenter.organizationListNames,
                      assignmentInfoPresenter.isOrganizationListEnabled,
                      assignmentInfoPresenter.selectedOrganization,
                      widget.mode),
                  "organization",
                  widget.udaDescription,
                  widget.validationMessage,
                  widget.isValidationMSGWarning,
                  widget.isMandatory,
                  null),
            ),
            SizedBox(
              height: 10,
            ),
            drawWidgetOrEmptyContainer(
              isEmptyText(widget.uda.groupValue),
              getUDAWithTitleWidget(
                  context,
                  getAssignmentInfoList(
                      "Group",
                      assignmentInfoPresenter.groupListNames,
                      assignmentInfoPresenter.isGroupListEnabled,
                      assignmentInfoPresenter.selectedGroup,
                      widget.mode),
                  "Group",
                  widget.udaDescription,
                  widget.validationMessage,
                  widget.isValidationMSGWarning,
                  widget.isMandatory,
                  null),
            ),
            SizedBox(
              height: 10,
            ),
            getUDAWithTitleWidget(
                context,
                getAssignmentInfoList(
                    "Member",
                    assignmentInfoPresenter.memberListNames,
                    assignmentInfoPresenter.isMemberListEnabled,
                    assignmentInfoPresenter.selectedMember,
                    widget.mode),
                "Member",
                widget.udaDescription,
                widget.validationMessage,
                widget.isValidationMSGWarning,
                widget.isMandatory,
                null),
          ],
        ),
      ),
    );
  }

  DropDownField getAssignmentInfoList(
      String dropDownListTitle,
      List<String> assignmentInfoList,
      bool enabledropDown,
      String selectedItem,
      FormModes formModes) {
    return DropDownField(
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
        // log(LogType.DEBUG, "Assignment info selected value ====== $selctedVal");
        // checkWitchLevel(selctedVal, dropDownListTitle);
        // widget.onValueChange(selectedCompany, selectedOrganization,
        //     selectedGroup, selectedMember, assignmentObj);
        // changeEnableAndDisableLists(dropDownListTitle, selctedVal, widget.mode);
      },
    );
  }

  //Separate Done...
  // checkWitchLevel(String value, String title) {
  //   switch (title) {
  //     case 'company':
  //       setState(() {
  //         organizationList = [];
  //         organizationListNames = [];
  //         groupListNames = [];
  //         groupList = [];
  //         membersList = [];
  //         memberListNames = [];
  //         selectedCompany = value;
  //         selectedOrganization = '';
  //         selectedGroup = '';
  //         selectedMember = '';
  //       });
  //       break;
  //     case 'organization':
  //       setState(() {
  //         groupListNames = [];
  //         groupList = [];
  //         membersList = [];
  //         memberListNames = [];
  //         selectedOrganization = value;
  //         selectedGroup = '';
  //         selectedMember = '';
  //       });
  //       break;
  //     case 'group':
  //       setState(() {
  //         selectedGroup = value;
  //         selectedMember = '';
  //       });
  //       break;
  //     case 'member':
  //       setState(() {
  //         selectedMember = value;
  //         assignmentObj = assignmentObjectList.firstWhere(
  //             (assignmentMember) => assignmentMember.name == selectedMember);
  //       });
  //       break;
  //     default:
  //       break;
  //   }
  // }

  //Separate Done...
  // changeEnableAndDisableLists(String title, String value, FormModes modeCheck) {
  //   switch (title) {
  //     case 'company':
  //       setState(() {
  //         FilterCompanyList(value);
  //       });
  //       break;
  //     case 'organization':
  //       setState(() {
  //         FilterOrganizationList(value);
  //         log(LogType.DEBUG,
  //             'Organizations names list ======== $organizationListNames');
  //       });
  //       break;
  //     case 'group':
  //       setState(() {
  //         FilterGroupList(value);
  //       });
  //       break;
  //     case 'member':
  //       setState(() {
  //         FilterMemberList(value);
  //       });
  //       break;
  //     default:
  //       break;
  //   }
  // }

  //Separate Done...
  // FilterCompanyList(String value) {
  //   isOrganizationListEnabled = true;
  //   isGroupListEnabled = false;
  //   isMemberListEnabled = false;
  //   selectedCompany = value;

  //   organizationList = companyList
  //       .firstWhere((company) => company.name == value)
  //       .organizations;
  //   for (int k = 0; k < organizationList.length; k++) {
  //     organizationListNames.add(organizationList[k].name);
  //   }
  //   log(LogType.DEBUG, "Selected company ======== $selectedCompany");
  // }

  // //Separate Done...
  // FilterOrganizationList(String value) {
  //   isGroupListEnabled = true;
  //   isMemberListEnabled = false;
  //   selectedOrganization = value;

  //   log(LogType.DEBUG, "Selected organization ======== $selectedOrganization");
  //   groupList = organizationList
  //       .firstWhere((organization) => organization.name == value)
  //       .groups;
  //   for (int a = 0; a < groupList.length; a++) {
  //     groupListNames.add(groupList[a].name);
  //   }
  // }

  // //Separate Done...
  // FilterGroupList(String value) {
  //   isMemberListEnabled = true;
  //   Groups selectedGroupInfo;
  //   selectedGroup = value;
  //   log(LogType.DEBUG, "Selected group ===== $selectedGroup");
  //   memberListNames = [];
  //   selectedGroupInfo = groupList.firstWhere((group) => group.name == value);
  //   assignmentInfoGetGroupInfoBody = AssignmentInfoGetGroupInfoBody(
  //       groupName: value, recID: selectedGroupInfo.groupID);
  //   assignmentInfoPresenter.loadMembers(
  //       context, assignmentInfoGetGroupInfoBody);
  // }

  // //Separate Done...
  // FilterMemberList(String value) {
  //   selectedMember = value;
  //   assignmentObj = assignmentObjectList.firstWhere(
  //       (assignmentMember) => assignmentMember.name == selectedMember);
  //   log(LogType.DEBUG, "Selected member ======= $selectedMember");
  // }

  // //Separate Done...
  // filterFirstThreeLists(
  //     List<AssignmentInfoModel> companyList, List<String> assignmentListNames) {
  //   setState(() {
  //     organizationList = [];
  //     organizationListNames = [];
  //     groupList = [];
  //     groupListNames = [];
  //     organizationList = companyList
  //         .firstWhere((company) => company.name == selectedCompany)
  //         .organizations;
  //     for (int k = 0; k < organizationList.length; k++) {
  //       organizationListNames.add(organizationList[k].name);
  //     }
  //     groupList = organizationList
  //         .firstWhere(
  //             (organization) => organization.name == selectedOrganization)
  //         .groups;
  //     for (int a = 0; a < groupList.length; a++) {
  //       groupListNames.add(groupList[a].name);
  //     }
  //   });
  //   log(LogType.DEBUG, 'Lists in MOnitor zzzzzzzzzzzzzzz');
  //   log(LogType.DEBUG, companyListNames);
  //   log(LogType.DEBUG, organizationListNames);
  //   log(LogType.DEBUG, groupListNames);
  //   log(LogType.DEBUG, memberListNames);
  //   return organizationListNames;
  // }

  // //Separate Done...
  // setDefaultValues() {
  //   if (!isEmptyText(widget.uda.companyValue) &&
  //       isEmptyText(widget.uda.ai_Comp))
  //     selectedCompany = widget.uda.ai_Comp = widget.uda.companyValue;
  //   else
  //     selectedCompany = widget.uda.ai_Comp ?? "";

  //   if (!isEmptyText(widget.uda.organizationValue) &&
  //       isEmptyText(widget.uda.ai_Orga))
  //     selectedOrganization = widget.uda.ai_Orga = widget.uda.organizationValue;
  //   else
  //     selectedOrganization = widget.uda.ai_Orga ?? "";

  //   if (!isEmptyText(widget.uda.groupValue) && isEmptyText(widget.uda.ai_Group))
  //     selectedGroup = widget.uda.ai_Group = widget.uda.groupValue;
  //   else
  //     selectedGroup = widget.uda.ai_Group ?? "";
  //   if (!isEmptyText(widget.uda.memberValue) && isEmptyText(widget.uda.ai_Mem))
  //     selectedMember = widget.uda.ai_Mem = widget.uda.memberValue;
  //   else
  //     selectedMember = widget.uda.ai_Mem ?? "";
  // }

  @override
  void onLoadCorporationComplete(List<AssignmentInfoModel> assignmentList) {
    //Separate Done...
    // companyList = [];
    // companyListNames.clear();
    // companyList = assignmentList;
    // areFirstLevelsLoaded = true;
    // for (int i = 0; i < companyList.length; i++) {
    //   companyListNames.add(companyList[i].name);
    // }
    // if (widget.mode != FormModes.newMode) {
    //   filterFirstThreeLists(companyList, companyListNames);
    //   assignmentInfoGetGroupInfoBody = AssignmentInfoGetGroupInfoBody(
    //       groupName: widget.uda.groupValue,
    //       recID: groupList
    //           .firstWhere((group) => group.name == selectedGroup)
    //           .groupID);
    //   assignmentInfoPresenter.loadMembers(
    //       context, assignmentInfoGetGroupInfoBody);
    // }
    // if (!isEmptyText(selectedCompany) && widget.isReadOnly == false) {
    //   setState(() {
    //     FilterCompanyList(selectedCompany);
    //   });
    //   widget.onValueChange(selectedCompany, selectedOrganization, selectedGroup,
    //       selectedMember, assignmentObj);
    // }
    // if (!isEmptyText(selectedOrganization) && widget.isReadOnly == false)
    //   setState(() {
    //     FilterOrganizationList(selectedOrganization);
    //   });
    // if (!isEmptyText(selectedGroup) && widget.isReadOnly == false)
    //   setState(() {
    //     FilterGroupList(selectedGroup);
    //   });
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
  void onLoadCorporationError(ErrorResponse error) {
    if (error.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(error.message, context);
  }

  @override
  void onLoadMembersError(ErrorResponse error) {
    if (error.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(error.message, context);
  }

  @override
  void onLoadMembersComplete(
      List<AssignmentInfoGetGroupInfoModel> AsignementInfoList) {
    //Separate Done...
    // setState(() {
    //   membersList = AsignementInfoList;
    //   for (int j = 0; j < membersList.length; j++) {
    //     memberListNames.add(membersList[j].name);
    //     assignmentObjectList.add(SaveAssignmentInfoModel(
    //         assignName: membersList[j].employeeName,
    //         assignMemberEmail: membersList[j].memberEmail,
    //         assignMemberPhone: membersList[j].memberPhoneNumber,
    //         assignMemberUserName: membersList[j].memberUserName,
    //         assignMemFirstName: membersList[j].nameFIRST,
    //         assignMemLastName: membersList[j].nameLAST,
    //         assignMemManagerName: membersList[j].managerName,
    //         assignMemManagerUserName: membersList[j].memberUserName,
    //         assignMemManagerPhone: membersList[j].managerPhoneNumber,
    //         assignMemMangEmail: membersList[j].managerEMAIL,
    //         userID: membersList[j].userID,
    //         name: membersList[j].name));
    //   }
    // });

    // log(LogType.DEBUG, "****** $membersList");
    // log(LogType.DEBUG, "****** $memberListNames");
    // if (!isEmptyText(selectedMember) && widget.isReadOnly == false)
    //   FilterMemberList(selectedMember);
  }

//edit in monitor
  @override
  void onSaveAssignmentInfoComplete(
      AssignmentInfoSaveEditResponse assignmentInfoSaveResponse) {}

  @override
  void onSaveAssignmentInfoError(ErrorResponse error) {
    if (error.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(error.message, context);
  }

  @override
  void updateAssignmentInfoWidget() {
    setState(() {});
  }
}
