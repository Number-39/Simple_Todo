// ignore_for_file: missing_required_param

import 'dart:convert';

import 'package:maidstodo/helpers/api.dart';

class GetAllTasks {
  Future<List<dynamic>> getAllTasks() async {
    dynamic body = await Api().get(url: 'https://dummyjson.com/todos');
    final result = jsonDecode(body)['todos'] as List;
    return result;
  }
}
