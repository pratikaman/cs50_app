import 'package:final_project/utils/sqflite_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// enum for deciding what to do with a note.
enum AddNotes{
  add,
  edit,
}

/// change notifier provider for notes tab.
final notesProvider = ChangeNotifierProvider<_notesNotifier>((ref) {
  return _notesNotifier();
});

/// change notifier for notes tab.
/// it is used for state management.
class _notesNotifier extends ChangeNotifier {
  _notesNotifier();

  /// this list of maps store individual notes queried from database.
  /// each note is a map with note title as key and note content as value.
  /// in future app updates may define a model for note and use it in place
  /// of this map.
  List<Map<String, dynamic>> notes = [];

  /// reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  void insert(String title, String content) async {
    /// this row will be inserted in database table.
    Map<String, dynamic> row = {
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnContent: content,
    };
    /// insert the row and await for its completion.
    await dbHelper.insert(row);
    /// make afresh query to get the latest list of notes.
    /// this query function is defined in the following lines.
    query();
  }

  void query() async {
    /// query rows and await for its completion.
    final allRows = await dbHelper.queryAllRows();
    /// update the list of notes.
    notes = allRows;
    /// notify the listeners of this provider.
    notifyListeners();
  }

  void update(int Id, String title, String content) async {
    /// row with given "id" will be updated with given changes.
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: Id,
      DatabaseHelper.columnTitle: title,
      DatabaseHelper.columnContent: content,
    };
    /// update the row and await for completion.
    await dbHelper.update(row);
    /// make afresh query to get the latest list of notes.
    query();
  }

  void delete(int id) async {
    /// delete row with given "id" and await for completion.
    await dbHelper.delete(id);
    /// make afresh query to get the latest list of notes.
    query();
  }
}
