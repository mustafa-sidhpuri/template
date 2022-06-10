import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // making it a singleton class
  DatabaseHelper._internal();

  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() {
    return _instance;
  }

  String? _databaseName;
  int? _dbVersion;
  Database? _database;

  Future<Database> getDatabase(
      {required String databaseName, required int databaseVersion}) async {
    _databaseName = databaseName;
    _dbVersion = databaseVersion;
    _database ??= await _initiateDatabase();
    return _database!;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _databaseName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) {
    db.execute('''
     CREATE TABLE $_databaseName (
     id INTEGER PRIMARY KEY,
     Name TEXT NOT NULL
     ) 
     ''');
  }

  Future<int> insert(
      {required Map<String, dynamic> row,
      required String tableName,
      required String databaseName,
      required int dbVersion}) async {
    Database db = await _instance.getDatabase(
        databaseName: databaseName, databaseVersion: dbVersion);
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll(
      {required String tableName,
      required String databaseName,
      required int dbVersion}) async {
    Database db = await _instance.getDatabase(
        databaseName: databaseName, databaseVersion: dbVersion);
    return await db.query(tableName);
  }

  Future<int> update(
      {required Map<String, dynamic> row,
      required String tableName,
      required String databaseName,
      required int dbVersion}) async {
    Database db = await _instance.getDatabase(
        databaseName: databaseName, databaseVersion: dbVersion);
    int id = row["id"];
    return await db.update(tableName, row, where: "id = ?", whereArgs: [id]);
  }

  Future<int> delete(
      {required int id,
      required String tableName,
      required String databaseName,
      required int dbVersion}) async {
    Database db = await _instance.getDatabase(
        databaseName: databaseName, databaseVersion: dbVersion);
    return await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}
