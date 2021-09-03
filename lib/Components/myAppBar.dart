import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/utility/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {


  @override
  final Size preferredSize; // default is 56.0

  CustomAppBar({Key? key, this.title}) : preferredSize = Size.fromHeight(60.0),super(key: key);
  var title;
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{
  bool isSearching = false;
  var primaryColor = Color.fromARGB(255, 57, 165, 82);
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      title: isSearching?  null : Text(widget.title??AppLocalizations.of(context)!.title, style: TextStyle(fontSize: 22, fontFamily: "Exo", fontWeight: FontWeight.w600)),
      centerTitle: isSearching? false : true,
      leading: isSearching? Container() : Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu_rounded, size: 30),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      elevation: 0,
      backgroundColor: primaryColor,
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          )),
      actions: <Widget>[
        InkWell(
          child: isSearching ? Container(
            width: 380,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20,8.0,20,8),
              child: TextField(
                onSubmitted: (toSearch){
                  setState(() {
                    toSearch = "+" +toSearch;
                    provider.setSearchingString(toSearch);
                  });
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration:  InputDecoration(

                  prefixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,8,0),
                    child: IconButton(icon: Icon(Icons.close, color: primaryColor), onPressed: (){setState(() {
                      isSearching=false;
                    });},),
                  ),
                  suffixIcon: new Icon(Icons.search, color: primaryColor, size: 30,),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: AppLocalizations.of(context)!.searchArticle,
                  hintStyle:  TextStyle(color: primaryColor,fontWeight: FontWeight.w100,height: 1.5),
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 4.0, top: 4.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:  BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:  BorderSide(color: Colors.white),
                    borderRadius:  BorderRadius.circular(25.7),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                    height: 2,
                  ),
                ),
              ),
            ),
          ) : Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.search_rounded, size: 30,),
          ),
          onTap: () {
            setState(() {
              isSearching = true;
            });
          },
        ),
      ],
    );
  }
}