import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'package:device_preview/device_preview.dart';
import 'Screens/AccountScreen.dart';
import 'Screens/CategorieScreen.dart';
import 'Screens/ListScreen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        AccountScreen.id: (context) => const AccountScreen(),
        CategorieScreen.id: (context) => const CategorieScreen(),
        ListScreen.id: (context) => const ListScreen(),
      },
    );
  }
}
