import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, @required dynamic headers}) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required dynamic headers,
      @required String? token}) async {
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode(body), headers: headers);
    if (url.contains('add')) {
      return response.statusCode;
    }
    return response.body;
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required dynamic headers,
      @required String? token}) async {
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      return 200;
    }
  }

  Future<dynamic> delete({
    required String url,
    @required String? token,
    @required dynamic headers,
  }) async {
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.delete(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return 200;
    }
  }
}
