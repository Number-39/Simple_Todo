import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String labelText;
  final bool obscureText;
  const CustomTextField(
      {super.key,
      this.controller,
      required this.labelText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            labelStyle: const TextStyle(color: Colors.black),
            focusColor: Colors.black,
            suffix: labelText == 'Password'
                ? const Icon(
                    Icons.lock,
                    color: Colors.black,
                  )
                : null,
            labelText: labelText,
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }
}
