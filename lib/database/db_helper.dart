import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static late DbHelper _dbHelper;
  static late Database _database;

  DbHelper._createObject();

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}items.db';
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);
    return itemDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ITEMS (
        itemID INTEGER PRIMARY KEY AUTOINCREMENT,
        itemName TEXT,
        itemPrice INTEGER,
        itemStock INTEGER,
        itemImg BLOB
      )
    ''');
  }
}
