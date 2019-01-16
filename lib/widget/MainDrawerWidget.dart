import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      elevation: 12,
      child: new Drawer(
          child: new Container(
        color: Theme.of(context).primaryColor,
        child: new Column(
          children: <Widget>[
            new Expanded(
                child: new Center(
              child: new Text("测试1"),
            )),
            new Expanded(
                child: new Center(
              child: new Text("测试2"),
            ))
          ],
        ),
      )),
    );
  }
}
