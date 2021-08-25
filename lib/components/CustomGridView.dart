import 'package:flutter/material.dart';
import 'package:news_application/Home.dart';
import 'package:news_application/components/Category.dart';
import 'package:news_application/tabs/HomeScreen/HomeScreen.dart';
class CustomGridView extends StatefulWidget {

  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  final images = [
    "assets/widgets/sports.png",
    "assets/widgets/Politics.png",
    "assets/widgets/health.png",
    "assets/widgets/bussines.png",
    "assets/widgets/environment.png",
    "assets/widgets/science-1.png",
  ];
  final category = [
      "sports",
      "general",
      "health",
      "business",
      "environment",
      "science",
  ];
  final elementsInRow = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20,0),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: elementsInRow,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: List.generate(images.length, (index){
            return Container(
              child: InkWell(
                child: Category(txt: category[index], locationIsLeft: isLeft(index), image: images[index],),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(category[index])));
                },
              ),
            );
          }),
      )
    );
  }

  bool isLeft(index){
    return index % 2 == 0;
  }

}
