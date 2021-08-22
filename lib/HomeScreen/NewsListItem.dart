import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:news_application/utility/api/NewsItem.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsListItem extends StatelessWidget {
  NewsItem news;
  NewsListItem(this.news);
  @override
  Widget build(BuildContext context) {
    DateTime tempDate = new DateFormat("yyyy-MM-ddThh:mm:ss").parse(news.publishedAt);
    return Container(
         padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child:Image.network(news.urlToImage,height: 240,width: double.infinity,fit:BoxFit.cover)
               ),
            ),
              Text(news.author??'No data',style: TextStyle(fontSize: 10,fontFamily: 'Poppins',color:
              Color.fromRGBO(121, 130, 139, 1.0)),textAlign: TextAlign.start),
              Text(news.title,style: TextStyle(fontSize: 16,fontFamily: 'Poppins',fontWeight:FontWeight.bold,color:
              Color.fromRGBO(66, 80, 92, 1.0)),textAlign: TextAlign.start),
              Text(timeago.format(tempDate),style: TextStyle(fontSize: 12,fontFamily: 'Poppins',color:
              Color.fromRGBO(163, 163, 163, 1.0)),textAlign: TextAlign.end)

          ],
        ),
    );
  }
}
