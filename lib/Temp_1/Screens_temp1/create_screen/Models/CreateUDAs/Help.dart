import 'dart:convert';

class HelpUda {
  int recId;
  dynamic path;
  int udaId;
  String en;
  String ar;

  HelpUda({
    this.recId,
    this.path,
    this.udaId,
    this.en,
    this.ar,
  });

  factory HelpUda.fromRawJson(String str) => HelpUda.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HelpUda.fromJson(Map<String, dynamic> json) =>
      HelpUda(
        recId: json["recId"],
        path: json["path"],
        udaId: json["udaId"],
        en: json["En"],
        ar: json["Ar"],
      );


  toJson() {
  Map<String, dynamic> json = new Map<String, dynamic>();
  json["recId"] = recId;
  json["path"] = path;
  json["udaId"] = udaId;
  json["En"] = en;
  json["Ar"] = ar;

}
}

List<HelpUda> parseHelpTasks(String body) {
    final parsed = json.decode(body);
    return parsed
        .map<HelpUda>((json)=> HelpUda.fromJson(json))
        .toList();
  }

abstract class HelpRepository {
  Future<List<HelpUda>> getHelpTsk(context, HelpUdaId);
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception: $_message";
  }
}

