import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news_application/tabs/HomeScreen/NewsListItem.dart';
import 'package:news_application/utility/AppConfigProvider.dart';
import 'package:news_application/utility/api/ApiManager.dart';
import 'package:news_application/utility/api/NewsResponse.dart';
import 'package:news_application/utility/api/Sources.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class NewsPart extends StatefulWidget {

  final Sources source;
  NewsPart(this.source);

  @override
  _NewsPartState createState() => _NewsPartState();
}

class _NewsPartState extends State<NewsPart> {

  late AppConfigProvider provider;
  late Future<NewsResponse>newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    provider =  Provider.of<AppConfigProvider>(context);
    newsFuture=getNewsArticles(widget.source,provider.currentLocale,provider.getSearchString());
    return RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          padding: EdgeInsets.only(top:12),
          child: FutureBuilder<NewsResponse>(
            future: newsFuture,
            builder: (context,snapShot){
              if(snapShot.hasData){
                return ListView.builder(itemBuilder:(context,index){
                  return NewsListItem(snapShot.data!.articles[index]);},itemCount: snapShot.data!.articles.length,physics: const AlwaysScrollableScrollPhysics(),);
              }else if (snapShot.hasError){
                return Center(
                    child: Text(AppLocalizations.of(context)!.errorLoading)
                );}
              return Center(child: CircularProgressIndicator());
            },
          ),

        )
    );

  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));

    newsFuture=getNewsArticles(widget.source,provider.currentLocale,provider.getSearchString());
    setState(() {});
  }

}