// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:maidstodo/components/button.dart';
import 'package:maidstodo/components/showmessage.dart';
import 'package:maidstodo/components/squareimage.dart';
import 'package:maidstodo/components/textfield.dart';
import 'package:maidstodo/models/user_model.dart';
import 'package:maidstodo/pages/home_page.dart';
import 'package:maidstodo/services/login_service.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginService loginService = LoginService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              //logo
              Image.asset('images/maids.cc logo.jpg'),
              //welcome message
              const Text(
                'Welcome to the maids.cc Tasks App',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              //username textfield
              CustomTextField(
                controller: usernameController,
                labelText: 'Username',
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              //password textfield
              CustomTextField(
                controller: passwordController,
                labelText: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onTap: () async {
                  dynamic response = await loginService.loginService(
                      usernameController.text, passwordController.text);
                  if (response == 'Invalid credentials') {
                    showMessage(context,
                        'Error, email or password is incorrect, please try again');
                    usernameController.text = '';
                    passwordController.text = '';
                  } else {
                    UserModel userInfo = response;
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(user: userInfo)));
                  }
                },
                label: 'Login',
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text('or continue with')),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareImage(imagePath: 'images/google.png'),
                  SizedBox(
                    width: 10,
                  ),
                  SquareImage(imagePath: 'images/apple.png')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
