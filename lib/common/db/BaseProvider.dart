import 'package:meta/meta.dart';
import 'package:test_flutter_app/common/db/DBManager.dart';

abstract class BaseProvider {
  bool isTableExits = false;

  createTableSql();

  tableName();

  createTableBaseSql(String name, String columnId) {
    return "create table $name ($columnId integer primary key autoincrement, ";
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), createTableSql());
    }
    return await DBManager.getDatabase();
  }

  @mustCallSuper
  prepare(String name, String createSql) async {
    isTableExits = await DBManager.isTableExits(name);
    if (!isTableExits) {
      var databse = await DBManager.getDatabase();
      return await databse.execute(createSql);
    }
  }

  getDataBase() async {
    return await open();
  }
}
