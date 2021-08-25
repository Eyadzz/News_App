import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsTitle extends StatelessWidget {

  final String urlToImage;
  final Object author;
  final String title;
  final String publishedAt;
  NewsTitle(this.urlToImage,this.author,this.title,this.publishedAt);


  @override
  Widget build(BuildContext context) {
    DateTime tempDate = new DateFormat("yyyy-MM-ddThh:mm:ss").parse(publishedAt);
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(urlToImage=='null'?'https://howfix.net/wp-content/uploads/2018/02/sIaRmaFSMfrw8QJIBAa8mA-article.png': urlToImage,
                    height: 240, width: double.infinity, fit: BoxFit.cover)),
          ),
          Text(author.toString(),
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(121, 130, 139, 1.0)),
              textAlign: TextAlign.start),
          Text(title,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(66, 80, 92, 1.0)),
              textAlign: TextAlign.start),
          Text(timeago.format(tempDate),
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Montserrat',
                  color: Color.fromRGBO(163, 163, 163, 1.0)),
              textAlign: TextAlign.end)
        ],
      ),
    );
  }
}