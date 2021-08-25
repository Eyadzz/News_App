import 'package:flutter/material.dart';
import 'package:news_application/components/CategoryItem.dart';
import 'package:news_application/components/CategoryData.dart';
import 'package:news_application/tabs/HomeScreen/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_application/utility/AppConfigProvider.dart';
import 'package:provider/provider.dart';

class CustomGridView extends StatefulWidget {

  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {

  final elementsInRow = 2;
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    /*
    final List<CategoryData> categories = <CategoryData>[
      CategoryData(categoryName: "sports",title: AppLocalizations.of(context)!.sports, image: "assets/widgets/sports.png", locationIsLeft: true),
      CategoryData(categoryName: "general",title: AppLocalizations.of(context)!.politics, image: "assets/widgets/Politics.png", locationIsLeft: true),
      CategoryData(categoryName: "health",title: AppLocalizations.of(context)!.health, image: "assets/widgets/health.png", locationIsLeft: true),
      CategoryData(categoryName: "business",title: AppLocalizations.of(context)!.business, image: "assets/widgets/bussines.png", locationIsLeft: true),
      CategoryData(categoryName: "environment",title: AppLocalizations.of(context)!.science, image: "assets/widgets/environment.png", locationIsLeft: true),
      CategoryData(categoryName: "science",title: AppLocalizations.of(context)!.sports, image: "assets/widgets/science-1.png", locationIsLeft: true),
    ];*/

    final List<CategoryData> categories = <CategoryData>[
      CategoryData(categoryName: "sports",title:  "sports", image: "assets/widgets/sports.png", locationIsLeft: true, backGroundColor: Color.fromRGBO(201, 28, 34, 1)),
      CategoryData(categoryName: "general",title:  "politics", image: "assets/widgets/Politics.png", locationIsLeft: true, backGroundColor: Color.fromRGBO(0, 62, 140, 1)),
      CategoryData(categoryName: "health",title:  "health", image: "assets/widgets/health.png", locationIsLeft: true, backGroundColor: Color.fromRGBO(237, 30, 121, 1)),
      CategoryData(categoryName: "business",title:  "business", image: "assets/widgets/bussines.png", locationIsLeft: true, backGroundColor: Color.fromRGBO(207, 126, 72, 1)),
      CategoryData(categoryName: "environment",title:  "science", image: "assets/widgets/environment.png", locationIsLeft: true, backGroundColor: Color.fromRGBO(72, 130, 207, 1)),
      CategoryData(categoryName: "science",title:  "sports", image: "assets/widgets/science-1.png", locationIsLeft: true, backGroundColor: Color.fromRGBO(242, 211, 82, 1)),
    ];

    provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20,0),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: elementsInRow,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          children: List.generate(categories.length, (index){
            categories[index].locationIsLeft = isLeft(index);
            return Container(
              child: InkWell(
                child: CategoryItem(categoryData: categories[index]),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen( categories[index].categoryName)));
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
