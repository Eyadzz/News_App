import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier
{
  String currentLocale = 'en';

  void changeLanguage(String lang)
  {
    currentLocale = lang;
    notifyListeners();
  }
  String toSearch = '';

  void setSearchingString(String toSearch)
  {
    this.toSearch = toSearch;
    notifyListeners();
  }

  String getSearchString()
  {
    return toSearch;
  }

  String articleTitle = '';

  void setArticleTitle(String articleTitle)
  {
    this.articleTitle = articleTitle;
    notifyListeners();
  }

  String getArticleTitle()
  {
    return articleTitle;
  }


}