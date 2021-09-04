import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/Components/myAppBar.dart';
import 'package:news_application/components/SideMenu.dart';
import 'package:news_application/utility/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingsTab extends StatefulWidget {
  static const routeName = 'settings';
  @override
  _SettingsTabState createState() => _SettingsTabState();
}
final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _SettingsTabState extends State<SettingsTab> {
  final List<String> Items = ["English","العربية"];
  static var item ;
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    SideMenu customized = SideMenu();
    item = provider.currentLocale=='en'?Items.elementAt(0):Items.elementAt(1);
    return Scaffold(
        key: scaffoldKey,
        drawer: customized,
        appBar: CustomAppBar(),
        body: Stack(
          //alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
                  child: Text(AppLocalizations.of(context)!.language,style: TextStyle(color: Colors.black,fontSize: 15,fontFamily: "Pop_Bold"),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 15, 50, 0),
                  child: DropdownButton(
                    style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.w400,),
                    iconSize: 15.0,
                    value: item,
                    isExpanded: true,
                    items: Items.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() {
                      item = value;
                      provider.changeLanguage(value=="English"?'en':'ar');
                    } ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}