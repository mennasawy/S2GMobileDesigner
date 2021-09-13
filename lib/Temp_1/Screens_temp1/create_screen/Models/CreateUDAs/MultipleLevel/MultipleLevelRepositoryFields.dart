import 'dart:convert';

class MultipleLevelRepositoryField {
  MultipleLevelRepositoryField({
    this.caption,
    this.name,
    this.width,
    this.seq,
    this.type,
    this.value,
  });

  String caption;
  String name;
  int width;
  int seq;
  int type;
  var value;
  factory MultipleLevelRepositoryField.fromRawJson(String str) => MultipleLevelRepositoryField.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MultipleLevelRepositoryField.fromJson(Map<String, dynamic> json) => MultipleLevelRepositoryField(
    caption: json["caption"],
    name: json["name"],
    width: json["width"],
    seq: json["seq"],
    type: json["type"],
    value: json["value"] == null ? null : json["value"],
  );

  Map<String, dynamic> toJson() => {
    "caption": caption,
    "name": name,
    "width": width,
    "seq": seq,
    "type": type,
    "value": value == null ? null : value,
  };
}