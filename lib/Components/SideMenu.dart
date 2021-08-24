import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/tabs/SettingsTab.dart';
import '../Home.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);
  static const routeName = 'side menu';

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var colorLightTheme = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.fromLTRB(90, 80, 20, 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 57, 165, 82),
              ),
              child: Text('New App!',style: TextStyle(color: Colors.white,fontSize: 24,
                fontFamily: "Pop_Bold",),),
            ),
            ListTile(
              leading: new Icon(Icons.view_list_rounded, size: 30, color: Colors.black,),
              title: Text('Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: "Pop_Bold",
                  )),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder:  (context) => Home()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.settings, size: 30,color: Colors.black,),
              title: Text('Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: "Pop_Bold",
                  )),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsTab()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
