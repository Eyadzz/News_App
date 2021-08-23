import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {


  @override
  final Size preferredSize; // default is 56.0

  CustomAppBar({Key? key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{
  Icon customIcon = Icon(Icons.search);
  Widget customSearchBar = Text("Sports");
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        IconButton(
          icon: customIcon,
          onPressed: () {
            setState(() {
              if (this.customIcon.icon == Icons.search) {
                this.customIcon = new Icon(Icons.close);
                this.customSearchBar = new TextField(
                  style: new TextStyle(
                    height: 0.1,
                    color: Colors.black,
                  ),
                  decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.close, color: Colors.grey),
                    suffixIcon: new Icon(Icons.search, color: Colors.grey),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search Article",
                    hintStyle: new TextStyle(color: Colors.grey,fontWeight: FontWeight.w100,),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 4.0, top: 30.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: new BorderRadius.circular(25.7),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25.7),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              } else {
                this.customIcon = new Icon(Icons.search);
                this.customSearchBar = new Text("Sports");
              }
            });
          },
        ),
      ],
      iconTheme: IconThemeData(color: Colors.white),
      title: customSearchBar,
      centerTitle: true,
      elevation: 0,
      backgroundColor: Color.fromARGB(255, 57, 165, 82),
      shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(80),
            bottomRight: Radius.circular(80),
          )),
    );
  }
}