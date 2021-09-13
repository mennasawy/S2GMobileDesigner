import 'dart:convert';

class LevelDataModel {
  int recid;
  String tireName;
  String status;
  var parentId;
  int tireLevel;
  var price;
  var currency;
  int repositoryId;
  var planTemplateId;
  var isPublic;

  LevelDataModel(
      {this.recid,
        this.tireName,
        this.status,
        this.parentId,
        this.tireLevel,
        this.price,
        this.currency,
        this.repositoryId,
        this.planTemplateId,
        this.isPublic});

  LevelDataModel.fromJson(Map<String, dynamic> json) {
    recid = json['recid'];
    tireName = json['tire_name'];
    status = json['status'];
    parentId = json['parent_id'];
    tireLevel = json['tire_level'];
    price = json['price'];
    currency = json['currency'];
    repositoryId = json['repository_id'];
    planTemplateId = json['plan_template_id'];
    isPublic = json['is_public'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recid'] = this.recid;
    data['tire_name'] = this.tireName;
    data['status'] = this.status;
    data['parent_id'] = this.parentId;
    data['tire_level'] = this.tireLevel;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['repository_id'] = this.repositoryId;
    data['plan_template_id'] = this.planTemplateId;
    data['is_public'] = this.isPublic;
    return data;
  }
}

List<LevelDataModel> parseLevelsResponse(String body) {
    final parsed = json.decode(body);
    return parsed
        .map<LevelDataModel>((json) => LevelDataModel.fromJson(json))
        .toList();
  }