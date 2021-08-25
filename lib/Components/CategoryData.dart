import 'package:flutter/material.dart';
class CategoryData{
  var color;
  var backGroundColor;
  var categoryName;
  var pixelBorder;
  var pixelBottomRight = 0.0;
  var pixelBottomLeft =0.0;
  late bool locationIsLeft;
  var image;

  CategoryData({this.backGroundColor = Colors.red, this.color = Colors.white,
    required this.categoryName , this.pixelBorder = 30.0, required this.locationIsLeft,
    required this.image
  });
}
