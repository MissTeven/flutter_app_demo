import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:test_flutter_app/common/model/User.dart';
import 'package:test_flutter_app/common/redux/JDouState.dart';
import 'package:test_flutter_app/common/redux/UserReducer.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var _editingController = TextEditingController();
    return new StoreBuilder<JDouState>(builder: (context, store) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Container(
              child: Text(store.state.user != null &&
                      store.state.user.name != null &&
                      store.state.user.name.length > 0
                  ? store.state.user.name
                  : ""),
            ),
            new Column(
              children: <Widget>[
                Container(
                  child: TextField(
                    controller: _editingController,
                    decoration: InputDecoration(hintText: "请输入用户名"),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                ),
                RaisedButton(
                  child: new Text("添加数据"),
                  onPressed: () {
                    _saveUserName(_editingController.text);
                  },
                )
              ],
            )
          ],
        ),
      );
    });
  }

  void _saveUserName(String text) {
    if (text != null && text.length > 0) {
      print("新的用户名：" + text);
      User user = StoreProvider.of<JDouState>(context).state.user;
      if (user == null) {
        user = User();
      }
      user.name = text;
      StoreProvider.of<JDouState>(context).dispatch(new UpdateUserAction(user));
    }
  }
}
