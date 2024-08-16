import 'dart:io';

import 'package:aplikasi_kasir/models/history_transaction.dart';
import 'package:aplikasi_kasir/models/items.dart';
import 'package:aplikasi_kasir/models/transaction_details.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static late DbHelper _instance;
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
      CREATE TABLE items (
        itemID INTEGER PRIMARY KEY AUTOINCREMENT,
        itemName TEXT,
        itemPrice INTEGER,
        itemStock INTEGER,
        itemImg BLOB
      )
    ''');

    await db.execute('''
      CREATE TABLE history_transaction (
        transactionID INTEGER PRIMARY KEY AUTOINCREMENT,
        transactionName TEXT,
        totalPrice INTEGER,
        dateTime DATETIME
      )
    ''');

    await db.execute('''
      CREATE TABLE transaction_details (
        detailsID INTEGER PRIMARY KEY AUTOINCREMENT,
        itemName TEXT,
        qty INTEGER,
        totalItemPrice INTEGER,
        historyID
      )
    ''');
  }

  // CRUD Item

  Future<List<Map<String, dynamic>>> selectItem() async {
    Database db = await initDb();
    var mapListItem = await db.query('items', orderBy: 'itemName');

    return mapListItem;
  }

  Future<int> insertItem(Items object) async {
    Database db = await initDb();
    int count = await db.insert('items', object.toMap());
    return count;
  }

  Future<int> updateItem(Items object) async {
    Database db = await initDb();
    int count = await db.update('items', object.toMap(),
        where: 'itemID=?', whereArgs: [object.itemID]);
    return count;
  }

  Future<int> deleteItem(Items object) async {
    Database db = await initDb();
    int count =
        await db.delete('items', where: 'itemID=?', whereArgs: [object.itemID]);

    return count;
  }

  Future<List<Items>> getItemsList() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query('items');

    return results.map((res) => Items.fromMap(res)).toList();
  }

  //CRUD History Transaction

  Future<List<Map<String, dynamic>>> selectHistory() async {
    Database db = await initDb();
    var mapListHistory =
        await db.query('history_transaction', orderBy: 'dateTime');

    return mapListHistory;
  }

  Future<int> insertHistory(HistoryTransaction object) async {
    Database db = await initDb();
    int count = await db.insert('history_transaction', object.toMap());
    return count;
  }

  Future<int> updateHistory(HistoryTransaction object) async {
    Database db = await initDb();
    int count = await db.update('history_transaction', object.toMap(),
        where: 'transactionID=?', whereArgs: [object.transactionID]);
    return count;
  }

  Future<int> deleteHistory(HistoryTransaction object) async {
    Database db = await initDb();
    int count = await db.delete('history_transaction',
        where: 'transactionID=?', whereArgs: [object.transactionID]);

    return count;
  }

  Future<List<HistoryTransaction>> getHistoryList() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query('history_transaction');

    return results.map((res) => HistoryTransaction.fromMap(res)).toList();
  }

  // CRUD Transaction Details

  Future<List<Map<String, dynamic>>> selectDetails() async {
    Database db = await initDb();
    var mapListDetails =
        await db.query('transaction_details', orderBy: 'historyID');

    return mapListDetails;
  }

  Future<int> insertDetails(TransactionDetails object) async {
    Database db = await initDb();
    int count = await db.insert('transaction_details', object.toMap());
    return count;
  }

  Future<int> updateDetails(TransactionDetails object) async {
    Database db = await initDb();
    int count = await db.update('transaction_details', object.toMap(),
        where: 'detailsID=?', whereArgs: [object.detailsID]);
    return count;
  }

  Future<int> deleteDetails(TransactionDetails object) async {
    Database db = await initDb();
    int count = await db.delete('transaction_details',
        where: 'historyID=?', whereArgs: [object.historyID]);

    return count;
  }

  Future<List<TransactionDetails>> getDetailsList() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query('transaction_details');

    return results.map((res) => TransactionDetails.fromMap(res)).toList();
  }

  factory DbHelper() {
    _instance = DbHelper._createObject();
    return _instance;
  }

  Future<Database> get database async {
    _database = await initDb();
    return _database;
  }
}
