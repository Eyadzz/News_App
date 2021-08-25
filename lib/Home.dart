import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/Components/SideMenu.dart';
import 'package:news_application/components/Category.dart';
import 'package:news_application/components/CustomGridView.dart';
import 'Components/SideMenu.dart';
import 'Components/myAppBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  static const routeName = 'home';

  @override
  _HomeState createState() => _HomeState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeState extends State<Home> {
  SideMenu customized = SideMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: customized,
      appBar: CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pattern.png"),
              fit: BoxFit.cover,
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Text("Pick your category\nof interest",
                style: TextStyle(
                  fontFamily: "Pop_Bold",
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
            ),
            Flexible(child: CustomGridView()),
          ],
        ),
      ),
    );
  }
}
