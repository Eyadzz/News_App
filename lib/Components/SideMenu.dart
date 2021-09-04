import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/tabs/CategoryScreen/CategoryScreen.dart';
import 'package:news_application/tabs/Settings/SettingsTab.dart';
import 'package:news_application/utility/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);
  static const routeName = 'side menu';

  @override
  _SideMenuState createState() => _SideMenuState();
}



class _SideMenuState extends State<SideMenu> {
  var colorLightTheme = Colors.white;
  late AppConfigProvider provider;
  var textStyle = TextStyle(color: Colors.white,fontSize: 24, fontFamily: "Pop_Bold");

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);

    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              padding: EdgeInsets.fromLTRB(90, 80, 20, 20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 57, 165, 82),
              ),
              child: Text(AppLocalizations.of(context)!.drawerTitle, style: textStyle),
            ),
            ListTile(
              leading: new Icon(Icons.view_list_rounded, size: 30, color: Colors.black,),
              title: Text(AppLocalizations.of(context)!.categories, style: textStyle),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              onTap: () {
                provider.setSearchingString('');
                Navigator.pushReplacement(context, MaterialPageRoute(builder:  (context) => CategoryScreen()),
                );
              },
            ),
            ListTile(
              leading: new Icon(Icons.settings, size: 30,color: Colors.black,),
              title: Text(AppLocalizations.of(context)!.settings, style: textStyle),
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