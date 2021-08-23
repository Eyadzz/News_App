import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/Components/myAppBar.dart';

import '../Home.dart';

class SettingsTab extends StatefulWidget {
  static const routeName = 'settings';
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  var item;
  final List<String> Items = ["English","Arabic"];
  PageController _myPage = PageController(initialPage: 2);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const DrawerHeader(
                 padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Text('Language',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                DropdownButton<String>(
                  iconSize: 15.0,
                  value: item,
                  isExpanded: true,
                  items: Items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => this.item = value),
                )
              ],
            )
          ],
        )
    );
  }
}
