import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 5;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      print('no database');
    } else {
      try {
        String _path = '${await getDatabasesPath()}task.db';

        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute('''CREATE TABLE tasks (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title STRING,
              note TEXT,
              isCompleted INTEGER,
              date STRING,
              startTime STRING,
              endTime STRING,
              color INTEGER,
              remind INTEGER, repeat INTEGER )''');
        });
        print('database built');
      } catch (e) {
        print('database broke down');
        print(e);
      }
    }
  }

  static Future<int> insert(Task task) async {
    print('Insert was called');
    return await _db!.insert(_tableName, task.toJS());
  }

  static Future<int> deleteTask(Task task) async {
    print('Delete  was called');

    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    print('Delete All was called');

    return await _db!.delete(_tableName);
  }

  static Future<int> update(Task task) async {
    print('Update was called');

    return await _db!.rawUpdate('''' 
    UPDATE $_tableName SET isCompleted = ? 
    WHERE id = ?
    ''', [1, task.id]);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }
}
