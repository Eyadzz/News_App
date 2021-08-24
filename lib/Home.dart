import 'package:flutter/material.dart';
import 'package:news_application/Components/SideMenu.dart';
import 'Components/SideMenu.dart';
import 'Components/myAppBar.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';
  @override
  _HomeState createState() => _HomeState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeState extends State<Home> {
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Sports");
  SideMenu customized = SideMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: customized,
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
    );
  }
}
