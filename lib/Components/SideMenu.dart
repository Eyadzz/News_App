import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);
  static const routeName = 'side menu';

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  var colorLightTheme = Colors.white;

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Container(
        color: colorLightTheme,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 90,horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Collections'),
                  ),
                ),
                InkWell(
                  onTap: (){
                    changeLanguage();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Settings'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeLanguage() {
    Navigator.pop(context);
    showModalBottomSheet(context: context, builder: (buildContext){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('English',textAlign: TextAlign.center,),
              ),
            ),
            InkWell(
              onTap: (){
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Arabic',textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      );
    });
  }

}