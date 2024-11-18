// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
class BoxColumn extends StatelessWidget {
  const BoxColumn({
    super.key,
    required this.imagepath,
    required this.text,
  });

  final String imagepath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      //add button for the functionslity
      children: [
        Image.asset(imagepath),
        Text(
          text,
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
      ],
    );
  }
}