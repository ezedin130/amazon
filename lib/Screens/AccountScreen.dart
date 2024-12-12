// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:amazon/Screens/CategorieScreen.dart';
import 'package:amazon/Screens/HomeScreen.dart';
import 'package:amazon/Screens/ListScreen.dart';
import 'package:amazon/Screens/LoginScreen.dart';
import 'package:amazon/Screens/RegisterScreen.dart';
import 'package:amazon/Services/Navigator.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:amazon/Services/Greetings.dart';

class AccountScreen extends StatefulWidget {
  static const id = 'account';
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;
  late int index;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = IntTween(begin: 0, end: greeting.greetings.length - 1)
        .animate(controller);
    index = animation.value.clamp(0, greeting.greetings.length - 1).toInt();
    controller.forward();
    controller.repeat();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final greeting = Greetings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'ገበያ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 1),
      body: GuestView(
          greeting: greeting,
          animation:
              animation), //this should check with ternary condition and it calls function that checks if user checked in in auth.dart
    );
  }
}

class GuestView extends StatelessWidget {
  const GuestView({
    super.key,
    required this.greeting,
    required this.animation,
  });

  final Greetings greeting;
  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50.0,
            child: DefaultTextStyle(
              style: TextStyle(fontSize: 25.0),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText(
                    greeting.greetings[animation.value],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Center(
            child: Text(
              'SIGN IN FOR THE BEST\n experience',
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            //child:
            //decoration:
            //BoxDecoration(borderRadius: BorderRadius.circular(120.0)),
            child: Material(
              elevation: 5.0,
              // borderRadius: BorderRadius.circular(15.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                child: Text('Sign in'),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Material(
              elevation: 5.0,
              //borderRadius: BorderRadius.circular(15.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterScreen.id);
                },
                child: Text('Create Account'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView(
              children: [
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 15.0),
                    Text('User Name'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Options(
                      text: 'Orders',
                    ),
                    Options(
                      text: 'Buy Again',
                    ),
                    Options(
                      text: 'Account',
                    ),
                    Options(
                      text: 'Lists',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  Options({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(32.0),
      child: MaterialButton(
        onPressed: () {},
        child: Text('Orders'),
      ),
    );
  }
}
