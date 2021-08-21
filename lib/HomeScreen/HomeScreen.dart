import 'package:flutter/material.dart';
import 'package:news_application/HomeScreen/HomeTabs.dart';

class SelectedCategory extends StatefulWidget {

  @override
  _SelectedCategoryState createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sports')),
      body:HomeTabs()



    );


  }
}
