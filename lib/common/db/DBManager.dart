import 'dart:io';

import 'package:sqflite/sqflite.dart';

class DBManager {
  static const VERSION = 1;
  static const DB_NAME = "flutter_app_demo.db";
  static Database _database;

  ///初始化
  static init() async {
    var databasePath = await getDatabasesPath();
    databasePath += (Platform.isIOS ? "/" : "") + DB_NAME;

    _database = await openDatabase(databasePath, version: VERSION,
        onCreate: (db, version) async {
      final sql =
          "CREATE TABLE Test (id INTEGER PRIMARY KEY,name TEXT,value INTEGER,num REAL)";
      await db.execute(sql);
    });
  }

  ///获取当前数据库对象
  static Future<Database> getDatabase() async {
    if (_database == null) {
      await init();
    }
    return _database;
  }

  ///表是否存在 每一个 SQLite 数据库都有一个叫SQLITE_MASTER 的表
  static Future<bool> isTableExits(String tableName) async {
    await getDatabase();
    final sql =
        "select * from sqlite_master where type = 'table' and name = '$tableName'";
    var res = await _database.rawQuery(sql);
    return res != null && res.length > 0;
  }

  ///关闭
  static close() {
    _database?.close();
    _database = null;
  }
}
