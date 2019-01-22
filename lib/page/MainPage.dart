import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/localization/JDouLocalizations.dart';
import 'package:test_flutter_app/widget/MainTabBarWidget.dart';

class MainPage extends StatelessWidget {
  static var sName = "/";

  /// 单击提示退出
  Future<bool> _dialogExitApp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              content: new Text(
                  JDouLocalizations.of(context).currentLocalized.app_quit_tip),//此处
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text(JDouLocalizations.of(context)
                        .currentLocalized
                        .app_cancel)),//此处
                new FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: new Text(
                        JDouLocalizations.of(context).currentLocalized.app_ok))//此处
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
