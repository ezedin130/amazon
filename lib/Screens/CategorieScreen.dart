// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
// as an idea this page should ahve two types ,
// the first type considers the user has not logged in or signed in yet and,
// the second type considers the user logged in and it will display the things that the user added to his/her cart
import 'package:amazon/Screens/AccountScreen.dart';
import 'package:amazon/Screens/HomeScreen.dart';
import 'package:amazon/Screens/ListScreen.dart';
import 'package:amazon/Screens/LoginScreen.dart';
import 'package:amazon/Screens/RegisterScreen.dart';
import 'package:amazon/Services/Navigator.dart';
import 'package:flutter/material.dart';

class CategorieScreen extends StatelessWidget {
  static const id = 'category';
  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff085749),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 2),
      body: WithoutUser(),
    );
  }
}

class WithoutUser extends StatelessWidget {
  const WithoutUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
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
        SizedBox(height: 20.0),
        Expanded(
          child: Image.asset(
            'lib/assets/cart.jpg',
          ),
        ),
        Center(
          child: Text(
            'Your Amazon Cart is empty',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
        SizedBox(height: 20.0),
        TextButton(
          onPressed: () {},
          child: Text(
            'shop today\'s deals',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Material(
            color: Colors.yellowAccent,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(32.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              child: Text('Sign in to your account'),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(32.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.id);
              },
              child: Text('Sign up now'),
            ),
          ),
        ),
      ],
    );
  }
}

class WithUser extends StatefulWidget {
  const WithUser({super.key});

  @override
  State<WithUser> createState() => _WithUserState();
}

class _WithUserState extends State<WithUser> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
