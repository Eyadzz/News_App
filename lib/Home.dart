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
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Sports");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer:SideMenu(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: customIcon,
            onPressed: () {
              setState(() {
                if ( this.customIcon.icon == Icons.search){
                  this.customIcon = new Icon(Icons.close);
                  this.customSearchBar = new TextField(
                    style: new TextStyle(
                      color: Colors.white,

                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search,color: Colors.white),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.white)
                    ),
                  );}
                else {
                  this.customIcon = new Icon(Icons.search);
                  this.customSearchBar = new Text("Sports");
                }
              });
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
        title: customSearchBar,
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