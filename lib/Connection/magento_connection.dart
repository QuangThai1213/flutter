import 'dart:convert';

import 'package:cowell/Model/response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

String baseUrl = GlobalConfiguration().getValue("magentoUrl");
String bearerToken = DotEnv().env['BEARER_TOKEN'];

Future<Response> getProductData(Map<String, dynamic> params) async {
  String url = '$baseUrl' + 'rest/default/V1/products?';
  params.forEach((key, value) {
    url = url + '$key' + '=' + '$value' + '&';
  });
  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    },
  );
  final responseJson = json.decode(response.body);

  return Response.fromJson(responseJson);
}

Future<AttributeSet> getAttributeSet(atributeSetId) async {
  final response = await http.get(
    '$baseUrl' + 'rest/default/V1/products/attribute-sets/$atributeSetId',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    },
  );
  final responseJson = json.decode(response.body);

  return AttributeSet.fromJson(responseJson);
}
