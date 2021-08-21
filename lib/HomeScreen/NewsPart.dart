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
    return Container(
      padding: EdgeInsets.only(top:12),
      child: FutureBuilder<NewsResponse>(
        future: newsFuture,
        builder: (context,snapShot){
              if(snapShot.hasData){
                return ListView.builder(itemBuilder:(context,index){
                  return NewsListItem(snapShot.data.articles[index]);},itemCount: snapShot.data.articles.length,);
              }else if (snapShot.hasError){
                return Text('Error Loading News!');
              }
              return Center(child: CircularProgressIndicator());
        },
      ),


    );
  }
}
