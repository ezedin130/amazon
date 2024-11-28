// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, avoid_print

import 'package:amazon/Constants.dart';
import 'package:amazon/Screens/HomeScreen.dart';
import 'package:amazon/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = Authentication();
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
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
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    ktextFieldDecoration.copyWith(hintText: 'Enter Your Email'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                //check if the password match in the firebase for the particular email
                onChanged: (value) {
                  password = value;
                },
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your Password'),
              ),
              SizedBox(
                height: 5.0,
              ),
              MaterialButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  //onpressed it should go to homescreen but only after checking requirements of the text field
                  signin();
                  setState(() {
                    showSpinner = true;
                  });
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void signin() async {
    final user = await _auth.SigninUser(email: email, password: password);
    if (user != null) {
      print('User logged in Successfully with ID: ${user.uid}');
      Navigator.pushNamed(context, HomeScreen.id);
    }
    setState(() {
      showSpinner = false;
    });
  }
}
