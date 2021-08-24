import 'package:flutter/material.dart';
import 'package:news_application/Home.dart';
import 'package:news_application/tabs/HomeScreen/HomeScreen.dart';
class CustomGridView extends StatefulWidget {

  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  final images = [
    "assets/images/sports.png",
    "assets/images/politics.png",
    "assets/images/health.png",
    "assets/images/business.png",
    "assets/images/enviroment.png",
    "assets/images/science.png",
  ];
  final category = [
      "sports",
      "general",
      "health",
      "business",
      "environment",
      "science"
  ];
  final elementsInRow = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20,0),
      child: GridView.count(
          crossAxisCount: elementsInRow,
          children: List.generate(images.length, (index){
            return Container(
              child: InkWell(
                child: Image.asset(images[index],scale: 1.1,),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(category[index])));
                },
              ),
            );
          }),
      )
    );
  }
}
