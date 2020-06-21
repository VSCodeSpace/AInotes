import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:notes/data/response.dart';
import 'dart:developer' as developer;
const token = "BZD3JXYIAUPSKBZ4FOJJ5IZCILXSMAKA";
Future<WitResponse> getMessage(String query) async {
  final response = await http.get(
      'https://api.wit.ai/message?q=${Uri.encodeQueryComponent(query)}',
      headers: <String, String> {
        HttpHeaders.authorizationHeader: "Bearer $token"
  });
  developer.log(response.body);
  if(response.statusCode == 200)
    return WitResponse.fromJson(json.decode(response.body));
  else
    throw Exception('Invalid JSON');
}