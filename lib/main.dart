import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:test_flutter_app/common/model/User.dart';
import 'package:test_flutter_app/common/redux/JDouState.dart';
import 'package:test_flutter_app/page/MainPage.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
// 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  final store =
      Store<JDouState>(appReducer, initialState: JDouState(user: User.empty()));

  @override
  Widget build(BuildContext context) {
    return StoreProvider<JDouState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {MainPage.sName: (context) => MainPage()},
        ));
  }
}
