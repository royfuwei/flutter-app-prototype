import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:sqflite/sqflite.dart';

class DevSqflite extends StatefulWidget {
  static String routeName = "dev/sqflite";
  const DevSqflite({Key? key}) : super(key: key);

  @override
  _DevSqfliteState createState() => _DevSqfliteState();
}

class _DevSqfliteState extends State<DevSqflite> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text(
              '新增',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              StudentManager.instance.insert();
            },
          ),
          RaisedButton(
            child: Text(
              '查詢',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              StudentManager.instance.query();
            },
          ),
          RaisedButton(
            child: Text(
              '修改',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              StudentManager.instance.update();
            },
          ),
          RaisedButton(
            child: Text(
              '刪除',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              StudentManager.instance.delete();
            },
          ),
        ],
      ),
    );
  }
}

class Student {
  final int? id;
  final String? name;
  final int? score;

  Student({this.id, this.name, this.score});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'score': score,
    };
  }
}

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  //Singleton 單例模式，確保一個類別只有一個實例
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print('documentsDirectory: ${documentsDirectory}');
    print('documentsDirectory.list(): ${documentsDirectory.listSync()}');
    String path = join(documentsDirectory.path, _databaseName);
    print('path: ${path}');
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            id INTEGER PRIMARY KEY,
            name TEXT NOT NULL,
            score INTEGER NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db!.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await instance.database;
    return await db!.query(table);
  }

  Future<int?> queryRowCount() async {
    Database? db = await instance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    int id = row['id'];
    return await db!.update(table, row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database? db = await instance.database;
    return await db!.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}

class StudentManager {
  final dbHelper = DatabaseHelper.instance;

  //Singleton 單例模式，確保一個類別只有一個實例
  StudentManager._privateConstructor();

  static final StudentManager instance = StudentManager._privateConstructor();

  //插入資料
  void insert() async {
    var student = Student(
      name: 'HKT',
      score: 59,
    );

    dbHelper.insert(student.toMap());
    print('--- insert 執行結束---');
  }

  //查詢資料
  void query() async {
    final rows = await dbHelper.queryAllRows();
    print('查詢結果:');
    rows.forEach((row) => print(row));
    print('--- query 執行結束---');
  }

  //更新資料
  void update() async {
    var student = Student(
      id: 1,
      name: 'HKT',
      score: 100,
    );
    dbHelper.update(student.toMap());
    print('--- update 執行結束---');
  }

  //刪除資料
  void delete() async {
    final id = await dbHelper.queryRowCount();
    dbHelper.delete(id!);
    print('--- delete 執行結束---');
  }
}
