import 'package:test_flutter_app/common/model/User.dart';
import 'package:redux/redux.dart';

final UserReducer = combineReducers<User>(
    [TypedReducer<User, UpdateUserAction>(_updateActionUserReducer)]);

User _updateActionUserReducer(User user, UpdateUserAction action) {
  return action.user;
}

class UpdateUserAction {
  User user;
  UpdateUserAction(this.user);
}
