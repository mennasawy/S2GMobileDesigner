import 'dart:convert';

class ColumnDefs {
  ColumnDefs({
    this.headerName,
    this.field,
    this.width
  });

  String headerName;
  String field;
  int width;

  factory ColumnDefs.fromRawJson(String str) =>
      ColumnDefs.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ColumnDefs.fromJson(Map<String, dynamic> json) {
    return ColumnDefs(
      headerName: json["headerName"],
      field: json["field"],
      width: json["width"],
    );
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["headerName"] = headerName;
    map["field"] = field;
    map["width"] = width;
    return map;
  }
}
