// To parse this JSON data, do
//
//     final restExceptionResponse = restExceptionResponseFromJson(jsonString);

import 'dart:convert';

class RestExceptionResponse {
  RestExceptionResponse({
    this.restException,
  });

  RestException restException;

  factory RestExceptionResponse.fromRawJson(String str) => RestExceptionResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RestExceptionResponse.fromJson(Map<String, dynamic> json) => RestExceptionResponse(
    restException: RestException.fromJson(json["restException"]),
  );

  Map<String, dynamic> toJson() => {
    "restException": restException.toJson(),
  };
}

class RestException {
  RestException({
    this.cause,
    this.stackTrace,
    this.errorCode,
    this.errorMessage,
    this.errorTrace,
    this.errorId,
    this.message,
    this.suppressed,
    this.localizedMessage,
  });

  dynamic cause;
  List<StackTrace> stackTrace;
  String errorCode;
  String errorMessage;
  String errorTrace;
  dynamic errorId;
  dynamic message;
  List<dynamic> suppressed;
  dynamic localizedMessage;

  factory RestException.fromRawJson(String str) => RestException.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RestException.fromJson(Map<String, dynamic> json) => RestException(
    cause: json["cause"],
    stackTrace: List<StackTrace>.from(json["stackTrace"].map((x) => StackTrace.fromJson(x))),
    errorCode: json["ErrorCode"],
    errorMessage: json["ErrorMessage"],
    errorTrace: json["ErrorTrace"],
    errorId: json["ErrorID"],
    message: json["message"],
    suppressed: json["suppressed"] != null? List<dynamic>.from(json["suppressed"].map((x) => x)) : null,
    localizedMessage: json["localizedMessage"],
  );

  Map<String, dynamic> toJson() => {
    "cause": cause,
    "stackTrace": List<dynamic>.from(stackTrace.map((x) => x.toJson())),
    "ErrorCode": errorCode,
    "ErrorMessage": errorMessage,
    "ErrorTrace": errorTrace,
    "ErrorID": errorId,
    "message": message,
    "suppressed": List<dynamic>.from(suppressed.map((x) => x)),
    "localizedMessage": localizedMessage,
  };
}

class StackTrace {
  StackTrace({
    this.classLoaderName,
    this.moduleName,
    this.moduleVersion,
    this.methodName,
    this.fileName,
    this.lineNumber,
    this.className,
    this.nativeMethod,
  });

  ClassLoaderName classLoaderName;
  String moduleName;
  String moduleVersion;
  String methodName;
  String fileName;
  int lineNumber;
  String className;
  bool nativeMethod;

  factory StackTrace.fromRawJson(String str) => StackTrace.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StackTrace.fromJson(Map<String, dynamic> json) => StackTrace(
    classLoaderName: json["classLoaderName"] == null ? null : classLoaderNameValues.map[json["classLoaderName"]],
    moduleName: json["moduleName"] == null ? null : json["moduleName"],
    moduleVersion: json["moduleVersion"] == null ? null : json["moduleVersion"],
    methodName: json["methodName"],
    fileName: json["fileName"] == null ? null : json["fileName"],
    lineNumber: json["lineNumber"],
    className: json["className"],
    nativeMethod: json["nativeMethod"],
  );

  Map<String, dynamic> toJson() => {
    "classLoaderName": classLoaderName == null ? null : classLoaderNameValues.reverse[classLoaderName],
    "moduleName": moduleName == null ? null : moduleName,
    "moduleVersion": moduleVersion == null ? null : moduleVersion,
    "methodName": methodName,
    "fileName": fileName == null ? null : fileName,
    "lineNumber": lineNumber,
    "className": className,
    "nativeMethod": nativeMethod,
  };
}

enum ClassLoaderName { DEPLOYMENT_SMART2_GO_WAR, JAVAX_SERVLET_API_200_FINAL, IO_UNDERTOW_SERVLET_2026_FINAL, IO_OPENTRACING_CONTRIB_OPENTRACING_JAXRS2, ORG_WILDFLY_EXTENSION_UNDERTOW_1800_FINAL, IO_UNDERTOW_CORE_2026_FINAL, ORG_JBOSS_THREADS_233_FINAL }

final classLoaderNameValues = EnumValues({
  "deployment.Smart2Go.war": ClassLoaderName.DEPLOYMENT_SMART2_GO_WAR,
  "io.opentracing.contrib.opentracing-jaxrs2": ClassLoaderName.IO_OPENTRACING_CONTRIB_OPENTRACING_JAXRS2,
  "io.undertow.core@2.0.26.Final": ClassLoaderName.IO_UNDERTOW_CORE_2026_FINAL,
  "io.undertow.servlet@2.0.26.Final": ClassLoaderName.IO_UNDERTOW_SERVLET_2026_FINAL,
  "javax.servlet.api@2.0.0.Final": ClassLoaderName.JAVAX_SERVLET_API_200_FINAL,
  "org.jboss.threads@2.3.3.Final": ClassLoaderName.ORG_JBOSS_THREADS_233_FINAL,
  "org.wildfly.extension.undertow@18.0.0.Final": ClassLoaderName.ORG_WILDFLY_EXTENSION_UNDERTOW_1800_FINAL
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}