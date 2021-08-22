import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_application/HomeScreen/NewsListItem.dart';
import 'package:news_application/utility/api/ApiManager.dart';
import 'package:news_application/utility/api/NewsResponse.dart';
import 'package:news_application/utility/api/sources.dart';


class NewsPart extends StatefulWidget {

  Sources source;
  NewsPart(this.source);

  @override
  _NewsPartState createState() => _NewsPartState();
}

class _NewsPartState extends State<NewsPart> {

  Future<NewsResponse>newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture=getNewsArticles(widget.source);
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Container(
        padding: EdgeInsets.only(top:12),
        child: FutureBuilder<NewsResponse>(
          future: newsFuture,
          builder: (context,snapShot){
                if(snapShot.hasData){
                  return ListView.builder(itemBuilder:(context,index){
                    return NewsListItem(snapShot.data.articles[index]);},itemCount: snapShot.data.articles.length,physics: const AlwaysScrollableScrollPhysics(),);
                }else if (snapShot.hasError){
                  return Center(
                        child: Text("Error Loading News! Check Your Internet!")
    );}
                return Center(child: CircularProgressIndicator());
          },
      ),

    )
    );

  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));

    newsFuture=getNewsArticles(widget.source);
    setState(() {});
  }

}

