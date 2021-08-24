import 'package:flutter/material.dart';
import 'package:news_application/tabs/HomeScreen/NewsPart.dart';
import 'package:news_application/tabs/HomeScreen/TabItem.dart';
import 'package:news_application/utility/api/Sources.dart';

class HomeTabs extends StatefulWidget {

  List<Sources>sources;
  HomeTabs(this.sources);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  int SelectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: widget.sources.length,
        child: Container(
          padding: EdgeInsets.only(top:12),
          child: Column(
            children: [
              TabBar(
                onTap: (index){
                  setState(() {
                    SelectedIndex=index;
                  });
                },
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  tabs: widget.sources.map((source) => TabItem(source,widget.sources.indexOf(source)==SelectedIndex)).toList()
              ),
              Expanded(child: TabBarView(
                children: widget.sources.map((source) => NewsPart(source)).toList()
              )
            )
          ],
    ),
        ));
  }
}
