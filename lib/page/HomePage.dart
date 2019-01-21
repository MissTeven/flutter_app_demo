import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:test_flutter_app/common/config/Config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter_app/common/model/TestBean.dart';
import 'package:test_flutter_app/common/net/Address.dart';
import 'package:test_flutter_app/common/net/Api.dart';
import 'package:test_flutter_app/page/DetailItemPage.dart';
import 'package:test_flutter_app/widget/JDouPullLoadWidget.dart';

class HomePage extends StatelessWidget {
  static var sName = "/";
  var sContent;

  HomePage({Key key, this.sContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: JDouPullLoadWidget(
      control: JDouPullLoadWidgetControl(
        onRefresh: _refresh,
        headerBuilder: ({dynamic item, int index}) {
          return Container(
            color: Colors.blueAccent,
            height: 180,
            child: Center(
              child: new Text("我是头部"),
            ),
          );
        },
        itemBuilder: ({dynamic item, int index}) {
          //设置分割线
//          if (index.isOdd) return new Divider();
          return GestureDetector(
            child: Card(
              child: Container(
                height: 100,
                margin: EdgeInsets.all(0),
                child: Text("Test" + index.toString()),
              ),
              color: Colors.amber,
            ),
            onTap: () {
              _showDetail(context, item);
            },
          );
        },
      ),
    ));
  }

  Future<List> _refresh({int pageSize, int pageIndex}) async {
    String url = Address.testRequest();
    Response res = await HttpManager.netFetch(url, null, null, null);
    if (res != null) {
      var list = res.data["subjects"];
      var testBeans = List();
      for (int i = 0; i < list.length; i++) {
        TestBean testBean = TestBean.fromJson(list[i]);
        testBeans.add(testBean);
      }
      print(" test beans :" + testBeans.toString());
      return testBeans;
    } else {
      return List();
    }
  }

  _showDetail(BuildContext context, dynamic item) {
    print("点击了");
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) {
      return new DetailItemPage();
    }));
  }
}
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Text('Count: $count');
  }
}

