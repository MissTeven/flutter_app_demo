import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/common/config/Config.dart';
import 'package:test_flutter_app/page/HomePage.dart';
import 'package:test_flutter_app/page/ProfilePage.dart';
import 'package:test_flutter_app/page/SecondPage.dart';
import 'package:test_flutter_app/widget/JDouTabBarWidget.dart';
import 'package:test_flutter_app/widget/MainDrawerWidget.dart';

class MainTabBarWidget extends StatelessWidget {
  final List<Widget> tabs = [
    _renderTab(Icons.home, "首页"),
    _renderTab(Icons.map, "内容"),
    _renderTab(Icons.hotel, "我的")
  ];
  final List<Widget> tabViews = _setTabViews();

  static _renderTab(icon, text) {
    return new Tab(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[new Icon(icon, size: 16.0), new Text(text)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new JDouTabBarWidget(
//      drawer: new MainDrawerWidget(),
      type: JDouTabBarWidget.BOTTOM_TAB,
//      title: new Text("测试"),
      tabViews: tabViews,
      tabItems: tabs,
      indicatorColor: Colors.transparent,
    );
  }
}

List<Widget> _setTabViews() {
  return [
    new HomePage(
      sContent: "测试一",
    ),
    new SecondPage(),
    new ProfilePage(),
  ];
}
