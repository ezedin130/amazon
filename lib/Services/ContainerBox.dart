// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'BoXColumn.dart';

class ContainerBox extends StatelessWidget {
  ContainerBox({required this.headertext, required this.btntxt});
  String headertext;
  String btntxt;
  //158,159,160,161

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
            Row(
              children: [
                BoxColumn(
                  imagepath: 'lib/assets/asset 158.jpeg',
                  text: 'Desktops',
                ),
                Spacer(),
                BoxColumn(
                  imagepath: 'lib/assets/asset 159.jpeg',
                  text: 'Laptops',
                ),
              ],
            ),
            Row(
              children: [
                BoxColumn(
                    imagepath: 'lib/assets/asset 160.jpeg',
                    text: 'Hard Drives'),
                Spacer(),
                BoxColumn(
                  imagepath: 'lib/assets/asset 161.jpeg',
                  text: 'PC accessories',
                ),
              ],
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
