import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/AssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/AssignmentInfoUDAModel/SaveAssignmentInfoModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AsignementInfoGetGroupModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/AssignmentInfo/AssignementInfoGetGroupBodyModel.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/UDAsWithValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/ErrorResponse/error_data.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateGenericObjectScreen.dart';
import 'package:templets/Utilities/api_constant.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:templets/dependency_injection.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/UI/CreateUDAs/AssignmentInfoUDA/AssignmentInfoViewInterface.dart';
import 'package:flutter/cupertino.dart';

abstract class AssignmentInfoContract {
  void onLoadCorporationComplete(List<AssignmentInfoModel> assignmentList);
  void onLoadCorporationError(ErrorResponse errorResponse);
  void onLoadMembersComplete(
      List<AssignmentInfoGetGroupInfoModel> asignementInfoList);
  void onLoadMembersError(ErrorResponse errorResponse);
}

class AssignmentInfoPresenter implements AssignmentInfoContract {
  AssignmentInfoView assignmentInfoView;
  AssignmentInfoRepositry assignmentInfoRepositry;
  // AssignementInfoGetroupView assignementInfoGetroupView;
  AssignmentInfoGetGropRepositry assignmentInfoGetGropRepositry;

  //##########UI Related Parameters##########
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
  final bool isLocation = false;
  final bool validationCondition;
  final String initialValue;
  final UDAsWithValues uda;
  final Function onValueChange;
  final FormModes mode;
  final BuildContext context;

  String selectedCompany;
  String selectedOrganization;
  String selectedGroup;
  String selectedMember;
  String selectedItem;
  List<String> emptyList = [];
  bool isCompanyListEnabled = true;
  bool isOrganizationListEnabled = false;
  bool isGroupListEnabled = false;
  bool isMemberListEnabled = false;
  List<AssignmentInfoModel> companyList = [];
  List<String> companyListNames = [];
  List<String> organizationListNames = [];
  List<String> groupListNames = [];
  List<Organizations> organizationList = [];
  List<Groups> groupList = [];
  AssignmentInfoGetGroupInfoBody assignmentInfoGetGroupInfoBody;
  List<AssignmentInfoGetGroupInfoModel> membersList;
  List<String> memberListNames = [];
  List<SaveAssignmentInfoModel> assignmentObjectList = [];
  SaveAssignmentInfoModel assignmentObj = SaveAssignmentInfoModel();
  bool areFirstLevelsLoaded = false;

  AssignmentInfoPresenter({
    this.assignmentInfoView,
    this.context,
    this.udaDescription,
    this.validationMessage,
    this.isValidationMSGWarning,
    this.labelColor,
    this.isMandatory,
    this.assignmentudaName,
    this.assignmentudaTitle,
    this.assignmentudaId,
    this.objectID,
    this.isValid,
    this.isVisible,
    this.isReadOnly,
    this.validationCondition,
    this.initialValue,
    this.uda,
    this.onValueChange,
    this.mode,
  }) {
    assignmentInfoRepositry = new Injector().assignmentInfoRepositry;
    assignmentInfoGetGropRepositry =
        new Injector().assignmentInfoGetGropRepositry;
  }

  void loadAssignmentInfoLists(BuildContext context) {
    assignmentInfoRepositry
        .getAssignmentInfoLists(context)
        .then((c) => this.onLoadCorporationComplete(c))
        .catchError((onError) => this.onLoadCorporationError(onError));
  }

  void loadMembers(BuildContext context,
      AssignmentInfoGetGroupInfoBody assignmentInfoGetGroupInfoBody) {
    assignmentInfoGetGropRepositry
        .getGroupInfo(context, assignmentInfoGetGroupInfoBody)
        .then((c) => this.onLoadMembersComplete(c))
        .catchError((onError) => this.onLoadMembersError(onError));
  }

  //##########UI Related Methods##########
  initializeItems() {
    setDefaultValues();
    disableFieldsInReadOnlyMode();
  }

  setDefaultValues() {
    if (!isEmptyText(uda.companyValue) && isEmptyText(uda.ai_Comp))
      selectedCompany = uda.ai_Comp = uda.companyValue;
    else
      selectedCompany = uda.ai_Comp ?? "";

    if (!isEmptyText(uda.organizationValue) && isEmptyText(uda.ai_Orga))
      selectedOrganization = uda.ai_Orga = uda.organizationValue;
    else
      selectedOrganization = uda.ai_Orga ?? "";

    if (!isEmptyText(uda.groupValue) && isEmptyText(uda.ai_Group))
      selectedGroup = uda.ai_Group = uda.groupValue;
    else
      selectedGroup = uda.ai_Group ?? "";
    if (!isEmptyText(uda.memberValue) && isEmptyText(uda.ai_Mem))
      selectedMember = uda.ai_Mem = uda.memberValue;
    else
      selectedMember = uda.ai_Mem ?? "";
  }

  disableFieldsInReadOnlyMode() {
    if (isReadOnly == true) {
      isCompanyListEnabled = false;
      isOrganizationListEnabled = false;
      isGroupListEnabled = false;
      isMemberListEnabled = false;
    }
  }

  checkLoadingInfoLists() {
    if (!areFirstLevelsLoaded) loadAssignmentInfoLists(context);
  }

  onAssignmentInfoListChange(String selctedVal, String dropDownListTitle) {
    log(LogType.DEBUG, "Assignment info selected value ====== $selctedVal");
    checkWitchLevel(selctedVal, dropDownListTitle);
    onValueChange(selectedCompany, selectedOrganization, selectedGroup,
        selectedMember, assignmentObj);
    changeEnableAndDisableLists(dropDownListTitle, selctedVal, mode);
  }

  checkWitchLevel(String value, String title) {
    switch (title) {
      case 'company':
        organizationList = [];
        organizationListNames = [];
        groupListNames = [];
        groupList = [];
        membersList = [];
        memberListNames = [];
        selectedCompany = value;
        selectedOrganization = '';
        selectedGroup = '';
        selectedMember = '';
        assignmentInfoView.updateAssignmentInfoWidget();
        break;
      case 'organization':
        groupListNames = [];
        groupList = [];
        membersList = [];
        memberListNames = [];
        selectedOrganization = value;
        selectedGroup = '';
        selectedMember = '';
        assignmentInfoView.updateAssignmentInfoWidget();
        break;
      case 'group':
        selectedGroup = value;
        selectedMember = '';
        assignmentInfoView.updateAssignmentInfoWidget();
        break;
      case 'member':
        selectedMember = value;
        assignmentObj = isEmptyText(value)
            ? null
            : assignmentObjectList.firstWhere(
                (assignmentMember) => assignmentMember.name == selectedMember);
        assignmentInfoView.updateAssignmentInfoWidget();
        break;
      default:
        break;
    }
  }

  changeEnableAndDisableLists(String title, String value, FormModes modeCheck) {
    switch (title) {
      case 'company':
        FilterCompanyList(value);
        assignmentInfoView.updateAssignmentInfoWidget();
        break;
      case 'organization':
        FilterOrganizationList(value);
        log(LogType.DEBUG,
            'Organizations names list ======== $organizationListNames');
        assignmentInfoView.updateAssignmentInfoWidget();
        break;
      case 'group':
        FilterGroupList(value);
        assignmentInfoView.updateAssignmentInfoWidget();
        break;
      case 'member':
        FilterMemberList(value);
        assignmentInfoView.updateAssignmentInfoWidget();
        break;
      default:
        break;
    }
  }

  FilterCompanyList(String value) {
    if (!isEmptyText(value)) {
      isOrganizationListEnabled = true;
      isGroupListEnabled = false;
      isMemberListEnabled = false;
      selectedCompany = value;

      organizationList = companyList
          .firstWhere((company) => company.name == value)
          .organizations;
      organizationListNames = [];
      for (int k = 0; k < organizationList.length; k++) {
        organizationListNames.add(organizationList[k].name);
      }
      log(LogType.DEBUG, "Selected company ======== $selectedCompany");
    }
  }

  FilterOrganizationList(String value) {
    if (!isEmptyText(value)) {
      isGroupListEnabled = true;
      isMemberListEnabled = false;
      selectedOrganization = value;

      log(LogType.DEBUG,
          "Selected organization ======== $selectedOrganization");
      groupList = organizationList
          .firstWhere((organization) => organization.name == value)
          .groups;
      groupListNames = [];
      for (int a = 0; a < groupList.length; a++) {
        groupListNames.add(groupList[a].name);
      }
    }
  }

  FilterGroupList(String value) {
    if (!isEmptyText(value)) {
      isMemberListEnabled = true;
      Groups selectedGroupInfo;
      selectedGroup = value;
      log(LogType.DEBUG, "Selected group ===== $selectedGroup");
      memberListNames = [];
      selectedGroupInfo = groupList.firstWhere((group) => group.name == value);
      assignmentInfoGetGroupInfoBody = AssignmentInfoGetGroupInfoBody(
          groupName: value, recID: selectedGroupInfo.groupID);
      loadMembers(context, assignmentInfoGetGroupInfoBody);
    }
  }

  FilterMemberList(String value) {
    if (!isEmptyText(value)) {
      selectedMember = value;
      assignmentObj = assignmentObjectList.firstWhere(
          (assignmentMember) => assignmentMember.name == selectedMember);
      log(LogType.DEBUG, "Selected member ======= $selectedMember");
    }
  }

  filterFirstThreeLists(
      List<AssignmentInfoModel> companyList, List<String> assignmentListNames) {
    organizationList = [];
    organizationListNames = [];
    groupList = [];
    groupListNames = [];
    if (!isEmptyText(selectedCompany)) {
      organizationList = companyList
          .firstWhere((company) => company.name == selectedCompany)
          .organizations;
      for (int k = 0; k < organizationList.length; k++) {
        organizationListNames.add(organizationList[k].name);
      }
    }
    if (!isEmptyText(selectedOrganization)) {
      groupList = organizationList
          .firstWhere(
              (organization) => organization.name == selectedOrganization)
          .groups;
      for (int a = 0; a < groupList.length; a++) {
        groupListNames.add(groupList[a].name);
      }
    }
    assignmentInfoView.updateAssignmentInfoWidget();
    log(LogType.DEBUG, 'Lists in MOnitor zzzzzzzzzzzzzzz');
    log(LogType.DEBUG, companyListNames);
    log(LogType.DEBUG, organizationListNames);
    log(LogType.DEBUG, groupListNames);
    log(LogType.DEBUG, memberListNames);
    return organizationListNames;
  }

  onLoadingCorporationSuccessfully(List<AssignmentInfoModel> assignmentList) {
    companyList = [];
    companyListNames.clear();
    companyList = assignmentList;
    areFirstLevelsLoaded = true;
    for (int i = 0; i < companyList.length; i++) {
      companyListNames.add(companyList[i].name);
    }
    if (mode != FormModes.newMode) {
      filterFirstThreeLists(companyList, companyListNames);
      assignmentInfoGetGroupInfoBody = AssignmentInfoGetGroupInfoBody(
          groupName: uda.groupValue,
          recID: !isEmptyText(selectedGroup)
              ? groupList
                  .firstWhere((group) => group.name == selectedGroup)
                  .groupID
              : null);
      if (!isEmptyText(selectedGroup))
        loadMembers(context, assignmentInfoGetGroupInfoBody);
    }
    if (!isEmptyText(selectedCompany) && isReadOnly == false) {
      FilterCompanyList(selectedCompany);
      //setState
      onValueChange(selectedCompany, selectedOrganization, selectedGroup,
          selectedMember, assignmentObj);
    }
    if (!isEmptyText(selectedOrganization) && isReadOnly == false)
      FilterOrganizationList(selectedOrganization);
    //setState
    if (!isEmptyText(selectedGroup) && isReadOnly == false)
      FilterGroupList(selectedGroup);
    //setState
  }

  onLoadingMembersSuccessfully(
      List<AssignmentInfoGetGroupInfoModel> asignementInfoList) {
    membersList = asignementInfoList;
    memberListNames = [];
    for (int j = 0; j < membersList.length; j++) {
      memberListNames.add(membersList[j].name);
      assignmentObjectList.add(SaveAssignmentInfoModel(
          assignName: membersList[j].employeeName,
          assignMemberEmail: membersList[j].memberEmail,
          assignMemberPhone: membersList[j].memberPhoneNumber,
          assignMemberUserName: membersList[j].memberUserName,
          assignMemFirstName: membersList[j].nameFIRST,
          assignMemLastName: membersList[j].nameLAST,
          assignMemManagerName: membersList[j].managerName,
          assignMemManagerUserName: membersList[j].memberUserName,
          assignMemManagerPhone: membersList[j].managerPhoneNumber,
          assignMemMangEmail: membersList[j].managerEMAIL,
          userID: membersList[j].userID,
          name: membersList[j].name));
    }
    //setState

    log(LogType.DEBUG, "****** $membersList");
    log(LogType.DEBUG, "****** $memberListNames");
    if (!isEmptyText(selectedMember) && isReadOnly == false)
      FilterMemberList(selectedMember);
  }

  @override
  void onLoadCorporationComplete(List<AssignmentInfoModel> assignmentList) {
    onLoadingCorporationSuccessfully(assignmentList);
    assignmentInfoView.updateAssignmentInfoWidget();
  }

  @override
  void onLoadCorporationError(ErrorResponse errorResponse) {
    if (errorResponse.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(errorResponse.message, context);
    else
      ShowAlertMessage(errorResponse.message, context);
  }

  @override
  void onLoadMembersComplete(
      List<AssignmentInfoGetGroupInfoModel> asignementInfoList) {
    onLoadingMembersSuccessfully(asignementInfoList);
    assignmentInfoView.updateAssignmentInfoWidget();
  }

  @override
  void onLoadMembersError(ErrorResponse errorResponse) {
    if (errorResponse.code == CODE_EXPIRED_TOKEN)
      ShowExpiredTokenAlert(errorResponse.message, context);
    else
      ShowAlertMessage(errorResponse.message, context);
  }
}
