import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {
  final String imagePath;
  const SquareImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black)),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
