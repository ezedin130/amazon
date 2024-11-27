// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:amazon/Constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const id = 'login';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'WELCOME BACK',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              //check if the password match in the firebase
              decoration:
                  ktextFieldDecoration.copyWith(hintText: 'Enter Your Email'),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              //check if the password match in the firebase for the particular email
              decoration:
                  ktextFieldDecoration.copyWith(hintText: 'Enter Your Password'),
            ),
            MaterialButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                 //onpressed it should go to homescreen but only after checking requirements of the text field
              },
              child: Text(
                'Continue',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
