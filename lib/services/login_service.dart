import 'dart:convert';

import 'package:maidstodo/helpers/api.dart';
import 'package:maidstodo/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<dynamic> loginService(String username, String password) async {
    final body = {
      'username': username,
      'password': password,
    };
    // ignore: missing_required_param
    String respone = await Api().post(
      url: 'https://dummyjson.com/auth/login',
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    final jsonData = jsonDecode(respone);
    SharedPreferences tokenPref = await SharedPreferences.getInstance();
    SharedPreferences idPref = await SharedPreferences.getInstance();
    tokenPref.setString('token', jsonData['token']);
    idPref.setInt('id', jsonData['id']);
    if (jsonData['message'].toString().contains('Invalid')) {
      return jsonData['message'];
    } else {
      return UserModel.fromJson(jsonData);
    }
  }
}
