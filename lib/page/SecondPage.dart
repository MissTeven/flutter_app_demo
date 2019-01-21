import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:test_flutter_app/common/config/Config.dart';
import 'package:test_flutter_app/common/db/provider/user/UserProvider.dart';
import 'package:test_flutter_app/common/model/User.dart';
import 'package:test_flutter_app/common/redux/JDouState.dart';

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  User dbUser = null;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<JDouState, User>(
      converter: (store) => store.state.user,
      builder: (context, user) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(dbUser != null && dbUser.name != null && dbUser.name.length > 0
                ? dbUser.name
                : "该处为数据库数据显示位置"),
            Text(user != null && user.name != null && user.name.length > 0
                ? user.name
                : ""),
            RaisedButton(
              child: new Text("DONE"),
              onPressed: () {
                queryUserFromDB();
              },
            )
          ],
        );
      },
    );
  }

  void queryUserFromDB() async {
    User user = StoreProvider.of<JDouState>(context).state.user;
    if (user != null) {
      List<User> list = await UserProvider().query(user.name);
      if (list.length > 0) {
        setState(() {
          dbUser = list[0];
        });
      }
    }
  }
}
