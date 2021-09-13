import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/tabs/ArticleScreen/ArticlePage.dart';
import 'package:news_application/Components/NewsTitle.dart';
import 'package:news_application/utility/api/NewsItem.dart';

class NewsListItem extends StatelessWidget {
  final NewsItem news;
  NewsListItem(this.news);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ArticlePage(news,)),
        );
      },
      child: NewsTitle(news.urlToImage,news.author,news.title,news.publishedAt),
    );
  }
}
