import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier
{
  String currentLocale = 'en';

  void changeLanguage(String lang)
  {
    currentLocale = lang;
    notifyListeners();
  }

}