import 'dart:convert';
import 'package:maidstodo/helpers/api.dart';
import 'package:maidstodo/models/user_model.dart';

class CurrentUserService {
  Future<dynamic> currentAuth({required String token}) async {
    // ignore: missing_required_param
    String respone = await Api().get(
      url: 'https://dummyjson.com/auth/me',
      headers: {'Authorization': token},
    );
    final jsonData = jsonDecode(respone);
    if (jsonData['message'].toString().contains('nvalid')) {
      return jsonData['message'];
    } else {
      return UserModel(
          id: jsonData['id'],
          username: jsonData['username'],
          email: jsonData['email'],
          firstName: jsonData['firstName'],
          lastName: jsonData['lastName'],
          image: jsonData['image'],
          token: token);
    }
  }
}
