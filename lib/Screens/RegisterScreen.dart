// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, unused_element, avoid_print, use_build_context_synchronously, non_constant_identifier_names, unused_local_variable

import 'package:amazon/Constants.dart';
import 'package:amazon/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:amazon/Services/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

//add text controller to the textfields
//add validation
// make the textfields required which means without enserting all of them and in the correct form hjence the validation the page will not change
class RegisterScreen extends StatefulWidget {
  static const id = 'register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = Authentication();
  late String email;
  late String password;
  late String Firstname;
  late String Lastname;
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xffccccccc),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Register for better Experience',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    ktextFieldDecoration.copyWith(hintText: 'Enter Your Email'),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,63}$')
                          .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                onChanged: (value) {
                  Firstname = value;
                },
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your First Name'),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid first name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                onChanged: (value) {
                  Lastname = value;
                },
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your Last Name'),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid Last Name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                onChanged: (value) {
                  password = value;
                },
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your Password at least 6 characters'),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+|~=`{}\[\]:;<>,.?\/]).{6,}$')
                          .hasMatch(value)) {
                    return 'Please enter a valid password';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                onChanged: (value) {
                  password = value;
                },
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your Password Again'),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              MaterialButton(
                color: Colors.lightBlueAccent,
                onPressed: () {
                  //onpressed it should go to homescreen but only after checking requirements of the text field
                  //when the button is clicked the properties should be in the database accordingly
                  register();
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

  void register() async {
    final user = await _auth.CreateUser(email: email, password: password);
    if (user != null) {
      print('User Created Successfully with ID: ${user.uid}');
      Navigator.pushNamed(context, HomeScreen.id);
    }
  }
}
