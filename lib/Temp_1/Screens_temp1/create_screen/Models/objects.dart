 class Objects {
  num recId;
  String objectName;
  String udaTableName;
  String tableName;
  bool isDeleted;
  int moduleType;
  String deletedBy;
  String deletedAt;
  bool hideHeader;
  bool showDashboard;
  bool rtlFlag;

  Objects({this.recId,this.objectName,this.udaTableName,this.tableName,this.isDeleted,this.deletedBy,this.deletedAt,this.hideHeader,this.showDashboard,this.rtlFlag,this.moduleType}) ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recId'] = this.recId;
    data['objectName'] = this.objectName;
    data['udaTableName'] = this.udaTableName;
    data['tableName'] = this.tableName;
    data['isDeleted'] = this.isDeleted;
    data['deletedBy'] = this.deletedBy;
    data['deletedAt'] = this.deletedAt;
    data['hideHeader'] = this.hideHeader;
    data['showDashboard'] = this.showDashboard;
    data['rtlFlag'] = this.rtlFlag;
    data['moduleType']=this.moduleType;
    return data;
  }

  postToJsonMobileSubmitRequest(Objects data) {
    final dyn = data.toJson();
    return (dyn);
  }

  factory Objects.fromJson(Map<String, dynamic> json) {
    return Objects(
    recId: json["recId"],
    udaTableName : json["udaTableName"],
    tableName  : json["tableName"],
    isDeleted : json["isDeleted"],
    deletedBy: json["deletedBy"],
    deletedAt: json["deletedAt"],
    hideHeader : json["hideHeader"],
        moduleType: json["moduleType"],
        showDashboard : json["showDashboard"],
        rtlFlag: json["rtlFlag"]);

  }
}