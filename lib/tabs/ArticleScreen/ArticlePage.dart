import 'package:flutter/material.dart';
import 'package:news_application/Components/NewsTitle.dart';
import 'package:news_application/utility/AppConfigProvider.dart';
import 'package:news_application/utility/api/NewsItem.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final NewsItem news;
  late AppConfigProvider provider;
  ArticlePage(this.news);
  @override
  Widget build(BuildContext context) {
    provider =  Provider.of<AppConfigProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(provider.getArticleTitle(),style: TextStyle(fontSize: 22, fontFamily: "Exo", fontWeight: FontWeight.w600)),
        centerTitle: true,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage('assets/images/pattern.png'),fit: BoxFit.fill,),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            NewsTitle(
                news.urlToImage, news.author, news.title, news.publishedAt),
            Expanded(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(news.content)
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: (){
                  _launchURL(news.url);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('View Full Article'),
                    Icon(
                        Icons.arrow_right_outlined
                    ),
                  ],
                ),
              ),
            )

          ]),
        ],
      ),
    );
  }
}

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}