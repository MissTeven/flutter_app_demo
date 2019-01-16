import 'package:test_flutter_app/common/db/provider/user/UserProvider.dart';
import 'package:test_flutter_app/common/model/User.dart';
import 'package:redux/redux.dart';

final UserReducer = combineReducers<User>(
    [TypedReducer<User, UpdateUserAction>(_updateActionUserReducer)]);

User _updateActionUserReducer(User user, UpdateUserAction action) {
  User user = action.user;
  if (user != null) {
    UserProvider().insert(user);
  }
  return user;
}

class UpdateUserAction {
  User user;

  UpdateUserAction(this.user);
}
