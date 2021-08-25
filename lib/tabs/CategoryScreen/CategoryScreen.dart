import 'package:flutter/material.dart';
import 'package:news_application/Components/SideMenu.dart';
import 'package:news_application/Components/myAppBar.dart';
import 'CustomGridView.dart';



final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class CategoryScreen extends StatelessWidget {
    static const routeName = "Category";
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
