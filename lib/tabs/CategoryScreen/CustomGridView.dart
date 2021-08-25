import 'package:flutter/material.dart';
import 'package:news_application/tabs/HomeScreen/HomeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_application/utility/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'CategoryData.dart';
import 'CategoryItem.dart';
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
    provider = Provider.of<AppConfigProvider>(context);

    final List<CategoryData> categories = <CategoryData>[
      CategoryData(categoryName: "Sports",title:  AppLocalizations.of(context)!.sports, image: "assets/widgets/sports.png", locationIsLeft: true, backgroundColor: Color.fromRGBO(201, 28, 34, 1)),
      CategoryData(categoryName: "general",title:  AppLocalizations.of(context)!.politics, image: "assets/widgets/Politics.png", locationIsLeft: true, backgroundColor: Color.fromRGBO(0, 62, 140, 1)),
      CategoryData(categoryName: "Health",title:  AppLocalizations.of(context)!.health, image: "assets/widgets/health.png", locationIsLeft: true, backgroundColor: Color.fromRGBO(237, 30, 121, 1)),
      CategoryData(categoryName: "Business",title:  AppLocalizations.of(context)!.business, image: "assets/widgets/bussines.png", locationIsLeft: true, backgroundColor: Color.fromRGBO(207, 126, 72, 1)),
      CategoryData(categoryName: "Environment",title:  AppLocalizations.of(context)!.environment, image: "assets/widgets/environment.png", locationIsLeft: true, backgroundColor: Color.fromRGBO(72, 130, 207, 1)),
      CategoryData(categoryName: "Science",title:  AppLocalizations.of(context)!.science, image: "assets/widgets/science-1.png", locationIsLeft: true, backgroundColor: Color.fromRGBO(242, 211, 82, 1)),
    ];

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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen(categories[index].title,categories[index].categoryName)));
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
