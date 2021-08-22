import 'package:flutter/material.dart';


class NewsTitle extends StatelessWidget {

  final String urlToImage;
  final Object author;
  final String title;
  final String publishedAt;
  NewsTitle(this.urlToImage,this.author,this.title,this.publishedAt);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 6),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(urlToImage,
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
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(66, 80, 92, 1.0)),
              textAlign: TextAlign.start),
          Text(publishedAt,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(163, 163, 163, 1.0)),
              textAlign: TextAlign.end)
        ],
      ),
    );
  }
}
