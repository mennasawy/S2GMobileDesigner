class AssignmentInfoGetGroupInfoBody {
  int recID;
  String groupName;

  AssignmentInfoGetGroupInfoBody({this.recID, this.groupName});

  AssignmentInfoGetGroupInfoBody.fromJson(Map<String, dynamic> json) {
    recID = json['RecID'];
    groupName = json['groupName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['RecID'] = this.recID;
    data['groupName'] = this.groupName;
    return data;
  }
}