import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/widget/MainTabBarWidget.dart';

class MainPage extends StatelessWidget {
  static var sName = "/";

  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text("退出应用?"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text("取消")),
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text("确定"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: new MainTabBarWidget(),
        onWillPop: () {
          return _dialogExitApp(context);
        });
  }
}
