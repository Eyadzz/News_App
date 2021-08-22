import 'package:flutter/material.dart';
class CustomGridView extends StatefulWidget {
  const CustomGridView({Key key, this.elementInRow}) : super(key: key);
  final elementInRow;
  @override
  _CustomGridViewState createState() => _CustomGridViewState();
}

class _CustomGridViewState extends State<CustomGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
          crossAxisCount: widget.elementInRow,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,

      )
    );
  }
}
