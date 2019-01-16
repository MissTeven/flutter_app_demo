import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailItemPageState();
  }
}

class _DetailItemPageState extends State<DetailItemPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("TEST"),
        actions: <Widget>[
          Icon(Icons.ac_unit),
          new Icon(IconData(0xe6d0, fontFamily: "wxcIconFont"), size: 16.0)
        ],
      ),
      body: new Center(
        child: new Text("Welcome To Detail"),
      ),
    );
  }
}
