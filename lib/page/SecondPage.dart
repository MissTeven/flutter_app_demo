import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:test_flutter_app/common/model/User.dart';
import 'package:test_flutter_app/common/redux/JDouState.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<JDouState, User>(
      converter: (store) => store.state.user,
      builder: (context, user) {
        return Center(
          child: Text(user != null && user.name != null && user.name.length > 0
              ? user.name
              : ""),
        );
      },
    );
  }
}
