// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'BoXColumn.dart';

class ContainerBox extends StatelessWidget {
  ContainerBox(
      {required this.headertext,
      required this.btntxt,
      required this.imagepath1,
      required this.imagepath2,
      required this.imagepath3,
      required this.imagepath4,
      required this.name1,
      required this.name2,
      required this.name3,
      required this.name4});
  String headertext;
  String btntxt;
  String imagepath1;
  String imagepath2;
  String imagepath3;
  String imagepath4;
  String name1;
  String name2;
  String name3;
  String name4;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              headertext,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            BoxRow(
              imagepath1: imagepath1,
              name1: name1,
              imagepath2: imagepath2,
              name2: name2,
            ),
            BoxRow(
              imagepath1: imagepath3,
              imagepath2: imagepath4,
              name1: name3,
              name2: name4,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                btntxt,
                style: TextStyle(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoxRow extends StatelessWidget {
  BoxRow({
    super.key,
    required this.imagepath1,
    required this.imagepath2,
    required this.name1,
    required this.name2,
  });
  String imagepath1;
  String imagepath2;
  String name1;
  String name2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BoxColumn(
          imagepath: imagepath1,
          text: name1,
        ),
        Spacer(),
        BoxColumn(
          imagepath: imagepath2,
          text: name2,
        ),
      ],
    );
  }
}
