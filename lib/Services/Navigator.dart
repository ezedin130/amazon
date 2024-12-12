import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  AppBottomNavigationBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        // Define route logic
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, 'home');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, 'account');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, 'category');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, 'lists');
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List',
        ),
      ],
    );
  }
}
