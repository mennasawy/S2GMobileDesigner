import 'dart:convert';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormListMapping.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Models/CreateUDAs/Form/FormUDAValues.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/ServiceUrls.dart';
import 'package:templets/Temp_1/Screens_temp1/create_screen/Services/api_client.dart';
import 'package:templets/Utilities/const.dart';
import 'package:templets/Utilities/utility_methods.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormUDAService implements FormUDARepository, FormUDAMappingRepository {
  @override
  Future<List<FormUDAValues>> getFormUDAValues(
      context, FormUDAValuesRequest formUDARequestBody) async {
    // TODO: implement getFormUDAValues
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).formUDA;
    var formRequestBody = json.encode(formUDARequestBody.toJson());
    return await postCallService(url, RequestType.GETFORMUDADATA,
        formRequestBody, sessionToken, http.Client());
  }

  parseFormUDA(String body) {
    List<FormUDAValues> formUDA = [];
    final List parsed = json.decode(body);
    if (isNotEmptyList(parsed))
      parsed.forEach((formUDAValue) =>
          {formUDA.add(FormUDAValues.fromJson(formUDAValue))});
    return formUDA;
  }

  @override
  Future<List<FormListMappingResponse>> mapUDAsOnFormSelection(
      BuildContext context,
      FormListMappingRequest formListMappingRequestBody) async {
    // TODO: implement mapUDAsOnFormSelection
    final sessionToken = GetTokenFromSecure.getSessionToken();
    String url = ServiceUrls(context).formUDAMapping;
    var formMappingRequestBody =
        json.encode(formListMappingRequestBody.toMap());
    return await postCallService(url, RequestType.MAPUDASONFORMUDA,
        formMappingRequestBody, sessionToken, http.Client());
  }
}
