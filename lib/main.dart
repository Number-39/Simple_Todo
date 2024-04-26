import 'package:flutter/material.dart';
import 'package:maidstodo/models/user_model.dart';
import 'package:maidstodo/pages/home_page.dart';
import 'package:maidstodo/pages/loginpage.dart';
import 'package:maidstodo/services/get_current_user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  CurrentUserService user = CurrentUserService();
  UserModel? userInfo;
  if (token != null) {
    userInfo = await user.currentAuth(token: token);
  }

  runApp(MyApp(
    token: token,
    user: userInfo,
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  final UserModel? user;
  const MyApp({super.key, @required this.token, @required this.user});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: user == null ? LoginPage() : HomePage(user: user!));
  }
}
