// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables

import 'package:amazon/Constants.dart';
import 'package:flutter/material.dart';

//add text controller to the textfields
//add validation
// make the textfields required which means without enserting all of them and in the correct form hjence the validation the page will not change
class RegisterScreen extends StatelessWidget {
  static const id = 'register';
  const RegisterScreen({super.key});

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
                decoration: ktextFieldDecoration.copyWith(hintText: 'Enter Your Email'),
                validator: (value) {
                  if(value!.isEmpty || !RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,63}$').hasMatch(value)){
                    return 'Please enter a valid email address';
                  }
                  else{
                    return null;
                  }
                },
                    
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your First Name'),
                    validator: (value) {
                  if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                    return 'Please enter a valid email address';
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your Last Name'),
                    validator: (value) {
                  if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                    return 'Please enter a valid email address';
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your Password at least 6 characters'),
                    validator: (value) {
                  if(value!.isEmpty || !RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+|~=`{}\[\]:;<>,.?\/]).{6,}$').hasMatch(value)){
                    return 'Please enter a valid email address';
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 5.0,
              ),
              TextFormField(
                decoration: ktextFieldDecoration.copyWith(
                    hintText: 'Enter Your Password Again'),
                    validator: (value) {
                  if(value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                    return 'Please enter a valid email address';
                  }
                  else{
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
      ),
    );
  }
}
