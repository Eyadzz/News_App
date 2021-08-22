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
                if(this.customIcon.icon == Icons.search)
                {
                  this.customIcon = Icon(Icons.cancel);
                  this.customSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder:OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                }
                else
                {
                  this.customIcon = Icon(Icons.search);
                  this.customSearchBar = Text("Sports");
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