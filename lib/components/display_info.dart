import 'package:flutter/material.dart';

class DisplayInfo extends StatelessWidget {
  const DisplayInfo({
    super.key,
    required this.userDisplayInfo,
  });

  final String userDisplayInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.blue[200],
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Text(
        userDisplayInfo,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }
}
