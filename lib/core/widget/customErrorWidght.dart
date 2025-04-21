import 'package:flutter/material.dart';

class CustomSnakebarwidght extends StatelessWidget {
  const CustomSnakebarwidght({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
