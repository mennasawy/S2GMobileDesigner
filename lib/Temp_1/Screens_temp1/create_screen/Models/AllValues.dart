import 'dart:convert';

class AllValues {
  int recid;
  String obj_title;
  int typeid;
  int statusid;
  String created_by;
  int created_by_id;
  var created_date;
  String updated_by;
  int updated_by_id;
  var updated_date;
  var status_last_change_date;
  String statusname;
  String typename;
  int watched;
  dynamic obj_is_deleted;

  AllValues(
      {this.recid,
      this.obj_title,
      this.typeid,
      this.statusid,
      this.created_by,
      this.created_by_id,
      this.created_date,
      this.updated_by,
      this.updated_by_id,
      this.updated_date,
      this.status_last_change_date,
      this.statusname,
      this.typename,
      this.watched,
      this.obj_is_deleted});

  factory AllValues.fromJson(json) {
    var rowData = AllValues(
        recid: json['recid'],
        obj_title: json['obj_title'],
        typeid: json['typeid'],
        statusid: json['statusid'],
        created_by: json['created_by'],
        created_by_id: json['created_by_id'],
        created_date: json['created_date'],
        updated_by: json['updated_by'],
        updated_by_id: json['updated_by_id'],
        updated_date: json['updated_date'],
        status_last_change_date: json['status_last_change_date'],
        statusname: json['statusname'],
        typename: json['typename'],
        watched: json['watched'],
        obj_is_deleted: json["obj_is_deleted"]);
    return rowData;
  }

  toJson() {
    var map = new Map<String, dynamic>();
    map["recid"] = recid;
    map["obj_title"] = obj_title;
    map["typeid"] = typeid;
    map["statusid"] = statusid;
    map["created_by"] = created_by;
    map["created_by_id"] = created_by_id;
    map["created_date"] = created_date;
    map["updated_by"] = updated_by;
    map["updated_by_id"] = updated_by_id;
    map["updated_date"] = updated_date;
    map["status_last_change_date"] = status_last_change_date;
    map["statusname"] = statusname;
    map["typename"] = typename;
    map["watched"] = watched;
    map["obj_is_deleted"] = obj_is_deleted;
    return json.encode(map);
  }
}
