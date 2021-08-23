import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/tabs/SettingsTab.dart';

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
              child: Text('New App!',style: TextStyle(color: Colors.white,fontSize: 30,),),
            ),
            ListTile(
              leading: new Icon(Icons.list),
              title: Text('Categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  )),
              contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
              onTap: () {
              },
            ),
            ListTile(
              leading: new Icon(Icons.settings),
              title: Text('Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  )),
              contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 5),
              onTap: () {
                Navigator.push(
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
