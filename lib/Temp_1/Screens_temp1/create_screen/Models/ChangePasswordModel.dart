import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChangePasswordModelRequest {
  String newPassword;
  String oldPassword;

  TextEditingController oldPasswordTextController = TextEditingController();
  TextEditingController newPasswordTextController = TextEditingController();

  ChangePasswordModelRequest({this.newPassword, this.oldPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newPassword'] = this.newPassword;
    data['oldPassword'] = this.oldPassword;
    return data;
  }

  setData() {
    newPasswordTextController.text = newPassword;
    oldPasswordTextController.text = oldPassword;
  }

  ChangePasswordModelRequest saveData() {
    return ChangePasswordModelRequest(
      newPassword: newPasswordTextController.text,
      oldPassword: oldPasswordTextController.text,
    );
  }

  String postChangePassword(ChangePasswordModelRequest data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }
}

class ChangePasswordModelSucssesResponse {
  bool success;
  String errorCode;
  String errorMessage;
  String developerMessage;

  ChangePasswordModelSucssesResponse({this.success});

  ChangePasswordModelSucssesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    developerMessage = json['developerMessage'];
  }
}

ChangePasswordModelSucssesResponse sucssessResponseChangePassword(String data) {
  final dyn = json.decode(data);
  print(ChangePasswordModelSucssesResponse.fromJson(dyn));
  return ChangePasswordModelSucssesResponse.fromJson(dyn);
}

abstract class ChangePasswordRepository {
  Future<dynamic> changePasswordResponse(
      ChangePasswordModelRequest changePassword,
      String uId,
      BuildContext context,
      http.Client client);
}
