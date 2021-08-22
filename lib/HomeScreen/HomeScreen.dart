import 'package:flutter/material.dart';
import 'package:news_application/HomeScreen/HomeTabs.dart';
import 'package:news_application/utility/api/ApiManager.dart';
import 'package:news_application/utility/api/SourceResponse.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Future<SourceResponse>newsFuture;
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
      body:FutureBuilder<SourceResponse>(
        future: newsFuture,
        builder: (context,snapShot){
            if(snapShot.hasData){
                return HomeTabs(snapShot.data!.sources);
            }else if (snapShot.hasError){
                return Text("There is an error!");
            }
            return Center(child:CircularProgressIndicator());

        }
      )



    );


  }
}
