import 'package:flutter/material.dart';
import 'package:news_application/Components/SideMenu.dart';
import 'Components/SideMenu.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';
  @override
  _HomeState createState() => _HomeState();
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeState extends State<Home> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer:SideMenu(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Sports', style: TextStyle(
          color:Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 57, 165, 82),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          )
        ),
      ),
      body:PageView(
        controller: _myPage,
        onPageChanged: (int){},
        children: [
        ],
      ),
    );
  }
}