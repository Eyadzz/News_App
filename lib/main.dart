import 'package:flutter/material.dart';
import 'package:news_application/HomeScreen/HomeScreen.dart';
import 'package:news_application/tabs/SettingsTab.dart';
import 'Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor=Color.fromRGBO(57, 165, 82, 1.0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      routes: {
        HomeScreen.routeName: (context) =>HomeScreen('general'),
        Home.routeName: (context) => Home(),
        SettingsTab.routeName: (context) => SettingsTab(),
      },
      initialRoute: Home.routeName,
    );
  }
}