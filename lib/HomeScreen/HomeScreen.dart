
import 'package:flutter/material.dart';
import 'package:news_application/HomeScreen/HomeTabs.dart';
import 'package:news_application/utility/api/ApiManager.dart';
import 'package:news_application/utility/api/SourceResponse.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<SourceResponse>newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsFuture=getNewsSources();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sports')),
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
                return HomeTabs(snapShot.data.sources);
            }else if (snapShot.hasError){
                child: Column(
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
    newsFuture=getNewsSources();
    setState(() {});
  }
}
