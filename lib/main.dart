import 'package:flutter/material.dart';
import 'package:news_application/HomeScreen/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Color PrimaryColor =Color.fromRGBO(57, 165, 82, 1.0);
    return MaterialApp(
        theme: ThemeData(
        primaryColor: PrimaryColor,
    ),
        home:SelectedCategory()
    );
  }
}

