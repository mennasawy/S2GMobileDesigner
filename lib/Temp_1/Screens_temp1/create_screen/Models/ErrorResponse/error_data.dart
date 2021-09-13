import 'dart:convert';

import 'package:templets/Utilities/app_constants.dart';

class ErrorResponse {
  String code;
  String key;
  String message;
  String error;
  String description;
  ErrorResponse(
      {this.code, this.key, this.message, this.error, this.description});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json[CODE],
      key: json[TIME_STAMP],
      message: json[MESSAGE],
      error: json[ERROR],
    );
  }
}

ErrorResponse errorResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return ErrorResponse.fromJson(jsonData);
}
