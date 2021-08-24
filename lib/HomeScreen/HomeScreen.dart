import 'package:flutter/material.dart';
import 'package:news_application/HomeScreen/HomeTabs.dart';
import 'package:news_application/components/SideMenu.dart';
import 'package:news_application/components/myAppBar.dart';
import 'package:news_application/utility/api/ApiManager.dart';
import 'package:news_application/utility/api/SourceResponse.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  static final routeName = "News";
  HomeScreen(this.category);
  var category;

}

class _HomeScreenState extends State<HomeScreen> {


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<SourceResponse>newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture = getNewsSources(widget.category);
  }
  @override
  Widget build(BuildContext context) {
    var title = widget.category == 'general' ? 'Politics' : widget.category;
    SideMenu customized = SideMenu();
    return Scaffold(
        key: scaffoldKey,
        drawer: customized,
        appBar: CustomAppBar(searchval: title,),
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
    newsFuture = getNewsSources(widget.category);
    setState(() {});
  }
}