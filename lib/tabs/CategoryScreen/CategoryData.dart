import 'package:flutter/material.dart';
class CategoryData{
  var color;
  var backgroundColor;
  var title;
  var categoryName;
  var pixelBorder;
  var pixelBottomRight = 0.0;
  var pixelBottomLeft = 0.0;
  late bool locationIsLeft;
  var image;

  CategoryData({this.backgroundColor, this.color = Colors.white,
    required this.title , this.pixelBorder = 30.0, required this.locationIsLeft,
    required this.image, this.categoryName
  });
}
