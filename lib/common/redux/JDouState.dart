import 'package:test_flutter_app/common/model/User.dart';
import 'package:test_flutter_app/common/redux/UserReducer.dart';

class JDouState {
  User user;

  JDouState({this.user});
}

JDouState appReducer(JDouState state, action) {
  return JDouState(user: UserReducer(state.user, action));
}
