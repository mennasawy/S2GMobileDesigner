class MultipleLevelModel {
  int recId;
  String repositoryName;
  String repositoryTableName;
  String privilegeTableName;
  int numberOfLevels;
  bool allowPrice;
  bool allowCopyPlan;
  Null appId;
  Null objectId;
  Null typeId;
  Null planUdaId;
  String tiresNames;

  MultipleLevelModel(
      {this.recId,
      this.repositoryName,
      this.repositoryTableName,
      this.privilegeTableName,
      this.numberOfLevels,
      this.allowPrice,
      this.allowCopyPlan,
      this.appId,
      this.objectId,
      this.typeId,
      this.planUdaId,
      this.tiresNames});

  factory MultipleLevelModel.fromJson(Map<String, dynamic> json) {
    return MultipleLevelModel(
      recId: json['recId'],
      repositoryName: json['repositoryName'],
      repositoryTableName: json['repositoryTableName'],
      privilegeTableName: json['privilegeTableName'],
      numberOfLevels: json['numberOfLevels'],
      allowPrice: json['allowPrice'],
      allowCopyPlan: json['allowCopyPlan'],
      appId: json['AppId'],
      objectId: json['objectId'],
      typeId: json['typeId'],
      planUdaId: json['planUdaId'],
      tiresNames: json['tiresNames'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recId'] = this.recId;
    data['repositoryName'] = this.repositoryName;
    data['repositoryTableName'] = this.repositoryTableName;
    data['privilegeTableName'] = this.privilegeTableName;
    data['numberOfLevels'] = this.numberOfLevels;
    data['allowPrice'] = this.allowPrice;
    data['allowCopyPlan'] = this.allowCopyPlan;
    data['AppId'] = this.appId;
    data['objectId'] = this.objectId;
    data['typeId'] = this.typeId;
    data['planUdaId'] = this.planUdaId;
    data['tiresNames'] = this.tiresNames;
    return data;
  }
}
