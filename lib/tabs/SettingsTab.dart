import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home.dart';

class SettingsTab extends StatefulWidget {
  static const routeName = 'settings';
  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String? selectedItem = "English";
  var item;
  final List<String> Items = ["English","Arabic"];


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
