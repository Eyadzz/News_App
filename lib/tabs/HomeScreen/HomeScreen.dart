import 'package:flutter/material.dart';
import 'package:news_application/tabs/HomeScreen/HomeScreenArgs.dart';
import 'package:news_application/tabs/HomeScreen/HomeTabs.dart';
import 'package:news_application/components/SideMenu.dart';
import 'package:news_application/components/myAppBar.dart';
import 'package:news_application/utility/AppConfigProvider.dart';
import 'package:news_application/utility/api/ApiManager.dart';
import 'package:news_application/utility/api/SourceResponse.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  static final routeName = "News";


}

class _HomeScreenState extends State<HomeScreen> {


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<SourceResponse>newsFuture;
  late AppConfigProvider provider;
  late var args;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //provider = Provider.of<AppConfigProvider>(context);
  }
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as HomeScreenArgs;
    provider = Provider.of<AppConfigProvider>(context);
    newsFuture = getNewsSources(args.category.toLowerCase(), provider.currentLocale);
    SideMenu customized = SideMenu();
    return Scaffold(
        key: scaffoldKey,
        drawer: customized,
        appBar: CustomAppBar(title: args.title),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/pattern.png"),
                  fit: BoxFit.cover,
                )
            ),
            child:FutureBuilder<SourceResponse>(
                future: newsFuture,
                builder: (context,snapShot){
                  if(snapShot.hasData){
                    return HomeTabs(snapShot.data!.sources);
                  }else if (snapShot.hasError){
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Error Loading Data! Check Your Internet!"),
                        FloatingActionButton(
                          onPressed: _refreshData,
                          child: Container(
                              padding:EdgeInsets.only(top: 8),
                              child: new Icon(Icons.refresh)),
                        )
                      ],
                    );
                  }
                  return Center(child:CircularProgressIndicator());
                }
            )
        )
    );

  }
  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    newsFuture = getNewsSources(args.category,provider.currentLocale);
    setState(() {});
  }
}