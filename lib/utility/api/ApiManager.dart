import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_application/utility/api/NewsResponse.dart';
import 'package:news_application/utility/api/SourceResponse.dart';
import 'package:news_application/utility/api/sources.dart';

Future<SourceResponse> getNewsSources()async{
  final uri = Uri.https("newsapi.org", "/v2/top-headlines/sources", {'apiKey':'7f8d46f9393d4845b80565e3cec44ea6', 'category':'sports'});
  final response = await http.get(uri);
  print(response.body);
  if(response.statusCode == 200)
  {
    return SourceResponse.fromJsonMap(jsonDecode(response.body));
  }
  else
  {
    throw Exception("Failed to load data");
  }
}

Future <NewsResponse> getNewsArticles(Sources source) async
{
  final uri = Uri.https("newsapi.org", "/v2/everything", {'apiKey':'7f8d46f9393d4845b80565e3cec44ea6', 'sources':source.id, 'q':"football"});

  final response = await http.get(uri);

  if(response.statusCode == 200)
  {
    return NewsResponse.fromJsonMap(jsonDecode(response.body));
  }
  else
  {
    throw Exception("Failed to load data");
  }
}