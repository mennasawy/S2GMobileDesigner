import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/ValueList/ValueList.dart';

class RepositoryUDA {
  final List<ValueList> multiValues;
  final int queryId;
  final int bindDataId;
  final int sourceOperationDataId;
  final int recId;

  RepositoryUDA(
      {this.multiValues,
      this.queryId,
      this.bindDataId,
      this.sourceOperationDataId,
      this.recId});

  factory RepositoryUDA.fromJson(Map<String, dynamic> json) {
    return RepositoryUDA(
        recId: json["recId"],
        multiValues: (json["multiValues"] != null)
            ? json["multiValues"]
                .map<ValueList>((json) => ValueList.fromJson(json))
                .toList()
            : null,
        queryId: json["sourceOperationId"],
        bindDataId: json["bindDataId"],
        sourceOperationDataId: json["sourceOperationDataId"]);
  }

  toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["recId"] = recId;
    json["multiValues"] = jsonEncodeMultiValues();
    json["sourceOperationId"] = queryId;
    json["bindDataId"] = bindDataId;
    json["sourceOperationDataId"] = sourceOperationDataId;
    return json;
  }

  jsonEncodeMultiValues() {
    var listValue = [];
    if (multiValues != null)
      multiValues.forEach((item) => {listValue.add(item.toJson())});
    return listValue;
  }
}

class QueryInfo {
  final int queryId;
  final int bindDataId;
  final int sourceOperationDataId;

  final String filter;

  QueryInfo({
    this.queryId,
    this.bindDataId,
    this.sourceOperationDataId,
    this.filter,
  });

  factory QueryInfo.fromJson(Map<String, dynamic> json) {
    return QueryInfo(
      queryId: json["queryId"],
      bindDataId: json["bindDataId"],
      sourceOperationDataId: json["sourceOperationDataId"],
      filter: json["filter"],
    );
  }

  toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["queryId"] = queryId;
    json["bindDataId"] = bindDataId;
    json["sourceOperationDataId"] = sourceOperationDataId;
    json["filter"] = filter;
    return json;
  }
}

class RepositoryValueListRepository {}
