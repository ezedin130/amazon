// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

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
    super.dispose();
    controller.dispose();
  }

  final greeting = Greetings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          'AMAZON',
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
              child: DefaultTextStyle(
                style: TextStyle(fontSize: 40.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    RotateAnimatedText(greeting.greetings[animation.value]),
                  ],
                ),
              ),
            ),
            Center(
              child: Text(
                'SIGN IN FOR THE BEST\n experience',
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(15.0),
              child: MaterialButton(
                onPressed: () {},
                child: Text('Sign in'),
              ),
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(15.0),
              child: MaterialButton(
                onPressed: () {},
                child: Text('Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
