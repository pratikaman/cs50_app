import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static const _databaseName = "Cs50DataBase.db";
  static const _databaseVersion = 1;
  static const table = 'notes';

  static const columnId = '_id';
  static const columnTitle = 'title';
  static const columnContent = 'content';

  /// singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  /// only have a single app-wide reference to the database
  var _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    /// lazily instantiate the database the first time it is accessed
    /// _initDatabase is defined the following lines.
    _database = await _initDatabase();
    return _database;
  }

  /// this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    /// get the apps directory.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    /// define the location to store the database in the app directory.
    String path = join(documentsDirectory.path, _databaseName);
    /// open the database if already exists or create if doesnt.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  /// SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $table ($columnId INTEGER PRIMARY KEY, $columnTitle TEXT NOT NULL, $columnContent TEXT)');
  }

  /// inserts a row in the database where each key in the Map is a column name
  /// and the value is the column value. The return value is the id of the
  /// inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  /// all of the rows are returned as a list of maps, where each map is
  /// a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  /// we are assuming here that the id column in the map is set. The other
  /// column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  /// deletes the row specified by the id. The number of affected rows is
  /// returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}