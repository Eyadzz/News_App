import 'package:flutter/material.dart';
import 'package:news_application/utility/NewsTitle.dart';
import 'package:news_application/utility/api/NewsItem.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatelessWidget {
  final NewsItem news;
  ArticlePage(this.news);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title),
        leading: new Container(),
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
            Text(news.content, maxLines: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('View Full Article'),
                IconButton(
                  onPressed: () {
                    _launchURL(news.url);
                  },
                  icon: const Icon(Icons.arrow_right_outlined),
                )
              ],
            ),
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
