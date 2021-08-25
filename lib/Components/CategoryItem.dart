import 'package:flutter/material.dart';
import 'CategoryData.dart';

class CategoryItem extends StatefulWidget {
  CategoryData categoryData;

  CategoryItem({Key? key, required this.categoryData}) : super(key: key);

  @override
  _CategoryItemState createState() => _CategoryItemState();

}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    borderHandel();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        color: widget.categoryData.backGroundColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(widget.categoryData.pixelBorder),
            topRight: Radius.circular(widget.categoryData.pixelBorder),
            bottomLeft: Radius.circular(widget.categoryData.pixelBottomLeft),
            bottomRight: Radius.circular(widget.categoryData.pixelBottomRight)),
      ),
      child: Column(
        children:[
          Image.asset(widget.categoryData.image, height: 100,),
          SizedBox(height: 5),
          Text(widget.categoryData.categoryName, style: TextStyle(fontFamily: "Pop_Bold", color: widget.categoryData.color, fontSize: 18))
        ]
      ),
    );
  }

  void borderHandel(){
    if (widget.categoryData.locationIsLeft == true){
      widget.categoryData.pixelBottomLeft = widget.categoryData.pixelBorder;
      widget.categoryData.pixelBottomRight = 0.0;
    }else{
      widget.categoryData.pixelBottomLeft = 0.0;
      widget.categoryData.pixelBottomRight = widget.categoryData.pixelBorder;
    }
  }
}
