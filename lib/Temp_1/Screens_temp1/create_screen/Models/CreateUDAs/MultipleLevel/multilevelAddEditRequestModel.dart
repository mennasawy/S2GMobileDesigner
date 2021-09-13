class MultiLevelAddEditRequest {
  int recid;
  int objectId;
  int udaId;
  String tire1;
  String tire2;
  String tire3;
  String tire4;
  int repositoryId;

  MultiLevelAddEditRequest(
      {this.recid,
        this.objectId,
        this.udaId,
        this.tire1,
        this.tire2,
        this.tire3,
        this.tire4,
        this.repositoryId});

  MultiLevelAddEditRequest.fromJson(Map<String, dynamic> json) {
    recid = json['recid'];
    objectId = json['object_id'];
    udaId = json['uda_id'];
    tire1 = json['tire_1'];
    tire2 = json['tire_2'];
    tire3 = json['tire_3'];
    tire4 = json['tire_4'];
    repositoryId = json['repository_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recid'] = this.recid;
    data['object_id'] = this.objectId;
    data['uda_id'] = this.udaId;
    data['tire_1'] = this.tire1;
    data['tire_2'] = this.tire2;
    data['tire_3'] = this.tire3;
    data['tire_4'] = this.tire4;
    data['repository_id'] = this.repositoryId;
    return data;
  }
}