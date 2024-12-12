// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:amazon/Screens/AccountScreen.dart';
import 'package:amazon/Screens/HomeScreen.dart';
import 'package:amazon/Screens/LoginScreen.dart';
import 'package:amazon/Services/Navigator.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  static const id = 'lists';
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool isPressedsh = false;
  bool isPressedse = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff085749),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 3),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black,
                    suffixIcon: Icon(Icons.cancel),
                    suffixIconColor: Colors.grey,
                    hintText: 'Search Amazon',
                    hintStyle: TextStyle(color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Material(
                  borderRadius: BorderRadius.circular(12.0),
                  child: MaterialButton(
                    onPressed: () {
                      //this should have list of all the categories when it is touched it should change the icon to keyboard_arrow_up
                      //drop down button type shit
                      setState(() {
                        isPressedsh = !isPressedsh;
                      });
                    },
                    child: ListTile(
                      leading: Text(
                        'Shop by Department',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(isPressedsh
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Material(
                  borderRadius: BorderRadius.circular(12.0),
                  child: MaterialButton(
                    onPressed: () {
                      //this should have list of all the categories when it is touched it should change the icon to keyboard_arrow_up
                      //drop down button type shit
                      setState(() {
                        isPressedse = !isPressedse;
                      });
                    },
                    child: ListTile(
                      leading: Text(
                        'Settings',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(isPressedse
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Material(
                  borderRadius: BorderRadius.circular(12.0),
                  child: MaterialButton(
                    onPressed: () {
                      //this should have list of all the categories when it is touched it should change the icon to keyboard_arrow_up
                      //drop down button type shit
                      setState(() {});
                    },
                    child: ListTile(
                      leading: Text(
                        'Customer Service',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Material(
                  borderRadius: BorderRadius.circular(12.0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                      //Todo : if user has logged in the button should change to signout
                    },
                    child: ListTile(
                      leading: Text(
                        'Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
