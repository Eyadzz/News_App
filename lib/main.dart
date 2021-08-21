import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_application/utility/api/Source.dart';

import 'HomeScreen/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {


  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Color primaryColor=Color.fromRGBO(57, 165, 82, 1.0);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: HomeScreen(),
    );
  }
}

