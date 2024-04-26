// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:maidstodo/components/button.dart';
import 'package:maidstodo/components/display_info.dart';
import 'package:maidstodo/models/user_model.dart';
import 'package:maidstodo/pages/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerInfo extends StatelessWidget {
  const DrawerInfo({
    super.key,
    required this.userInfo,
  });

  final UserModel userInfo;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(
          maxRadius: 65,
          backgroundColor: Colors.blue[200],
          child: Image.network(
            userInfo.image,
          )),
      const SizedBox(
        height: 10,
      ),
      Text(
        'Welcome! @${userInfo.username}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text(
                'First Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              DisplayInfo(
                userDisplayInfo: userInfo.firstName,
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            children: [
              const Text(
                'Last Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              DisplayInfo(userDisplayInfo: userInfo.lastName),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      const Text(
        'Email Address',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      DisplayInfo(userDisplayInfo: userInfo.email),
      const SizedBox(
        height: 30,
      ),
      CustomButton(
        onTap: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('token');
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        label: 'Log Out',
        color: Colors.red.shade900,
      ),
    ]);
  }
}
