import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {


  @override
  final Size preferredSize; // default is 56.0

  CustomAppBar({Key? key}) : preferredSize = Size.fromHeight(60.0),super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{
  bool isSearching = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      title: isSearching?  null : Text("News App", style: TextStyle(fontSize: 22, fontFamily: "Exo", fontWeight: FontWeight.w600)),
      centerTitle: isSearching? false : true,
      leading: isSearching? Container() : Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu_rounded, size: 30),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 57, 165, 82),
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          )),
      actions: <Widget>[
        InkWell(
          child: isSearching ? Container(
            width: 390,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration:  InputDecoration(
                  prefixIcon: IconButton(icon: Icon(Icons.close, color: Colors.grey), onPressed: (){setState(() {
                    isSearching=false;
                  });},),
                  suffixIcon: new Icon(Icons.search, color: Colors.grey),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search Article",
                  hintStyle:  TextStyle(color: Colors.grey,fontWeight: FontWeight.w100,height: 2),
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 4.0, top: 30.0),
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
            padding: const EdgeInsets.all(10.0),
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