import 'package:flutter/material.dart';
import 'package:news_application/HomeScreen/TabItem.dart';
import 'package:news_application/Source.dart';

class HomeTabs extends StatefulWidget {

  HomeTabs();

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final List<Source>sources=[];
  @override
  void initState() {
    // TODO: implement initState
    sources.add(new Source('bbcccccccccccc'));
    sources.add(new Source("cnn"));
    sources.add(new Source("CMB"));
    sources.add(new Source("nbB"));
  }
 @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: sources.length,
        child: Container(
          padding: EdgeInsets.only(top:8),
          child: Column(
            children: [
              TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: sources.map((e) => TabItem(e,false)).toList()
              )

            ],



    ),
        ));
  }
}
