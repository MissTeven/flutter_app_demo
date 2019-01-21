import 'package:sqflite/sqflite.dart';
import 'package:test_flutter_app/common/db/BaseProvider.dart';
import 'package:test_flutter_app/common/model/User.dart';

class UserProvider extends BaseProvider {
  final name = "userInfo";

  final columnId = "_ID";
  final columnName = "name";
  final columnAddress = "address";
  final columnAge = "age";
  final columnSex = "sex";

  UserProvider() : super();

  @override
  createTableSql() {
    return createTableBaseSql(name, columnId) +
        "$columnName text,$columnAddress text,$columnAge integer,$columnSex integer)";
  }

  @override
  tableName() {
    return name;
  }

  Future insert(User user) async {
    Database database = await getDataBase();
    List<User> users = await query(user.name);
    if (users.length > 0) {
      await delete(user.name);
    }
    return database.insert(name, _toMap(user));
  }

  Map<String, dynamic> _toMap(User user) {
    Map<String, dynamic> map = {
      columnName: user.name,
      columnAddress: user.address,
      columnAge: user.age,
      columnSex: user.sex
    };
    return map;
  }

  Future delete(String userName) async {
    Database database = await getDataBase();
    return database
        .delete(name, where: "$columnName = ?", whereArgs: [userName]);
  }

  Future update(String userName, Map map) async {
    Database database = await getDataBase();
    database.update(name, map, where: "$columnName = ?", whereArgs: [userName]);
    return database
        .delete(name, where: "$columnName = ?", whereArgs: [userName]);
  }

  Future<List<User>> query(String userName) async {
    Database database = await getDataBase();
    List<Map<String, dynamic>> result = await database
        .query(name, where: "$columnName=?", whereArgs: [userName]);
    var list = List<User>();
    if (result.length > 0) {
      for (int i = 0; i < result.length; i++) {
        Map<String, dynamic> it = result[i];
        User user = User.fromJson(it);
        list.add(user);
      }
    }
    return list;
  }
}
